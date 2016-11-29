import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

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


    Popup {
        id: sleeping_dialog
        //property int remaining: 0
        x: (window.width - width) / 2
        y: window.height / 2 - height/2
        width: settingsColumn1.implicitWidth //*3
        height: settingsColumn1.implicitHeight//+ topPadding + bottomPadding
        modal: true
        focus: true
        //anchors.centerIn: parent

        contentItem: ColumnLayout {
            id: settingsColumn1
            spacing: 14

            Label {
                text: "compte à rebours :"
                font.bold: true
                font.pointSize: 20
            }
            RowLayout{
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                Label {
                    text: "Heures"
                }
                Label {
                    text: "Min."
                }
            }

            Tumbler {
                id: tumbler
                anchors.horizontalCenter: parent.horizontalCenter
                property int minutes: 0
                property bool istimerworking: false
                height: 40
                TumblerColumn {
                    id:hours
                    width: 60
                    model: ListModel {
                        Component.onCompleted: {
                            for (var i = 0; i < 10; ++i) {
                                append({value: i.toString()});
                            }
                        }
                    }
                }
                TumblerColumn {
                    width: 60
                    model: ListModel {
                        Component.onCompleted: {
                            for (var i = 0; i < 60; ++i) {
                                append({value: i.toString()});
                            }
                        }
                    }
                }
            }
            RowLayout{
                spacing: parent.spacing
                anchors.right: parent.right
                //anchors.rightMargin: parent.spacing -
                Button{
                    text:"Annuler"
                    onClicked: sleeping_dialog.close()
                }
                Button{
                    text:"Valider"
                    onClicked: {
                        sleeping_dialog.close()
                        tumbler.minutes = (tumbler.currentIndexAt(0)*60 + tumbler.currentIndexAt(1))//*60
                        //console.log("column data is : " + tumbler.minutes)
                        radioStatiosContainer.schedule(tumbler.minutes)
                        sleep_mode_cancel.visible = true
                        tumbler.istimerworking= true
                    }
                }
            }
        }
    }

    Image {
        id: radioImage
        // source: "qrc:/images/Radios/radio-220px-Radiomars.gif"
        anchors{
            left: parent.left
            leftMargin: 10
            top:parent.top
            topMargin: 25
        }
        width: 150
        height: 150
        property bool rounded: true
        property bool adapt: true
        Image{
            anchors.fill: parent
            source : "qrc:/images/cardeffect.png"
            opacity: 0.7
        }
        layer.enabled: rounded
        layer.effect: OpacityMask {
            maskSource: Item {
                width: radioImage.width
                height: radioImage.height
                Rectangle {
                    anchors.centerIn: parent
                    width: radioImage.adapt ? radioImage.width : Math.min(radioImage.width, radioImage.height)
                    height: radioImage.adapt ? radioImage.height : width
                    radius: 10
                }
            }
        }
    }

    Text {
        id: radioName
        text: "<b>"+ qsTr("choisissez une station") +"</b>"
        anchors.left : radioImage.right
        anchors.leftMargin: 10
        anchors.top: radioImage.top
        anchors.topMargin: radioImage.height/5
        anchors.right: parent.right
        wrapMode: Text.Wrap
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
        id: flatButton_favorite
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
    Rectangle{
        id: favorite_rect
        color: "black"
        opacity: 0.4
        radius: 10
        width: favoritelabel.implicitWidth + favoritelabel.font.pixelSize
        height: favoritelabel.implicitHeight + favoritelabel.font.pixelSize
        anchors.top : flatButton_favorite.bottom
        anchors.left : parent.left
        anchors.topMargin: favoritelabel.font.pixelSize
        Component.onCompleted: {
            if(flatButton_favorite.anchors.rightMargin<= width/2)anchors.left = parent.left
            else anchors.horizontalCenter = flatButton_favorite.horizontalCenter
        }
    }
    Text {
        id: favoritelabel
        text: qsTr("Ajouter au favorites")
        color: "white"
        anchors.centerIn: favorite_rect
    }
    FlatButton {
        id : flatButton_sleeping_mode
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
        onClicked: sleeping_dialog.open()
    }
    Rectangle{
        id: sleeping_rect
        color: "black"
        opacity: 0.4
        radius: 10
        width: sleepinglabel.implicitWidth + sleepinglabel.font.pixelSize
        height: sleepinglabel.implicitHeight + sleepinglabel.font.pixelSize
        anchors.top : flatButton_sleeping_mode.bottom
        //anchors.right : if(flatButton_sleeping_mode.anchors.rightMargin<= width/2)parent.right
        anchors.horizontalCenter: if(flatButton_sleeping_mode.anchors.rightMargin>= width/2)flatButton_sleeping_mode.horizontalCenter
        anchors.topMargin: sleepinglabel.font.pixelSize
        Component.onCompleted: {
            if(flatButton_sleeping_mode.anchors.rightMargin<= width/2)anchors.right = parent.right
            else anchors.horizontalCenter = flatButton_sleeping_mode.horizontalCenter
        }
    }
    Text {
        id: sleepinglabel
        text: qsTr("mode de sommeil")
        color: "white"
        anchors.centerIn: sleeping_rect
    }
    Button{
        id: sleep_mode_cancel
        text: "annuler"
        anchors.horizontalCenter: sleeping_rect.horizontalCenter
        anchors.top : sleeping_rect.bottom
        anchors.topMargin: sleepinglabel.font.pixelSize
        visible: false
        onClicked: {
            visible = false
            radioStatiosContainer.scheduleInterruption()
            tumbler.istimerworking = false
            sleepinglabel.text= qsTr("mode de sommeil")
        }
    }
    ToggleButton{
        id:playButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/6
        text: checked ? "Stop" : "Play"
        scale: 0.6
        onClicked: checked = radioStatiosContainer.togglePlayer()
    }
    Connections{
        target:radioStatiosContainer
        onNewStatusChanged: {
            playerLoadingBar.visible = false
            playButton.checked = false

            switch(subject){
            case 1:
                break;
            case 2:
                //console.log("case 2:")
                playerLoadingBar.visible = true
                playButton.checked = true
                break;
            case 3:
                //console.log("case 2:")
                break;
            case 4:
                //console.log("case 2:")
                break;
            case 5:
                //console.log("case 5")
                break;
            case 6:
                //console.log("case 6:")
                playButton.checked = true
                break;
            }
        }
        onUpdatetimeleft:{
            var remaining = tumbler.minutes - timeleft;
            if(tumbler.istimerworking) sleepinglabel.text = formattime(remaining)
        }
    }
    function formattime(time){
        // Minutes and seconds
        //var mins = ~~(time / 60);
        //var secs = time % 60;

        // Hours, minutes and seconds
        var hrs = ~~(time / 3600);
        var mins = ~~((time % 3600) / 60);
        var secs = time % 60;

        // Output like "1:01" or "4:03:59" or "123:03:59"
        var ret = "";

        if (hrs > 0) {
            ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
        }

        ret += "" + mins + ":" + (secs < 10 ? "0" : "");
        ret += "" + secs;
        return ret;
    }
}
