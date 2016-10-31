#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>
#include "radiostation.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QList<Radiostation*> radioModel;
    fillingData(radioModel);

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("radioModel", QVariant::fromValue(radioModel));

    QMediaPlayer* player = new QMediaPlayer(0, QMediaPlayer::StreamPlayback);
    player->setMedia(QUrl("http://vpr.streamguys.net/vpr64.mp3"));
    player->setVolume(80);
    player->play();

    return app.exec();
}
