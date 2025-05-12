import QtQuick

Rectangle {
    id: root
    width: 90
    height: parent.height
    color: "black"

    property double btnHeight
    property int iconSize

    signal profileClicked
    signal backBtnClicked
    signal homeBtnClicked
    signal menuBtnClicked
    signal clockWiseBtnClicked
    signal closeBtnClicked

    Column{
        anchors.fill: parent
        anchors.topMargin: 20
        spacing: 30

        // 头像栏
        ProfilePicture{
            id: profile
            size: root.width-30
            anchors.horizontalCenter: parent.horizontalCenter
            source: "pic/power.png"
            onClick: { profileClicked() }
        }

        // 返回按钮
        IconButton{
            id: backBtn
            width: parent.width
            height: root.btnHeight
            source: "pic/back.png"
            size: root.iconSize
            onClicked: { backBtnClicked() }
        }
        // home按钮
        IconButton{
            id: homeBtn
            width: parent.width
            height: root.btnHeight
            size: root.iconSize
            source: "pic/Home.png"
            onClicked: { homeBtnClicked() }
        }

        IconButton{
            id: menuBtn
            width: parent.width
            height: root.btnHeight
            source: "pic/Menu.png"
            size: root.iconSize
            onClicked: { menuBtnClicked() }
        }
        IconButton{
            id: clockWiseBtn
            width: parent.width
            height: root.btnHeight
            size: root.iconSize
            source: "pic/clockwise.png"
            onClicked: { clockWiseBtnClicked() }
        }

        IconButton{
            id: closeBtn
            width: parent.width
            height: root.btnHeight
            source: "pic/close.png"
            size: root.iconSize
            onClicked: { closeBtnClicked() }
        }

    }
}
