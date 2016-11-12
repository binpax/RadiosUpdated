#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");
    RadioStatiosContainer myClass;
    QQmlApplicationEngine engine;
    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("radioStatiosContainer", &myClass);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}
