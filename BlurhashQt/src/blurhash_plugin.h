#ifndef QTBLURHASH_PLUGIN_H
#define QTBLURHASH_PLUGIN_H

#include <QObject>
#include <QQmlExtensionPlugin>

class BlurhashPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
    void initializeEngine(QQmlEngine *engine, const char *uri) override;
};

#endif // QTBLURHASH_PLUGIN_H
