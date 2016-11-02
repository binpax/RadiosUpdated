#ifndef RADIOSTATION_H
#define RADIOSTATION_H
#include <QObject>
#include <QList>

class Radiostation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Name READ Name  )
    Q_PROPERTY(QString ImgSrc READ ImgSrc  )
    Q_PROPERTY(QString Url READ Url  )
    Q_PROPERTY(QString Description READ Description  )
    Q_PROPERTY(QString countR READ countR  )

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

};

void fillingData(QList<QObject *> &radioModel);
#endif // RADIOSTATION_H
