﻿import QtQuick 2.12
import QtQuick.Controls 2.5

Item{
    id:root
    width: 6
    anchors.left: parent.left

    property int newY: 0
    property int newH: 0
    property int maxH: 0

    function goDown(){
        animDown.start()
    }
    function goUp(){
        animUp.start()
    }

    Rectangle{
        color: "pink"
        anchors.fill: parent
        radius: 2
        anchors.topMargin: 8
        anchors.bottomMargin: anchors.topMargin
    }

    SequentialAnimation{
        id: animDown//向下滑动 先变height 再变y+height
        NumberAnimation { target: root; property: "height"; to: maxH; duration: 200 }
        ParallelAnimation {
            NumberAnimation { target: root; property: "height"; to: newH; duration: 100 }
            NumberAnimation { target: root; property: "y"; to: newY; duration: 100 }
        }
    }
    SequentialAnimation{
        id: animUp//向上滑动 先变y+height 再变height
        ParallelAnimation {
            NumberAnimation { target: root; property: "height"; to: maxH; duration: 200 }
            NumberAnimation { target: root; property: "y"; to: newY; duration: 200 }
        }
        NumberAnimation { target: root; property: "height"; to: newH; duration: 100 }
    }
}
