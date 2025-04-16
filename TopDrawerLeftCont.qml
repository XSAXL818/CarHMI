import QtQuick

Rectangle {
    id: root
    anchors.fill: parent
    color: "#99000000"

    property string curTime
    property string curDate
    property string curWeek


    Rectangle{
        height: 150
        width: root.width
        color:"white"


    }


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
}
