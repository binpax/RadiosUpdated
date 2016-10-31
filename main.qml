import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import Qt.labs.settings 1.0
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
        height: parent.height
        currentIndex: tabBar.currentIndex

      RadioList{}
      Rectangle {
          width: swipeView.width
          height: swipeView.height
          color: "transparent"

          Image {
              id: radioImage
              source: "qrc:/images/Radios/radio-220px-Radiomars.gif"
              anchors{
                  left: parent.left
                  leftMargin: 10
                  top:parent.top
                  topMargin: 25
              }
              width: 150
              height: 150
          }
          Text {
              text: "<b>"+"name"+"</b>"
              anchors.left : radioImage.right
              anchors.leftMargin: 10
              anchors.top: radioImage.top
              anchors.topMargin: radioImage.height/5
              color: "white"
              font.pointSize: 25
          }
          Text {
              text: "<i>This is a Description</i>"
              anchors.left : radioImage.right
              anchors.leftMargin: 10
              anchors.bottom: radioImage.bottom
              anchors.bottomMargin: radioImage.height/5
              color: "white"
          }
          ProgressBar {
              id:playerLoadingBar

              indeterminate: true
              width: parent.width/4
              anchors.horizontalCenter: parent.horizontalCenter
              anchors.bottom: playButton.top
              anchors.bottomMargin: 20
              Material.accent: "white"
          }
          FlatButton {
              width: parent.width / 7
              height: width
              anchors{
                  verticalCenter: playButton.verticalCenter
                  leftMargin: parent.width/4 - width
                  left:parent.left
              }
              Image {
                  id: sleepingIcon
                  source:    "qrc:/images/favorites.png"
                  anchors.centerIn:parent
                  height: parent.height * 0.6
                  width: height

              }
              color: pressed ? "#d6d6d6" : "transparent"
          }
          FlatButton {
              width: parent.width / 7
              height: width
              anchors{
                  verticalCenter: playButton.verticalCenter
                  rightMargin: parent.width/4 - width
                  right:parent.right
              }
              Image {
                  id: favoriteIcon
                  source: "qrc:/images/Sleeping-64.png"
                  anchors.centerIn:parent
                  height: parent.height * 0.6
                  width: height

              }
              color: pressed ? "#d6d6d6" : "transparent"
          }
          ToggleButton{
            id:playButton
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/6
            text: checked ? "Stop" : "Play"
            scale: 0.6
          }
      }
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
    Timer{
        id: timer; running: false; interval: 7000; repeat: false
        onTriggered: {

            searchField.visible = false;
        }
    }
    Component.onCompleted: {
        for(var i = 0; i<modelData.count;i++)
        {
            console.log("radioModel.append(new Radiostation(\""+ modelData.get(i).name+"\",\""+ modelData.get(i).imageSource+"\",\""+modelData.get(i).source+"\",\"This is a Description\"));")
        }
    }
}
