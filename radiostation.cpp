#include "radiostation.h"

Radiostation::Radiostation(QString var,QString Img,QString linkst,QString desc)
{
    _Name = var;
    _ImgSrc = Img;
    _Url = linkst;
    _Description = desc;
}

RadioStatiosContainer::RadioStatiosContainer(){
    radioModel.append(new Radiostation("Yabiladi Chaabi","qrc:/images/Radios/radio-yabiladi.jpg","http://37.187.146.76:8100/;stream.mp3","This is a Description"));
    radioModel.append(new Radiostation("Yabiladi","qrc:/images/Radios/radio-yabiladi.png","http://37.187.146.76:8000/;","This is a Description"));
    radioModel.append(new Radiostation("Hitradio","qrc:/images/Radios/radio-hit-radio.jpg","http://hitradio-maroc.ice.infomaniak.ch/hitradio-maroc-128.mp3","This is a Description"));
    radioModel.append(new Radiostation("Medi 1","qrc:/images/Radios/radio-medi-1-radio.png","http://media.yabiladi.com:8000","This is a Description"));
    radioModel.append(new Radiostation("Radio 2M","qrc:/images/Radios/radio-2m.png","http://radio2m.scdn.arkena.com/live.mp3","This is a Description"));
    radioModel.append(new Radiostation("Chada FM","qrc:/images/Radios/radio-chadafm.jpg","http://broadcast.infomaniak.net/chadafm-high.mp3","This is a Description"));
    radioModel.append(new Radiostation("Radio SAWA","qrc:/images/Radios/radiosawa.png","http://173.213.80.218:8000/;stream.mp3","This is a Description"));
    radioModel.append(new Radiostation("Luxe Radio","qrc:/images/Radios/radio-luxeradio.jpeg","http://68.168.118.115:8000/","This is a Description"));
    radioModel.append(new Radiostation("Medina FM","qrc:/images/Radios/radio-medina-fm.jpg","http://medinafm.ice.infomaniak.ch/medinafm-64.mp3","This is a Description"));
    radioModel.append(new Radiostation("MedRadio","qrc:/images/Radios/radio-med-radio_1.png","http://medradio-maroc.ice.infomaniak.ch/medradio-maroc-64.mp3","This is a Description"));
    radioModel.append(new Radiostation("Radio Plus","qrc:/images/Radios/radioplus.jpeg","http://149.202.139.76:8000/marrakech.mp3","This is a Description"));
    radioModel.append(new Radiostation("Radio MFM","qrc:/images/Radios/radio-mfm.png","http://radio.mfmradio.ma/casa.mp3","This is a Description"));
    radioModel.append(new Radiostation("Radio Mars","qrc:/images/Radios/radiomars.png","http://radiomars.ice.infomaniak.ch/radiomars-128.mp3","This is a Description"));
    radioModel.append(new Radiostation("Radio Chabab","qrc:/images/Radios/radiochabab1.jpg","http://listen.radionomy.com/rjm1","This is a Description"));
    radioModel.append(new Radiostation("Aswat","qrc:/images/Radios/radio-aswat.jpg","http://broadcaster.infomaniak.ch/aswat-high.mp3","This is a Description"));
    radioModel.append(new Radiostation("capradio","qrc:/images/Radios/radio-capradio.png","","This is a Description"));
    radioModel.append(new Radiostation("Radio Orient","qrc:/images/Radios/radio-orient-fm.png","http://stream3.broadcast-associes.com:8405/Radio-Orient","This is a Description"));
    radioModel.append(new Radiostation("Radio Soleil","qrc:/images/Radios/radio-soleil.png","http://radiosoleil.ice.infomaniak.ch/radiosoleil-128.mp3","This is a Description"));
    radioModel.append(new Radiostation("Hit Radio Dancefloor","qrc:/images/Radios/radio-hit-radio-dancefloor.jpg","http://dancefloor.ice.infomaniak.ch/dancefloor-128.mp3","This is a Description"));
    radioModel.append(new Radiostation("Hit Radio RnB","qrc:/images/Radios/radio-hit-radio-rnb.png","http://rnb.ice.infomaniak.ch/rnb-128.mp3","This is a Description"));
    radioModel.append(new Radiostation("Hit Radio mgharba","qrc:/images/Radios/radio-hit-radio-mgharba.png","http://mgharba.ice.infomaniak.ch/mgharba-128.mp3","This is a Description"));
    radioModel.append(new Radiostation("Hit Radio Buzz","qrc:/images/Radios/radio-hit-radio-buzz.jpg","http://hitradio-maroc.ice.infomaniak.ch/hitradio-maroc-128.mp3","This is a Description"));
    radioModel.append(new Radiostation("Radio Star","qrc:/images/Radios/radio-starmaroc-fm.png","http://streaming.radionomy.com/RadioStarMaroc","This is a Description"));
    radioModel.append(new Radiostation("Radio Itran","qrc:/images/Radios/radio-itran.jpg","http://streaming.radionomy.com/ChezWattfr","This is a Description"));
    radioModel.append(new Radiostation("Radio HabaYiib","qrc:/images/Radios/radio-habayiib.png","http://85.214.110.29:8000/;","This is a Description"));
    radioModel.append(new Radiostation("izlan","qrc:/images/Radios/radio-izlan.png","http://philae.shoutca.st:8370/;","This is a Description"));
    radioModel.append(new Radiostation("Radio Marrakech","qrc:/images/Radios/radio-marrakech.png","http://95.141.24.70/;","This is a Description"));
    radioModel.append(new Radiostation("Radio PlanetHouse","qrc:/images/Radios/radio-planet-house.png","http://streaming.radionomy.com/Surf-Radio-Clubbing","This is a Description"));
    radioModel.append(new Radiostation("Rif Melody","qrc:/images/Radios/radio-rif-melody-radio.png","http://music.rifmelody.com/script-XwpD451s/Moustapha_Terakaa_Vol2-2011/Mp3/Moustapha%20Terakaa%20Vol2%202011%20-%20Piste%2001.mp3","This is a Description"));
    radioModel.append(new Radiostation("Only Rai","qrc:/images/Radios/radio-only-rai.png","http://broadcast.infomaniak.net/onlyrai-high.mp3","This is a Description"));
    radioModel.append(new Radiostation("Monte Carlo","qrc:/images/Radios/radio-monte-carlo-doualiya.png","http://mc-doualiya.scdn.arkena.com/mc-doualiya.mp3","This is a Description"));
    radioModel.append(new Radiostation("Ness Radio","qrc:/images/Radios/radio-ness-radio.png","http://radio.nessradio.net:8000/nessradio.mp3","This is a Description"));
    radioModel.append(new Radiostation("Radio ITMA","qrc:/images/Radios/radio-itma.png","http://streaming.radionomy.com/radio-itma?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6","This is a Description"));
    radioModel.append(new Radiostation("MarocMusic","qrc:/images/Radios/radio-maroc-music.jpg","http://streaming.radionomy.com/MarocMusic?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6","This is a Description"));
    radioModel.append(new Radiostation("Radio Sawte Ouarzazate","qrc:/images/Radios/radio-sawte-ouarzazate.png","http://server7.mp3quran.net:8014/;","This is a Description"));
    radioModel.append(new Radiostation("Anwa Rock","qrc:/images/Radios/radio-anwarock.jpg","http://streaming.radionomy.com/Anwa-rock?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6","This is a Description"));
    radioModel.append(new Radiostation("Medi1 Soufi","qrc:/images/Radios/radio-soufi.png","http://live.medi1.com/Soufi","This is a Description"));
    radioModel.append(new Radiostation("Medi1 Andalouse","qrc:/images/Radios/radio-andalousse.png","http://live.medi1.com/Andalouse","This is a Description"));
    radioModel.append(new Radiostation("Medi1 Tarab","qrc:/images/Radios/radio-tarab.png","http://live.medi1.com/Tarab","This is a Description"));
    settings = new QSettings("Ahmed Soft", "Radios");
    QVariantList reading = settings->value("favlist").toList();
    QList<QString> tmp2;
    foreach(QVariant v, reading) tmp2 << v.toString();
    FillingFavorites(tmp2);
    searchALL("");
    searchFavorites("");
    mPlayer = new QMediaPlayer(this, QMediaPlayer::StreamPlayback);
    connect(mPlayer, SIGNAL(mediaStatusChanged(QMediaPlayer::MediaStatus)),
            this, SLOT(statusChanged(QMediaPlayer::MediaStatus)));
    // connect(mPlayer, SIGNAL(bufferStatusChanged(int)), slider, SLOT(setValue(int)));
}

QList<QObject*> RadioStatiosContainer::getRadioList(){
    return Result;
}

QList<QObject*> RadioStatiosContainer::getFavoritesRadioList(){

    return FavoritesResult;
}

void RadioStatiosContainer::FillingFavorites(const QList<QString> data){
    favoritesModel.clear();
    for(int i =0;i<data.count();i++){
        for(int j=0;i<radioModel.count();j++){
            if(radioModel.at(j)->Name() == data.at(i)){
                favoritesModel.append(new Radiostation(radioModel.at(j)->Name(),radioModel.at(j)->ImgSrc(),radioModel.at(j)->Url(),radioModel.at(j)->Description()));
                break;
            }
        }
    }
    //qDebug()<<"count :"<<tmp.count();
}

void RadioStatiosContainer::searchALL(const QString msg){
    Result.clear();
    for(int i = 0; i<radioModel.count();i++){
        if(radioModel.at(i)->Name().contains(msg,Qt::CaseInsensitive)){
            Result.append(new Radiostation(radioModel.at(i)->Name(),radioModel.at(i)->ImgSrc(),radioModel.at(i)->Url(),radioModel.at(i)->Description()));
        }
    }
}

void RadioStatiosContainer::searchFavorites(const QString msg){
    FavoritesResult.clear();
    for(int i = 0; i<favoritesModel.count();i++){
        if(favoritesModel.at(i)->Name().contains(msg,Qt::CaseInsensitive) || msg == "NULL"){
            FavoritesResult.append(new Radiostation(favoritesModel.at(i)->Name(),favoritesModel.at(i)->ImgSrc(),favoritesModel.at(i)->Url(),favoritesModel.at(i)->Description()));
        }
    }
}
void RadioStatiosContainer::exitApp(const int cmd){
#ifdef Q_OS_ANDROID
    QtAndroid::androidActivity().callMethod<int>("exitapplication", "(I)I",cmd);
#endif
}

void RadioStatiosContainer::playRadioStation(const QString id){
#ifdef Q_OS_ANDROID
    QAndroidJniObject mediaMetadataRetriever;
#endif
    mPlayer->stop();
    for(int i=0;i<radioModel.count();i++){
        if(radioModel.at(i)->Name() == id){
            mPlayer->setMedia(QUrl(radioModel.at(i)->Url()));
#ifdef Q_OS_ANDROID
            mediaMetadataRetriever = QAndroidJniObject::fromString(radioModel.at(i)->Url());
#endif
            break;
        }
    }
    mPlayer->setVolume(100);
    mPlayer->play();
    //______get the metadate string based in the URL
#ifdef Q_OS_ANDROID
    QAndroidJniObject::callStaticMethod<void>("com/ahmed/radios/NotificationClient",
                                              "getmetadata",
                                              "(Ljava/lang/String;)V",
                                              mediaMetadataRetriever.object<jstring>());
#endif
}
RadioStatiosContainer::~RadioStatiosContainer(){
    //delete radioModel, Result, favoritesModel, FavoritesResult, mPlayer, settings;
}
int RadioStatiosContainer::togglePlayer(const int id){
    if(mPlayer->state() == QMediaPlayer::PlayingState || mPlayer->state() == QMediaPlayer::PausedState){
        mPlayer->stop();
        return 0;
    }else if(mPlayer->isAudioAvailable())
        mPlayer->play();
    return 1;
}
int RadioStatiosContainer::isplaying(){
    //if(mPlayer->state())
}

int RadioStatiosContainer::addtofavorites(const QString station){
    QVariantList reading = settings->value("favlist").toList();
    QList<QString> tmp;
    foreach(QVariant v, reading) tmp << v.toString();
    foreach(QString v, tmp) if(station == v && station == "") return 0;
    tmp.append(station);

    if (tmp.count()>0)  FillingFavorites(tmp);

    reading.clear();

    foreach(QString v, tmp){ reading << v; qDebug()<<"foreach :"<<v;}
    settings->setValue("favlist", reading);


    return 1;
}
int RadioStatiosContainer::clairfavorites(){
    settings->remove("favlist");
    FavoritesResult.clear();
    favoritesModel.clear();
    return 1;
}
void RadioStatiosContainer::schedule(const int interval){
    qDebug()<<"RadioStatiosContainer::schedule(const int interval)";
    //Worker *worker = new Worker;
    //worker->moveToThread(&workerThread);
    //connect(&workerThread, &QThread::finished, worker, &QObject::deleteLater);
    //connect(this, &RadioStatiosContainer::operate, worker, &Worker::doWork);
    //connect(worker, &Worker::resultReady, this, &RadioStatiosContainer::scheduletimeout);
    //qDebug()<<"connect(worker, &Worker::resultReady, this, &RadioStatiosContainer::scheduletimeout);";
    //emit operate();

    workerThread = new WorkerThread();
    connect(workerThread, &WorkerThread::resultReady, this, &RadioStatiosContainer::scheduletimeout);
    connect(workerThread, &WorkerThread::tic, this, &RadioStatiosContainer::schedule_tic);
    connect(this, &RadioStatiosContainer::operate, workerThread, &WorkerThread::setinterval);
    connect(workerThread, &WorkerThread::finished, workerThread, &QObject::deleteLater);
    emit operate(interval);
    workerThread->start();
}
void RadioStatiosContainer::scheduleInterruption(){
    workerThread->InterruptionRequested();
}
