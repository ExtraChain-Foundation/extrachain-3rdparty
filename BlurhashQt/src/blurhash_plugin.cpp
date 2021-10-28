#include "blurhash_plugin.h"

#include "blurhash.h"

#include <qqml.h>

void BlurhashPlugin::registerTypes(const char *uri) {
    // @uri nl.netsoj.chris.blurhash
    Q_UNUSED(uri)
    // Without registering this dummy object, QML seems to complain
    // that this module is not installed, even though it is.
    qmlRegisterType<BlurhashDummy>(uri, 1, 0, "BlurhashDummy");
}

void BlurhashPlugin::initializeEngine(QQmlEngine *engine, const char *uri) {
    Q_UNUSED(uri)
    engine->addImageProvider("blurhash", new BlurHashImageProvider);
}

