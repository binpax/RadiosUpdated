#ifndef RADIOSTATION_H
#define RADIOSTATION_H
#include <QObject>
#include <QList>
#include <QMediaPlayer>
#include <QSettings>
#include <QVariant>
#include <QtCore>
#include <QThread>
//#ifdef Q_OS_ANDROID
//#include <QtAndroidExtras/QAndroidJniObject>
//#endif

#include "qdebug.h"


#define AUDIOFOCUS_GAIN 1
#define AUDIOFOCUS_LOSS -1
#define AUDIOFOCUS_LOSS_TRANSIENT -2
#define AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK -3
#define BACK_BUTTON_PRESSED 2

class WorkerThread : public QThread
{
    Q_OBJECT
    int interval;
    bool isInterruptionRequested = false;
    void run() Q_DECL_OVERRIDE {
        QString result;
        //qDebug()<<"one shot ";
        for(int i=0; i<interval;i++){
            QThread::sleep(1);
            emit tic(i);
            //qDebug()<<"one shot "<<i;
            if(isInterruptionRequested){
                isInterruptionRequested=false;
                return;
            }
        }
        emit resultReady();
    }
public slots:
    void setinterval(const int interval){
        this->interval = interval;
    }
    void InterruptionRequested(){
        this->isInterruptionRequested = true;
    }

signals:
    void resultReady();
    void tic(const int timeleft);
};


class Radiostation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Name READ Name CONSTANT )
    Q_PROPERTY(QString ImgSrc READ ImgSrc  NOTIFY textChanged)
    Q_PROPERTY(QString Url READ Url NOTIFY textChanged )
    Q_PROPERTY(QString Description READ Description NOTIFY textChanged )
    Q_PROPERTY(QString countR READ countR NOTIFY textChanged )

public:
    Radiostation(QString ,QString ,QString ,QString );

    QString Name() const {
        return _Name;
    }
    QString ImgSrc() const {
        return _ImgSrc;
    }
    QString Url() const {
        return _Url;
    }
    QString Description() const {
        return _Description;
    }
    int countR() const {
        return 0;
    }
    QList<Radiostation *> List() const {
        return _List;
    }
    static QList<Radiostation *> _List;
private:
    QString _Name;
    QString _ImgSrc;
    QString _Url;
    QString _Description;

signals:
    void textChanged();

};

class RadioStatiosContainer : public QObject
{
    Q_OBJECT
signals:
    void newStatusChanged(const int &subject);
    void operate(const int interval);
    void updatetimeleft(const int timeleft);
    void closeApp();

public slots:
    void statusChanged(QMediaPlayer::MediaStatus status)
    {
        emit newStatusChanged(status);
    }
    void testslot()
    {
        qDebug()<<"test signal received";
    }
    void scheduletimeout()
    {
        //exitApp(1);
        //qDebug()<<"foreach timer";
    }
    void schedule_tic(const int timeleft)
    {
        emit updatetimeleft(timeleft);
    }
public:
    RadioStatiosContainer();
    ~RadioStatiosContainer();

    void FillingFavorites(const QList<QString> data);
    Q_INVOKABLE void searchALL(const QString ="NULL");
    Q_INVOKABLE void searchFavorites(const QString ="NULL");
    Q_INVOKABLE  QList<QObject *> getRadioList();
    Q_INVOKABLE  QList<QObject *> getFavoritesRadioList();//const QString ="NULL"
    Q_INVOKABLE void playRadioStation(const QString id);

    Q_INVOKABLE int togglePlayer(const int id = 0);
    Q_INVOKABLE int isplaying();
    Q_INVOKABLE void exitApp(const int);

    Q_INVOKABLE int addtofavorites(const QString ="NULL");
    Q_INVOKABLE int clairfavorites();

    Q_INVOKABLE void schedule(const int);
    Q_INVOKABLE void scheduleInterruption();
    QMediaPlayer *mPlayer;
    WorkerThread *workerThread;
private:
    QList<QObject*> FavoritesResult;
    QList<QObject*> Result;
    QList<Radiostation *> favoritesModel;
    QList<Radiostation *> radioModel;
    QSettings *settings;
};

#ifdef Q_OS_ANDROID
#include <QtAndroid>


extern "C" {
JNIEXPORT jint JNICALL Java_com_ahmed_QAndroidResultReceiver_jniExport_jniExport_intMethod
(JNIEnv *, jobject, jint);

JNIEXPORT jint JNICALL Java_com_ahmed_QAndroidResultReceiver_jniExport_jniExport_StringReceiver
(JNIEnv *var1, jobject var2, jstring string);
}
#endif
#endif // RADIOSTATION_H
