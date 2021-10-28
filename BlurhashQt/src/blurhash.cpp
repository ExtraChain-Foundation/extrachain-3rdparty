#include "blurhash.h"

BlurHashImageRunnable::BlurHashImageRunnable(QString id, QSize requestedSize)
    : m_id(id), m_requestedSize(requestedSize) {}

void BlurHashImageRunnable::run() {
    // Parse urls in the form of "<blurhash>"?punch=<punch>
    QUrl request(m_id);
    QString blurhash = request.path();
    QUrlQuery params(request.query());
    QString punchString = params.queryItemValue("punch");
    float punch = 1.0;
    if (!punchString.isEmpty()) {
        bool ok;
        float parsed = punchString.toFloat(&ok);
        if (ok) punch = parsed;
    }
    if (blurhash.size() < 6) {
        emit error("Blurhash string too short");
        return;
    }
    int numCompEnc = decodeBase83(QStringRef(std::addressof(blurhash), 0, 1));
    int numCompX = (numCompEnc % 9) + 1;
    int numCompY = (numCompEnc / 9) + 1;
    int expectedBlurHashSize = 4 + 2 * numCompX * numCompY;

    if (blurhash.size() != expectedBlurHashSize) {
        emit error(QString("Expected blurhash of size %1, got one of size %2").arg(expectedBlurHashSize).arg(blurhash.size()));
        return;
    }

    float maxAcEnc = decodeBase83(QStringRef(std::addressof(blurhash), 1, 1));
    float maxAc = (maxAcEnc + 1) / 166.0;
    QVector<QVector<float>> colors;
    colors.reserve(numCompX * numCompY);
    colors.push_back(decodeDc(decodeBase83(QStringRef(std::addressof(blurhash), 2, 4))));


    for (int i = 6; i < blurhash.size(); i += 2) {
        colors.push_back(decodeAc(decodeBase83(QStringRef(std::addressof(blurhash), i, 2)), maxAc * punch));
    }

    QImage result(m_requestedSize.isEmpty() ? QSize(32, 32) : m_requestedSize, QImage::Format_ARGB32);
    result.fill(QColor::fromRgb(0, 0, 0));

    for (int y = 0; y < result.height(); y++) {
        for (int x = 0; x < result.width(); x++) {
            float r = 0, g = 0, b = 0;
            for (int j = 0; j < numCompY; j++) {
                for (int i = 0; i < numCompX; i++) {
                    double cosX = cos(pi * static_cast<double>(x * i) / static_cast<double>(result.width()));
                    double cosY = cos(pi * static_cast<double>(y * j) / static_cast<double>(result.height()));
                    float basis = static_cast<float>(cosX * cosY);
                    const QVector<float> &color = colors[j * numCompX + i];
                    r += color[0] * basis;
                    g += color[1] * basis;
                    b += color[2] * basis;
                }
            }
            QColor color = QColor::fromRgb(linearToSrgb(r), linearToSrgb(g), linearToSrgb(b));
            result.setPixelColor(x, y, color);
        }
    }
    emit done(result);
}


int BlurHashImageRunnable::linearToSrgb(float value) const {
    float v = fmax(0.0, fmin(1.0, value));
    return v <= 0.0031308 ?
                static_cast<int>(v * 12.92 * 255.0 + 0.5)
              : static_cast<int>((1.055 * powf(v, 1 / 2.4) - 0.055) * 255.0 + 0.5);
}

QVector<float> BlurHashImageRunnable::decodeDc(int colorEnc) const {
    int r =  colorEnc >> 16;
    int g = (colorEnc >> 8 ) & 255;
    int b =  colorEnc        & 255;
    return { srgbToLinear(r), srgbToLinear(g), srgbToLinear(b) };
}

float BlurHashImageRunnable::srgbToLinear(int colorEnc) const {
    float v = colorEnc / 255.f;
    return v <= 0.04045 ? (v / 12.92f) : powf((v + 0.055f) / 1.055f, 2.4f);
}

QVector<float> BlurHashImageRunnable::decodeAc(int colorEnc, float maxAc) const {
    int r = colorEnc / (19 * 19);
    int g = (colorEnc / 19) % 19;
    int b = colorEnc % 19;
    return {
        signPow((r - 9.0) / 9.0, 2.0) * maxAc,
        signPow((g - 9.0) / 9.0, 2.0) * maxAc,
        signPow((b - 9.0) / 9.0, 2.0) * maxAc,
    };
}

int BlurHashImageRunnable::decodeBase83(QStringRef ref) const{
    int result = 0;
    for (const QChar &c: ref) {
        int val = base83Map[c];
        result = result * 83 + val;
    }
    return result;
}

float BlurHashImageRunnable::signPow(float value, float exp) const {
    return copysignf(powf(abs(value), exp), value);
}

using Qip = std::pair<QChar, int>;
const QMap<QChar, int> BlurHashImageRunnable::base83Map = {
    Qip('0', 0),
    Qip('1', 1),
    Qip('2', 2),
    Qip('3', 3),
    Qip('4', 4),
    Qip('5', 5),
    Qip('6', 6),
    Qip('7', 7),
    Qip('8', 8),
    Qip('9', 9),
    Qip('A', 10),
    Qip('B', 11),
    Qip('C', 12),
    Qip('D', 13),
    Qip('E', 14),
    Qip('F', 15),
    Qip('G', 16),
    Qip('H', 17),
    Qip('I', 18),
    Qip('J', 19),
    Qip('K', 20),
    Qip('L', 21),
    Qip('M', 22),
    Qip('N', 23),
    Qip('O', 24),
    Qip('P', 25),
    Qip('Q', 26),
    Qip('R', 27),
    Qip('S', 28),
    Qip('T', 29),
    Qip('U', 30),
    Qip('V', 31),
    Qip('W', 32),
    Qip('X', 33),
    Qip('Y', 34),
    Qip('Z', 35),
    Qip('a', 36),
    Qip('b', 37),
    Qip('c', 38),
    Qip('d', 39),
    Qip('e', 40),
    Qip('f', 41),
    Qip('g', 42),
    Qip('h', 43),
    Qip('i', 44),
    Qip('j', 45),
    Qip('k', 46),
    Qip('l', 47),
    Qip('m', 48),
    Qip('n', 49),
    Qip('o', 50),
    Qip('p', 51),
    Qip('q', 52),
    Qip('r', 53),
    Qip('s', 54),
    Qip('t', 55),
    Qip('u', 56),
    Qip('v', 57),
    Qip('w', 58),
    Qip('x', 59),
    Qip('y', 60),
    Qip('z', 61),
    Qip('#', 62),
    Qip('$', 63),
    Qip('%', 64),
    Qip('*', 65),
    Qip('+', 66),
    Qip(',', 67),
    Qip('-', 68),
    Qip('.', 69),
    Qip(':', 70),
    Qip(';', 71),
    Qip('=', 72),
    Qip('?', 73),
    Qip('@', 74),
    Qip('[', 75),
    Qip(']', 76),
    Qip('^', 77),
    Qip('_', 78),
    Qip('{', 79),
    Qip('|', 80),
    Qip('}', 81),
    Qip('~', 82)
};

BlurHashImageResponse::BlurHashImageResponse(const QString &id, const QSize &requestedSize) {
    BlurHashImageRunnable *runnable = new BlurHashImageRunnable(id, requestedSize);
    connect(runnable, &BlurHashImageRunnable::done, this, &BlurHashImageResponse::handleDone);
    connect(runnable, &BlurHashImageRunnable::error, this, &BlurHashImageResponse::failWithError);
    QThreadPool::globalInstance()->start(runnable);
}

void BlurHashImageResponse::handleDone(QImage result) {
    m_image = result;
    emit finished();
}

void BlurHashImageResponse::failWithError(QString errorMessage) {
    m_errorString = errorMessage;
    emit finished();
};

QQuickTextureFactory *BlurHashImageResponse::textureFactory() const {
    return QQuickTextureFactory::textureFactoryForImage(m_image);
}

QQuickImageResponse *BlurHashImageProvider::requestImageResponse(const QString &id, const QSize &requestedSize) {
    return new BlurHashImageResponse(id, requestedSize);
}
