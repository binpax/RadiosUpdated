import QtQuick 2.7


ListView {
    id:listView
    clip: true
    height: parent.height
    y: searchField.visible ? searchField.height : 0

    model: modelData
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
    highlight: Rectangle { color: "burlywood"}

    delegate: Component{
        Item{
            width: parent.width
            height: 70
            Rectangle{
                anchors.fill: parent
                anchors.margins: 5
                opacity: 0.3
                color: "lightsteelblue"
                border.color: "white"
                border.width: 2
                radius: 5
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
                text: name
                anchors.centerIn: parent
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
    Timer{
        id: timer; running: false; interval: 7000; repeat: false
        onTriggered: {
            searchField.visible = false;
        }
    }
}