#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
    //init
    QGuiApplication app(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");
    //main varialbes
    RadioStatiosContainer myClass;
    invokeclass Invokeclass;
    //loading engine
    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    //affecting data
    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("radioModel", QVariant::fromValue(myClass.getRadioList()));
    ctxt->setContextProperty("myObject", &myClass);
    ctxt->setContextProperty("invokeclass", &Invokeclass);
    return app.exec();
}
