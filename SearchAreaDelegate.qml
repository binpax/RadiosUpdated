import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Styles 1.1

TextField{
    id: searchField
    width: searchBg.width - 30
    Material.accent:"white"
    placeholderText: "Rechercher"
    Image {
        id: searchIcon
        source : "qrc:/images/Icon-search.png"
        height: searchField.height*0.6
        width: height
        opacity: 0.4
        anchors{
            right: parent.right
            rightMargin: (searchField.height- height)/2
            verticalCenter: parent.verticalCenter
        }
    }

    Component.onCompleted: {
}
    onTextChanged: {
        if(swipeView.currentIndex == 0){
            radioStatiosContainer.searchFavorites(text)
            radiolistFAVORITES.radioList.model = radioStatiosContainer.getFavoritesRadioList()
        }else{
            radioStatiosContainer.searchALL(text)
            radiolistALL.radioList.model = radioStatiosContainer.getRadioList()
        }

        timer.restart();
        if(text.length > 0 ) {
            searchIcon.source = "qrc:/Images/Icon-delete.png"
        } else {
            searchIcon.source = "qrc:/Images/Icon-search.png"
        }
    }

    onVisibleChanged: {
        if( visible) focus = true
        else focus = false
    }

    Behavior on visible {
        NumberAnimation{ duration: 200 }
    }

}
