#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QDebug>
#include "notificationclient.h"
#include <QMessageBox>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);


    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    NotificationClient *notificationClient = new NotificationClient(&engine);
    notificationClient->setNotification("hello hada ana");

    return app.exec();
}
