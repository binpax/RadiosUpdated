#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>
QObject *rootObject;
void startJavaInterface();
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);QQuickStyle::setStyle("Material");
    RadioStatiosContainer Container;
    QQmlApplicationEngine engine;

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("radioStatiosContainer", &Container);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    rootObject = engine.rootObjects().first();
    rootObject->setProperty("jniMsg", "true");
    startJavaInterface();
    return app.exec();
}
void startJavaInterface(){
    QAndroidJniObject javaNotification = QAndroidJniObject::fromString("m_notification");
    QAndroidJniObject::callStaticMethod<void>("com/ahmed/radios/NotificationClient",
                                       "notify",
                                       "(Ljava/lang/String;)V",
                                       javaNotification.object<jstring>());
    qDebug()<<"hell";
}
