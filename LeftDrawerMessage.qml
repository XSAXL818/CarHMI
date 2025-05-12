import QtQuick

Rectangle {
    id: root

    property string msgTitle: "标题"
    property string msgContent: "内容"
    property string msgIcon: ""
    property double iconSize: 80

    radius: 10


    // 图标
    Image {
        id: icon
        height: root.iconSize
        width: root.iconSize
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        source: root.msgIcon


    }

    // 信息内容
    Rectangle{
        id: cont
        height: parent.height
        anchors.left: icon.right
        anchors.leftMargin: 20

        // 标题
        Text {
            id: title
            anchors.top: parent.top
            anchors.topMargin: 10
            text: root.msgTitle
            font.pixelSize: 30
            font.bold: true
        }
        Text {
            id: content
            anchors.top: title.bottom
            anchors.topMargin: 5
            text: root.msgContent
            font.pixelSize: 24
        }

    }


}
