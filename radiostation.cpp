#include "radiostation.h"

Radiostation::Radiostation(QString var,QString Img,QString linkst,QString desc)
{
    _Name = var;
    _ImgSrc = Img;
    _Url = linkst;
    _Description = desc;
}

void fillingData(QList<Radiostation*> &radioModel){
radioModel.append(new Radiostation("Yabiladi Chaabi","qrc:/images/Radios/radio-yabiladi.png","http://37.187.146.76:8100/;stream.mp3","This is a Description"));
radioModel.append(new Radiostation("Yabiladi","qrc:/images/Radios/radio-yabiladi.png","http://37.187.146.76:8000/;","This is a Description"));
radioModel.append(new Radiostation("Hitradio","qrc:/images/Radios/hit-radio.png","http://hitradio-maroc.ice.infomaniak.ch/hitradio-maroc-128.mp3","This is a Description"));
radioModel.append(new Radiostation("Medi 1","qrc:/images/Radios/medi-1-radio.jpg","http://media.yabiladi.com:8000","This is a Description"));
radioModel.append(new Radiostation("Radio 2M","qrc:/images/Radios/radio-2m.png","http://radio2m.scdn.arkena.com/live.mp3","This is a Description"));
radioModel.append(new Radiostation("Chada FM","qrc:/images/Radios/chadafm.jpeg","http://broadcast.infomaniak.net/chadafm-high.mp3","This is a Description"));
radioModel.append(new Radiostation("Radio SAWA","qrc:/images/Radios/radiosawa.png","http://173.213.80.218:8000/;stream.mp3","This is a Description"));
radioModel.append(new Radiostation("Luxe Radio","qrc:/images/Radios/luxeradio.jpeg","http://68.168.118.115:8000/","This is a Description"));
radioModel.append(new Radiostation("Medina FM","qrc:/images/Radios/medina-fm.jpg","http://medinafm.ice.infomaniak.ch/medinafm-64.mp3","This is a Description"));
radioModel.append(new Radiostation("MedRadio","qrc:/images/Radios/med-radio_1.png","http://medradio-maroc.ice.infomaniak.ch/medradio-maroc-64.mp3","This is a Description"));
radioModel.append(new Radiostation("Radio Plus","qrc:/images/Radios/radioplus.jpeg","http://149.202.139.76:8000/marrakech.mp3","This is a Description"));
radioModel.append(new Radiostation("Radio MFM","qrc:/images/Radios/mfm.png","http://radio.mfmradio.ma/casa.mp3","This is a Description"));
radioModel.append(new Radiostation("Radio Mars","qrc:/images/Radios/220px-Radiomars.gif","http://radiomars.ice.infomaniak.ch/radiomars-128.mp3","This is a Description"));
radioModel.append(new Radiostation("Radio Chabab","qrc:/images/Radios/radiochabab1.png","http://listen.radionomy.com/rjm1","This is a Description"));
radioModel.append(new Radiostation("Aswat","qrc:/images/Radios/aswat.jpeg","http://broadcaster.infomaniak.ch/aswat-high.mp3","This is a Description"));
radioModel.append(new Radiostation("capradio","qrc:/images/Radios/capradio.jpeg","","This is a Description"));
radioModel.append(new Radiostation("Radio Orient","qrc:/images/Radios/orient-fm.png","http://stream3.broadcast-associes.com:8405/Radio-Orient","This is a Description"));
radioModel.append(new Radiostation("Radio Soleil","qrc:/images/Radios/radio-soleil.png","http://radiosoleil.ice.infomaniak.ch/radiosoleil-128.mp3","This is a Description"));
radioModel.append(new Radiostation("Hit Radio Dancefloor","qrc:/images/Radios/hit-radio-dancefloor.png","http://dancefloor.ice.infomaniak.ch/dancefloor-128.mp3","This is a Description"));
radioModel.append(new Radiostation("Hit Radio RnB","qrc:/images/Radios/hit-radio-rnb.png","http://rnb.ice.infomaniak.ch/rnb-128.mp3","This is a Description"));
radioModel.append(new Radiostation("Hit Radio mgharba","qrc:/images/Radios/hit-radio-mgharba.png","http://mgharba.ice.infomaniak.ch/mgharba-128.mp3","This is a Description"));
radioModel.append(new Radiostation("Hit Radio Buzz","qrc:/images/Radios/hit-radio-buzz.png","http://hitradio-maroc.ice.infomaniak.ch/hitradio-maroc-128.mp3","This is a Description"));
radioModel.append(new Radiostation("Radio Star","qrc:/images/Radios/radio-starmaroc-fm.png","http://streaming.radionomy.com/RadioStarMaroc","This is a Description"));
radioModel.append(new Radiostation("Radio Itran","qrc:/images/Radios/radio-itran.png","http://streaming.radionomy.com/ChezWattfr","This is a Description"));
radioModel.append(new Radiostation("Radio HabaYiib","qrc:/images/Radios/radio-habayiib.png","http://85.214.110.29:8000/;","This is a Description"));
radioModel.append(new Radiostation("izlan","qrc:/images/Radios/izlan.png","http://philae.shoutca.st:8370/;","This is a Description"));
radioModel.append(new Radiostation("Radio Marrakech","qrc:/images/Radios/radio-marrakech.png","http://95.141.24.70/;","This is a Description"));
radioModel.append(new Radiostation("Radio PlanetHouse","qrc:/images/Radios/radio-planet-house.png","http://streaming.radionomy.com/Surf-Radio-Clubbing","This is a Description"));
radioModel.append(new Radiostation("Rif Melody","qrc:/images/Radios/rif-melody-radio.png","http://music.rifmelody.com/script-XwpD451s/Moustapha_Terakaa_Vol2-2011/Mp3/Moustapha%20Terakaa%20Vol2%202011%20-%20Piste%2001.mp3","This is a Description"));
radioModel.append(new Radiostation("Only Rai","qrc:/images/Radios/radio-only-rai.png","http://broadcast.infomaniak.net/onlyrai-high.mp3","This is a Description"));
radioModel.append(new Radiostation("Monte Carlo","qrc:/images/Radios/radio-monte-carlo-doualiya.png","http://mc-doualiya.scdn.arkena.com/mc-doualiya.mp3","This is a Description"));
radioModel.append(new Radiostation("Ness Radio","qrc:/images/Radios/ness-radio.png","http://radio.nessradio.net:8000/nessradio.mp3","This is a Description"));
radioModel.append(new Radiostation("Radio ITMA","qrc:/images/Radios/radio-itma.png","http://streaming.radionomy.com/radio-itma?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6","This is a Description"));
radioModel.append(new Radiostation("MarocMusic","qrc:/images/Radios/radio-maroc-music.png","http://streaming.radionomy.com/MarocMusic?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6","This is a Description"));
radioModel.append(new Radiostation("Radio Sawte Ouarzazate","qrc:/images/Radios/radio-sawte-ouarzazate.png","http://server7.mp3quran.net:8014/;","This is a Description"));
radioModel.append(new Radiostation("Anwa Rock","qrc:/images/Radios/radio-anwarock.png","http://streaming.radionomy.com/Anwa-rock?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6","This is a Description"));
radioModel.append(new Radiostation("Medi1 Soufi","qrc:/images/Radios/radio-soufi.png","http://live.medi1.com/Soufi","This is a Description"));
radioModel.append(new Radiostation("Medi1 Andalouse","qrc:/images/Radios/radio-andalousse.png","http://live.medi1.com/Andalouse","This is a Description"));
radioModel.append(new Radiostation("Medi1 Tarab","qrc:/images/Radios/radio-tarab.png","http://live.medi1.com/Tarab","This is a Description"));
}
