import QtQuick

Rectangle {
    anchors.fill: parent
    color: "#99000000"
    Text {
        anchors.centerIn: parent
        text: "右侧页面"
        font.pixelSize: 24
    }
    MouseArea {
        anchors.fill: parent
        property real startY: 0
        property real startX: 0

        onPressed: {startY = mouseY;startX = mouseX}
        onPositionChanged: {
            // 判断是否为底部上拉手势
            if (startY-mouseY  > 150 && startY > parent.height-200) {
                rightDrawer.close()
            } // 判断是否为切换到右抽屉
            else if( mouseX - startX > 150 && Math.abs(startY-mouseY) < 100 ){
                rightDrawer.close()
                leftDrawer.open()
            }

        }
    }
}
