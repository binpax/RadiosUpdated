#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);QQuickStyle::setStyle("Material");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //qRegisterMetaTypeStreamOperators<QList<QString> >("QList<QString>");
    QMediaPlayer *mPlayer;
    RadioStatiosContainer Container;
    QQmlApplicationEngine engine;

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("radioStatiosContainer", &Container);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}
