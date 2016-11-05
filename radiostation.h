#ifndef RADIOSTATION_H
#define RADIOSTATION_H
#include <QObject>
#include <QList>

#include <iostream>
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
        return 0;//_countR;
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
public:
    RadioStatiosContainer();

    Q_INVOKABLE QString search(const QString msg) {
        //qDebug() << "Called the C++ method with" << msg;
        return msg;
    }

    Q_INVOKABLE void clear() {
        //qDebug() << "Called the C++ method with" << msg;
        std::cout<<"testinggggg";
    }
    Q_INVOKABLE  QList<QObject *> getRadioList();
public slots:
    Q_INVOKABLE void search2(QString msg) {
        std::cout<< "Called the C++ method with" << msg.toStdString();
    }

private:
    QList<Radiostation *> radioModel;
};
class invokeclass : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE void cppMethod(const QString &msg) {
        std::cout<< "Called the C++ method with" << msg.toStdString();
    }

public slots:
    void cppSlot(int number) {
        std::cout<< "Called the C++ slot with" << number;
    }
};

void InitData(QList<Radiostation *> &radioModel);
void fillingData(QList<QObject*> &dest,const QList<Radiostation*> src);
#endif // RADIOSTATION_H
