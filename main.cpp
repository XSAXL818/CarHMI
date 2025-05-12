#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QtWebEngineQuick>
#include <QtWebEngineQuick/qtwebenginequickglobal.h>
#include "ProcessLauncher.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    QtWebEngineQuick::initialize();

    qmlRegisterType<ProcessLauncher>("Launcher", 1, 0, "ProcessLauncher");

    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("CarHMI", "Main");

    // QQmlApplicationEngine engine1;
    // engine1.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
