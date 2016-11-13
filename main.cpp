#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>
#include <QSettings>
#include <QVariant>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);QQuickStyle::setStyle("Material");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //qRegisterMetaTypeStreamOperators<QList<QString> >("QList<QString>");

    RadioStatiosContainer Container;
    QQmlApplicationEngine engine;
    QSettings settings("Ahmed Soft", "Radios");
    QVariantList timeList;
    //QList<QString> tmp;

    timeList<<"Yabiladi"<<"Hitradio"<<"MedRadio";

    //settings.setValue("timeList", timeList);

    qDebug() << "tmp result is : "<<timeList.count();
    QVariantList reading = settings.value("timeList").toList();
    qDebug() << "myList2 result is : "<<reading.count();

    QList<QString> tmp2;
    foreach(QVariant v, reading) tmp2 << v.toString();

    qDebug() << "tmp2 result is : "<<tmp2.count();
    qDebug() << "OK test"<<tmp2.at(1);

    Container.FillingFavorites(tmp2);

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("radioStatiosContainer", &Container);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}
