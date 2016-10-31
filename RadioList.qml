import QtQuick 2.7


ListView {
    id:listView
    clip: true
    height: parent.height
    y: searchField.visible ? searchField.height : 0

    model:radioModel// modelData
    function reload() {
        var bookList = DB.getAllBooks();
        model.clear();
        for( var i=0; i < bookList.length ; ++i ) {
            model.append(bookList[i]);
        }
    }

    function applyFilter(bookName) {
        var bookList = DB.getBooksByName(bookName);
        model.clear();
        for( var i=0; i < bookList.length ; ++i ) {
            model.append(bookList[i]);
        }
    }

    onContentYChanged: {
        if( contentY < -searchField.height*1.05 ) {
            searchField.visible = true;
            timer.running = true;
        }
    }
    highlight: Rectangle { color: "#1abc9c"}

    delegate: Component{
        Item{
            width: parent.width
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
                id:listElementIcon
                source: imageSource
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: (parent.height - height)/ 2
                height: parent.height * 0.8
                width: height
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
                }
            }
        }
    }

    onCurrentItemChanged: {
        //myText.text = myListModel.get(myListView.currentIndex).dayOfWeek
    }

    Behavior on y {
        NumberAnimation{ duration: 200 }
    }
}
