#ifndef RADIOSTATION_H
#define RADIOSTATION_H
#include <QObject>
#include <QList>
#include "qdebug.h"
#include <QMediaPlayer>
#include <QSettings>
#include <QVariant>
#include <QtCore>

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
    //void newStatusChanged(const int &subject);
public slots:
void statusChanged(QMediaPlayer::MediaStatus status)
    {
        emit newStatusChanged(status);
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
    Q_INVOKABLE void togglePlayer(const int id = 0);
    Q_INVOKABLE int addtofavorites(const QString ="NULL");

    QMediaPlayer *mPlayer;

private:
    QList<QObject*> FavoritesResult;
    QList<QObject*> Result;
    QList<Radiostation *> favoritesModel;
    QList<Radiostation *> radioModel;
    QSettings *settings;

};

class MediaPlayerHundler : public QObject {
    Q_OBJECT
    QMediaPlayer *mPlayer;
public:
    MediaPlayerHundler(){}
};

#endif // RADIOSTATION_H
