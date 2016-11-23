#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QDebug>
#include "notificationclient.h"
#include <QMessageBox>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);QQuickStyle::setStyle("Material");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    RadioStatiosContainer Container;
    QQmlApplicationEngine engine;

    NotificationClient *notificationClient = new NotificationClient(&engine);
    notificationClient->setNotification("hello hada ana");

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("radioStatiosContainer", &Container);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}
