#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QMediaPlayer>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    QMediaPlayer* player = new QMediaPlayer(0, QMediaPlayer::StreamPlayback);
    player->setMedia(QUrl("http://vpr.streamguys.net/vpr64.mp3"));
    player->setVolume(80);
    player->play();

    return app.exec();
}
