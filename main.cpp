#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>
QObject *rootObject;
void startJavaInterface();
QMediaPlayer *mMediaplayer;
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);QQuickStyle::setStyle("Material");
    RadioStatiosContainer Container;
    mMediaplayer = Container.mPlayer;
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
}

JNIEXPORT jint JNICALL Java_com_ahmed_QAndroidResultReceiver_jniExport_jniExport_intMethod
(JNIEnv *, jobject, jint focusChange){
    static int lastfocus = 0;
    switch (focusChange) {
    case AUDIOFOCUS_LOSS:
        mMediaplayer->pause();
        lastfocus = 1;
        break;
    case AUDIOFOCUS_LOSS_TRANSIENT:
        mMediaplayer->pause();
        lastfocus = 1;
        break;
    case AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK:
        mMediaplayer->pause();
        lastfocus = 1;
        break;
    case AUDIOFOCUS_GAIN:
        if(lastfocus) mMediaplayer->play();
        lastfocus =0;
        break;
    }
    //lastfocus = AUDIOFOCUS_LOSS;

    return 1;
}


JNIEXPORT jint JNICALL Java_com_ahmed_QAndroidResultReceiver_jniExport_jniExport_StringReceiver
(JNIEnv *env, jobject var2, jstring string){

    QString metadatastring(env->GetStringUTFChars(string, 0));
    qDebug()<<"niExport_StringReceiver "<<metadatastring;
    rootObject->setProperty("jniMsg", metadatastring);

    return 1;
}
