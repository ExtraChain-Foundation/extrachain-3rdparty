#ifndef BLURHASH_H
#define BLURHASH_H

#include <cmath>
#include <utility>

#include <QMap>
#include <QObject>
#include <QQuickImageProvider>
#include <QQuickImageResponse>
#include <QUrlQuery>

#include <QRunnable>
#include <QThreadPool>
#include <QtConcurrent/QtConcurrent>

class BlurHashImageRunnable : public QObject, public QRunnable {
    Q_OBJECT
public:
    BlurHashImageRunnable(QString id, QSize requestedSize);

    void run() override;
signals:
    void done(QImage result);
    void error(const QString &message);
private:
    QString m_id;
    QSize m_requestedSize;

    const static QMap<QChar, int> base83Map;
    static constexpr double pi = 3.1415926;

    QVector<float> decodeDc(int colorEnc) const;
    QVector<float> decodeAc(int colorEnc, float maxAc) const;
    float srgbToLinear(int colorEnc) const;
    int linearToSrgb(float value) const;
    float signPow(float value, float exp) const;
    int decodeBase83(QStringRef ref) const;
};

class BlurHashImageResponse : public QQuickImageResponse {
    Q_OBJECT
public:
    BlurHashImageResponse(const QString &id, const QSize &requestedSize);

    QQuickTextureFactory *textureFactory() const override;


    QString errorString() const override { return m_errorString; }


private:
    QString m_errorString;
    QImage m_image;

private slots:
    void handleDone(QImage result);

    void failWithError(QString errorMessage);
};

class BlurhashDummy : public QObject {
    Q_OBJECT
public:
    BlurhashDummy(QObject *parent = nullptr) : QObject(parent) {}
};

class BlurHashImageProvider : public QQuickAsyncImageProvider {
public:
    QQuickImageResponse *requestImageResponse(const QString &id, const QSize &requestedSize) override;
};

#endif // BLURHASH_H
