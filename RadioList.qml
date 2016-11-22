import QtQuick 2.7

ListView {
    id:listView
    property alias radioList : listView

    clip: true
    height: parent.height
    y: searchField.visible ? searchField.height : 0

    model:radioStatiosContainer.getRadioList()
    onContentYChanged: {
        if( contentY < -searchField.height*1.05 ) {
            searchField.visible = true;
            timer.running = true;
        }
    }
    highlight: Rectangle { color: "#1abc9c"}

    delegate: Component{
        Item{
            width: listView.width
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
            Rectangle{
                id:listElementIcon
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: (parent.height - height)/ 2
                height: parent.height * 0.8
                width: height
                radius: 5
                clip: true
                Image{
                    source: model.modelData.ImgSrc
                    anchors.fill: parent
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
                anchors.left : listElementIcon.left
                anchors.leftMargin: listElementIcon.width *3/2
                anchors.top: listElementIcon.top
                anchors.topMargin: listElementIcon.height/5
                color: "white"
                font.pointSize: 20
            }
            Text {
                text: "<i>This is a Description</i>"
                anchors.left : listElementIcon.left
                anchors.leftMargin: listElementIcon.width *3/2
                anchors.bottom: listElementIcon.bottom
                anchors.bottomMargin: listElementIcon.height/5
                color: "white"
            }
            MouseArea{
                id: itemMouseArea
                anchors.fill: parent
                onClicked: {
                    listView.currentIndex = index
                    radioStatiosContainer.playRadioStation(model.modelData.Name)
                    radioPlayerPAGE.radioimage.source = model.modelData.ImgSrc
                    radioPlayerPAGE.radioname.text = model.modelData.Name
                    //radioPlayerPAGE.radiodescription.text = model.modelData.Description
                    swipeView.currentIndex = 2
                    window= "hello"
                }
            }
        }
    }

    onCurrentItemChanged: {
    }

    Behavior on y {
        NumberAnimation{ duration: 200 }
    }

}
