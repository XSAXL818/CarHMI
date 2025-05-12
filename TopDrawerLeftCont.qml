import QtQuick

Rectangle {
    id: root
    anchors.fill: parent
    color: "#bE5d5b58"

    property string curTime
    property string curDate
    property string curWeek

    MouseArea {
        anchors.fill: parent
        property real startY: 0
        property real startX: 0

        onPressed: {startY = mouseY;startX = mouseX}
        onPositionChanged: {
            // 判断是否为底部上拉手势
            if (startY-mouseY  > 150 && startY > parent.height-200) {
                leftDrawer.close()
            } // 判断是否为切换到右抽屉
            else if( startX - mouseX > 150 && Math.abs(startY-mouseY) < 100 ){
                leftDrawer.close()
                rightDrawer.open()
            }
        }
    }


    ListModel{
        id: msgListModel
        ListElement {iconSource:"pic/AppMarket.png" ; title:"哔哩哔哩有新版本啦~" ; content:"-修复了一些bug,为画质的优化做一些调整..."}
        ListElement {iconSource:"pic/cloudStore.png" ; title:"设备备份失败" ; content:"无法备份此设备因为可用的云存储空间已用完"}
        ListElement {iconSource:"pic/power.png" ; title:"信息" ; content:"信息"}
        ListElement {iconSource:"pic/power.png" ; title:"信息" ; content:"信息"}
    }





    Rectangle{
        height: parent.height
        width: parent.width-500
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        color:"transparent"


        ListView{
            id: msgListView
            width: parent.width-30
            height: childrenRect.height
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 15
            clip: true

            model: msgListModel
            spacing: 10

            delegate: LeftDrawerMessage{
                required property string iconSource
                required property string title
                required property string content

                height: 100
                width: msgListView.width
                msgIcon: iconSource
                msgTitle: title
                msgContent: content
                iconSize: 50

            }
        }


    }



}
