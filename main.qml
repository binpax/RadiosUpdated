import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.Extras 1.4

ApplicationWindow {
    id:window

    property int  cardFixedSize: 100
    visible: true
    width: 720
    height: 1280
    title: qsTr("Radio Biladi")
    Material.primary: "#1887EE"
    Image{
        source: "qrc:/images/bg-bleu.png"
        //color: "#cbd0d3"
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

        width: parent.width
        height: parent.height - playerbar.height
        currentIndex: tabBar.currentIndex

        FavoritesList{id:radiolistFAVORITES}
        RadioList{id:radiolistALL}
        MPlayer{id:radioPlayerPAGE}
        onCurrentIndexChanged: {
            createAnimation.stop()
            if(currentIndex == 2) createAnimation.to = 0
            else createAnimation.to = 1.0
            createAnimation.start()
        }
    }

    Rectangle{
        id:playerbar
        height: tabBar.height * 5 / 4
        width: parent.width
        color: "#cbd0d3"
        opacity: 1
        anchors{
            left: parent.left
            bottom: parent.bottom
        }
        NumberAnimation on opacity {
            id: createAnimation
            duration: 1000
        }

        ToggleButton{
            id:barPlayButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:parent.left
            anchors.leftMargin: 10
            text: checked ? "Stop" : "Play"
            checked: radioPlayerPAGE.playButton.checked
            height: parent.height * 0.9
        }
        Text {
            id: name
            text: radioPlayerPAGE.radioname.text //qsTr("Station Name")
            anchors.verticalCenter: barPlayButton.verticalCenter
            anchors.left:barPlayButton.right
            anchors.leftMargin: 15
        }
        MouseArea{
            anchors{
                left: name.left
                right: parent.right
                bottom: parent.bottom
                top:parent.top
            }
            onClicked: {
                //openmediaplayer
            }
        }

    }
    footer:TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: "Favorites"
        }
        TabButton {
            text: "Stations list"
        }
    }
    Timer{
        id: timer; running: false; interval: 7000; repeat: false
        onTriggered: {
            searchField.visible = false;
        }
    }
    Component.onCompleted: {
        //radioStatiosContainer.clear()
    }
}
