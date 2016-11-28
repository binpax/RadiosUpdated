import QtQuick 2.7
import QtGraphicalEffects 1.0

ListView {
    id:flistView

    property alias radioList : flistView

    clip: true
    height: parent.height
    y: searchField.visible ? searchField.height : 0

    model:radioStatiosContainer.getFavoritesRadioList()

    onContentYChanged: {
        if( contentY < -searchField.height*1.05 ) {
            searchField.visible = true;
            timer.running = true;
        }
    }
    highlight: Rectangle { color: "#1abc9c"}

    delegate: Component{
        Item{
            width: flistView.width
            height: 80
            Rectangle{
                anchors.fill: parent
                anchors.margins: 5
                opacity: 0.5
                color: "#4aa3df"
                border.color: "white"
                border.width: 2
                radius: 5
            }
            Image{
                id:flistElementIcon
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: (parent.height - height)/ 2
                height: parent.height * 0.8
                width: height
                source: model.modelData.ImgSrc
                layer.enabled: rounded
                property bool rounded: true
                property bool adapt: true
                Image{
                    anchors.fill: parent
                    source : "qrc:/images/cardeffect.png"
                }
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: flistElementIcon.width
                        height: flistElementIcon.height
                        Rectangle {
                            anchors.centerIn: parent
                            width: flistElementIcon.adapt ? flistElementIcon.width : Math.min(flistElementIcon.width, flistElementIcon.height)
                            height: flistElementIcon.adapt ? flistElementIcon.height : width
                            radius: 4
                        }
                    }
                }
            }

            Image{
                source: "qrc:/images/chevron-right.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: (parent.height - height)/ 2
                height: parent.height * 0.8
                width: height

            }
            Text {
                text: "<b>"+model.modelData.Name+"</b>"
                anchors.left :flistElementIcon.left
                anchors.leftMargin: flistElementIcon.width *3/2
                anchors.top: flistElementIcon.top
                anchors.topMargin: flistElementIcon.height/5
                color: "white"
                font.pointSize: 20
            }
            Text {
                text: "<i>This is a Description</i>"
                anchors.left :flistElementIcon.left
                anchors.leftMargin:flistElementIcon.width *3/2
                anchors.bottom:flistElementIcon.bottom
                anchors.bottomMargin:flistElementIcon.height/5
                color: "white"
            }
            MouseArea{
                id:fitemMouseArea
                anchors.fill: parent
                onClicked: {
                    if(timer.running){
                        timer.stop()
                        searchField.visible = false
                    }
                    flistView.currentIndex = index
                    radioStatiosContainer.playRadioStation(model.modelData.Name)
                    radioPlayerPAGE.radioimage.source = model.modelData.ImgSrc
                    radioPlayerPAGE.radioname.text = model.modelData.Name
                    //radioPlayerPAGE.radiodescription.text = model.modelData.Description
                    swipeView.currentIndex = 2
                }
            }
        }
    }

    onCurrentItemChanged: {
    }

    Behavior on y {
        NumberAnimation{ duration: 200 }
    }
    Component.onCompleted: {
        if(flistView.count == 0) swipeView.currentIndex = 1
    }
}
