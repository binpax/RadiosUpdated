import QtQuick 2.7

import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
ListView {
    id: listView
    currentIndex: -1
    anchors.fill: parent

    ScrollIndicator.vertical: ScrollIndicator { }
}
