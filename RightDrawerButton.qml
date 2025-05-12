import QtQuick


Rectangle {
    id: root
    width: root.size
    height: root.size
    // color: "#CF000000"
    color: root.isOn ? colorOn : colorClose
    radius: 20

    MouseArea{
        anchors.fill: parent
        onClicked: {
            isOn = !isOn
        }
    }

    property bool isOn: true
    property alias imgSource: img.source
    property alias text: txt.text

    property color colorOn: "#EF3081f6"
    property color colorClose: "#CF000000"

    Image {
        id: img
        width: 50
        height: 50
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: (parent.width-width)/2
        source: "pic/power.png"


    }

    Text {
        id: txt
        text: "文本"
        anchors.top: img.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
        color: "white"
    }




}
