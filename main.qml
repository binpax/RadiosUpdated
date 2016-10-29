import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Radio Biladi")
    header: ToolBar {
        Material.foreground: "white"

        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/drawer.png"
                }
                onClicked: drawer.open()
            }

            Label {
                id: titleLabel
                text: "Gallery"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/menu.png"
                }
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Settings"
                        onTriggered: settingsPopup.open()
                    }
                    MenuItem {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }
    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height- header.height

        ListView {
            id: listView
            currentIndex: -1
            anchors.fill: parent

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }



    footer:Image{
        id: footerToolbar

        height: 60
        source: "qrc:/images/iphoneBar.png"
        ProgressBar {
            //visible: loadingstate
            anchors{
                verticalCenter: channelInfo.verticalCenter
                left:channelInfo.left
            }
            indeterminate: true
        }
        Text{
            id:channelTitle

            anchors{
                top:parent.top
                topMargin: parent.height*0.25 - channelTitle.height*0.4
                left:playButton.right
                leftMargin: parent.width*0.1
            }
            font.bold: true
            text: "Chargement ..."
        }
        Text{
            id:channelInfo

            anchors{
                bottom:parent.bottom
                bottomMargin: parent.height*0.25 - channelTitle.height*0.5
                left:playButton.right
                leftMargin: parent.width*0.1
            }

            //visible: !loadingstate
            font.bold: true
            //text:"Informations"
        }
        Image {
            id :playButton

            anchors{
                left:parent.left
                leftMargin: parent.width*0.1
                verticalCenter: parent.verticalCenter
            }
            //backgroundColor:theme.primaryColor
            source:"qrc:/images/playerplay.png"
            height: width
            width: parent.height *0.8

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if(mediaplayer.playbackState == MediaPlayer.PlayingState)
                    { mediaplayer.stop(); loadingstate = false}
                    else
                        mediaplayer.play();
                }
            }
        }
    }
}
