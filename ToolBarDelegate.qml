import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

ToolBar {
    Material.foreground: "white"

    RowLayout {
        spacing: 20
        anchors.fill: parent

        ToolButton {
            contentItem: Image {
                fillMode: Image.Pad
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: timer.running? "qrc:/images/arrow_left.png" : (swipeView.currentIndex == 2 ? "qrc:/images/arrow_left.png" : "qrc:/images/drawer.png")
            }
            onClicked:{
                if(timer.running){
                    timer.stop()
                    searchField.visible = false
                }else if(swipeView.currentIndex == 2)
                    swipeView.currentIndex = 1
                else
                    drawer.open()
            }
        }

        Label {
            id: titleLabel
            text: "<b>Radio Biladi v2</b>"
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
                    text: "Supprimer les favoris"
                    onTriggered: {
                        radioStatiosContainer.clairfavorites()
                        radiolistFAVORITES.radioList.model = radioStatiosContainer.getFavoritesRadioList()                    }
                }
                MenuItem {
                    text: "About"
                    onTriggered: aboutDialog.open()
                }
            }
        }
    }
}
