import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id:window

    property int  cardFixedSize: 100
    visible: true
    width: 640
    height: 480
    title: qsTr("Radio Biladi")
    Image{
        source: "qrc:/images/bg-bleu.png"
        anchors.fill: parent
        z:0
    }
    Rectangle{
        id:searchBg
        height: searchField.height
        width: window.width - 30
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        opacity: 0.4
        radius: 10
        visible: searchField.visible
    }

    SearchAreaDelegate{
        id:searchField
        anchors.horizontalCenter: searchBg.horizontalCenter
        visible: false
    }
    header: ToolBarDelegate{}
    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        DrawerDelegate{}
    }
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

      RadioList{}
   }

    footer:TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: "Stations list"
        }
        TabButton {
            text: "Player"
        }
    }
    ListModel {
        id: modelData

        ListElement {
            name: "Yabiladi Chaabi"
            imageSource : "qrc:/srcRadios/Radios/radio-yabiladi.png"
            source: "http://37.187.146.76:8100/;stream.mp3"
        }
        ListElement {
            name: "Yabiladi"
            imageSource : "qrc:/srcRadios/Radios/radio-yabiladi.png"
            source: "http://37.187.146.76:8000/;"
        }
        ListElement {
            name: "Hitradio"
            imageSource : "qrc:/srcRadios/Radios/hit-radio.png"
            source: "http://hitradio-maroc.ice.infomaniak.ch/hitradio-maroc-128.mp3"
        }
        ListElement {
            name: "Medi 1"
            imageSource : "qrc:/srcRadios/Radios/medi-1-radio.jpg"
            source: "http://media.yabiladi.com:8000"

        }
        ListElement {
            name: "Radio 2M"
            imageSource : "qrc:/srcRadios/Radios/radio-2m.png"
            source: "http://radio2m.scdn.arkena.com/live.mp3"
        }
        ListElement {
            name: "Chada FM"
            imageSource : "qrc:/srcRadios/Radios/chadafm.jpeg"
            source: "http://broadcast.infomaniak.net/chadafm-high.mp3"
        }
        ListElement {
            name: "Radio SAWA"
            imageSource : "qrc:/srcRadios/Radios/radiosawa.png"
            source: "http://173.213.80.218:8000/;stream.mp3"
        }
        ListElement {
            name: "Luxe Radio"
            imageSource : "qrc:/srcRadios/Radios/luxeradio.jpeg"
            source: "http://68.168.118.115:8000/"
        }
        ListElement {
            name: "Medina FM"
            imageSource : "qrc:/srcRadios/Radios/medina-fm.jpg"
            source: "http://medinafm.ice.infomaniak.ch/medinafm-64.mp3"
        }
        ListElement {
            name: "MedRadio"
            imageSource : "qrc:/srcRadios/Radios/med-radio_1.png"
            source: "http://medradio-maroc.ice.infomaniak.ch/medradio-maroc-64.mp3"
        }
        ListElement {
            name: "Radio Plus"
            imageSource : "qrc:/srcRadios/Radios/radioplus.jpeg"
            source: "http://149.202.139.76:8000/marrakech.mp3"
        }
        ListElement {
            name: "Radio MFM"
            imageSource : "qrc:/srcRadios/Radios/mfm.png"
            source: "http://radio.mfmradio.ma/casa.mp3"
        }
        ListElement {
            name: "Radio Mars"
            imageSource : "qrc:/srcRadios/Radios/220px-Radiomars.gif"
            source: "http://radiomars.ice.infomaniak.ch/radiomars-128.mp3"
        }
        ListElement {
            name: "Radio Chabab"
            imageSource : "qrc:/srcRadios/Radios/radiochabab1.png"
            source: "http://listen.radionomy.com/rjm1"
        }
        /*
        ListElement {
            name: "Amazigh"
            imageSource : "qrc:/srcRadios/Radios/idaatamazight.png"
            source: "http://www.surfmusic.de/m3u/amazigh,15127.m3u"
        }

        ListElement {
            name: "Atlantic"
            imageSource : "qrc:/srcRadios/Radios/logo-atlantic-16.png"
            source: "http://www.surfmusic.de/m3u/atlantic-radio-92-5-fm,10789.m3u"
        }

        ListElement {
            name: "Chaine inter"
            imageSource : "qrc:/srcRadios/Radios/chaineinter.png"
            source: "file:////Users/macbookpro/Music/iTunes/iTunes\ Media/Music/Jalal\ El\ Hamdaba.mp3"
        }
        */
        ListElement {
            name: "Aswat"
            imageSource : "qrc:/srcRadios/Radios/aswat.jpeg"
            source: "http://broadcaster.infomaniak.ch/aswat-high.mp3"
        }
        ListElement {
            name: "capradio"
            imageSource : "qrc:/srcRadios/Radios/capradio.jpeg"
            source: ""
        }
        ListElement {
            name: "Radio Orient"
            imageSource : "qrc:/srcRadios/Radios/orient-fm.png"
            source: "http://stream3.broadcast-associes.com:8405/Radio-Orient"
        }
        ListElement {
            name: "Radio Soleil"
            imageSource : "qrc:/srcRadios/Radios/radio-soleil.png"
            source: "http://radiosoleil.ice.infomaniak.ch/radiosoleil-128.mp3"
        }
        ListElement {
            name: "Hit Radio Dancefloor"
            imageSource : "qrc:/srcRadios/Radios/hit-radio-dancefloor.png"
            source: "http://dancefloor.ice.infomaniak.ch/dancefloor-128.mp3"
        }
        ListElement {
            name: "Hit Radio RnB"
            imageSource : "qrc:/srcRadios/Radios/hit-radio-rnb.png"
            source: "http://rnb.ice.infomaniak.ch/rnb-128.mp3"
        }
        ListElement {
            name: "Hit Radio mgharba"
            imageSource : "qrc:/srcRadios/Radios/hit-radio-mgharba.png"
            source: "http://mgharba.ice.infomaniak.ch/mgharba-128.mp3"
        }
        ListElement {
            name: "Hit Radio Buzz"
            imageSource : "qrc:/srcRadios/Radios/hit-radio-buzz.png"
            source: "http://hitradio-maroc.ice.infomaniak.ch/hitradio-maroc-128.mp3"
        }
        ListElement {
            name: "Radio Star"
            imageSource : "qrc:/srcRadios/Radios/radio-starmaroc-fm.png"
            source: "http://streaming.radionomy.com/RadioStarMaroc"
        }
        ListElement {
            name: "Radio Itran"
            imageSource : "qrc:/srcRadios/Radios/radio-itran.png"
            source: "http://streaming.radionomy.com/ChezWattfr"
        }
        ListElement {
            name: "Radio HabaYiib"
            imageSource : "qrc:/srcRadios/Radios/radio-habayiib.png"
            source: "http://85.214.110.29:8000/;"
        }
        ListElement {
            name: "izlan"
            imageSource : "qrc:/srcRadios/Radios/izlan.png"
            source: "http://philae.shoutca.st:8370/;"
        }
        ListElement {
            name: "Radio Marrakech"
            imageSource : "qrc:/srcRadios/Radios/radio-marrakech.png"
            source: "http://95.141.24.70/;"
        }
        ListElement {
            name: "Radio PlanetHouse"
            imageSource : "qrc:/srcRadios/Radios/radio-planet-house.png"
            source: "http://streaming.radionomy.com/Surf-Radio-Clubbing"
        }
        ListElement {
            name: "Rif Melody"
            imageSource : "qrc:/srcRadios/Radios/rif-melody-radio.png"
            source: "http://music.rifmelody.com/script-XwpD451s/Moustapha_Terakaa_Vol2-2011/Mp3/Moustapha%20Terakaa%20Vol2%202011%20-%20Piste%2001.mp3"
        }
        ListElement {
            name: "Only Rai"
            imageSource : "qrc:/srcRadios/Radios/radio-only-rai.png"
            source: "http://broadcast.infomaniak.net/onlyrai-high.mp3"
        }
        ListElement {
            name: "Monte Carlo"
            imageSource : "qrc:/srcRadios/Radios/radio-monte-carlo-doualiya.png"
            source: "http://mc-doualiya.scdn.arkena.com/mc-doualiya.mp3"
        }
        ListElement {
            name: "Ness Radio"
            imageSource : "qrc:/srcRadios/Radios/ness-radio.png"
            source: "http://radio.nessradio.net:8000/nessradio.mp3"
        }
        ListElement {
            name: "Radio ITMA"
            imageSource : "qrc:/srcRadios/Radios/radio-itma.png"
            source: "http://streaming.radionomy.com/radio-itma?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6"
        }
        ListElement {
            name: "MarocMusic"
            imageSource : "qrc:/srcRadios/Radios/radio-maroc-music.png"
            source: "http://streaming.radionomy.com/MarocMusic?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6"
        }
        ListElement {
            name: "Radio Sawte Ouarzazate"
            imageSource : "qrc:/srcRadios/Radios/radio-sawte-ouarzazate.png"
            source: "http://server7.mp3quran.net:8014/;"
        }
        ListElement {
            name: "Anwa Rock"
            imageSource : "qrc:/srcRadios/Radios/radio-anwarock.png"
            source: "http://streaming.radionomy.com/Anwa-rock?lang=en-US%2cen%3bq%3d0.8%2cfr%3bq%3d0.6"
        }

        ListElement {
            name: "Medi1 Soufi"
            imageSource : "qrc:/srcRadios/Radios/soufi.png"
            source: "http://live.medi1.com/Soufi"
        }
        ListElement {
            name: "Medi1 Andalouse"
            imageSource : "qrc:/srcRadios/Radios/radio-andalousse.png"
            source: "http://live.medi1.com/Andalouse"
        }
        ListElement {
            name: "Medi1 Tarab"
            imageSource : "qrc:/srcRadios/Radios/radio-tarab.png"
            source: "http://live.medi1.com/Tarab"
        }
    }
    Component{
        id:cardElement
        Rectangle {
            id: house_tumbnail

            property bool selected: false
            width : (window.width - (listElements.columns+1)*listElements.spacing)/listElements.columns
            height : width
            radius:2

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mediaplayer.stop()
                    mediaplayer.source = source
                    mediaplayer.play()
                    namestate = name
                    selected = true
                    //grid.currentIndex = index
                }
            }
            Image{
                anchors.fill: parent
                source:imageSource
                clip: true

                Image{
                    id:rect

                    height: house_tumbnail.height/4
                    width: house_tumbnail.width
                    anchors.bottom: parent.bottom
                    clip: true
                    source: "qrc:/Mplayer/IphoneApplicationTitleBar_Gray.png"

                }
                Text {
                    anchors.centerIn: rect
                    text: name
                    font.italic: true
                    font.bold: true
                    font.pixelSize: 15
                }
            }
            Component.onCompleted: {
                //console.log("        CardItems.add(new CardItem(1,"+name +", "+source+", R.drawable."+imageSource+"));")

            }
        }
    }

}
