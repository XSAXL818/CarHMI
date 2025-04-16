import QtQuick

Rectangle {
    id: root
    width: 90
    height: parent.height
    color: "black"

    property double btnHeight
    property int iconSize


    Column{
        anchors.fill: parent
        anchors.topMargin: 20
        spacing: 30

        ProfilePicture{
            id: profile
            size: root.width-30
            anchors.horizontalCenter: parent.horizontalCenter
            source: "pic/power.jpg"
            onClick: {
                console.log("头像被点击")
            }

        }

        IconButton{
            id: backBtn
            width: parent.width
            height: root.btnHeight
            source: "pic/back.png"
            size: root.iconSize
            onClicked: {
                rCenter.source = "Page1.qml"

                if( leftDrawer.opened | rightDrawer.opened ){
                    leftDrawer.close()
                    rightDrawer.close()
                }
            }
        }
        IconButton{
            id: homeBtn
            width: parent.width
            height: root.btnHeight
            size: root.iconSize
            source: "pic/Home.png"

            onClicked: {
                rCenter.source = "Home.qml"
            }
        }

        IconButton{
            id: menuBtn
            width: parent.width
            height: root.btnHeight
            source: "pic/Menu.png"
            size: root.iconSize
            onClicked: {
                console.log("菜单")
            }
        }
        IconButton{
            id: closeWiseBtn
            width: parent.width
            height: root.btnHeight
            size: root.iconSize
            source: "pic/clockwise.png"

            onClicked: {
                console.log("旋转")
            }
        }

        IconButton{
            id: closeBtn
            width: parent.width
            height: root.btnHeight
            source: "pic/close.png"
            size: root.iconSize
            onClicked: {
                Qt.quit()

            }
        }

    }
}
