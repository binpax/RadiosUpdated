import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtMultimedia 5.6
Rectangle {
    property alias playButton: playButton
    width: swipeView.width
    height: swipeView.height
    color: "transparent"
    property alias radioimage : radioImage
    property alias radioname : radioName
    property alias radiodescription : radioDescription

    Image {
        id: radioImage
        //source: "qrc:/images/Radios/radio-220px-Radiomars.gif"
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
        id: radioName
        text: "<b>"+ qsTr("choisissez une station") +"</b>"
        anchors.left : radioImage.right
        anchors.leftMargin: 10
        anchors.top: radioImage.top
        anchors.topMargin: radioImage.height/5
        color: "white"
        font.pointSize: 25
    }
    Text {
        id: radioDescription
        //text: "<i>This is a Description</i>"
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
        visible: false
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
        onClicked: {
            radioStatiosContainer.addtofavorites(radioName.text)
            radioStatiosContainer.searchFavorites()
            radiolistFAVORITES.radioList.model = radioStatiosContainer.getFavoritesRadioList()
        }
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
    Connections{
        target:radioStatiosContainer
        onNewStatusChanged: {
            playerLoadingBar.visible = false
            playButton.checked = false

            switch(subject){
            case 1:
                console.log("case 1")
                break;
            case 2:
                console.log("case 2:")
                playerLoadingBar.visible = true
                playButton.checked = true
                break;
            case 3:
                console.log("case 2:")
                break;
            case 4:
                console.log("case 2:")
                break;
            case 5:
                console.log("case 5")
                break;
            case 6:
                console.log("case 6:")
                playButton.checked = true
                break;
            }
        }

    }
}
