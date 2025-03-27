import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    anchors.fill: parent
    radius: 10
    color: "#99000000"

    property real iconSize: 25
    property real tMargin: 20
    property int fontSize: 15

    signal clickBackHome
    signal clickToCompany
    signal clickChargeStation

    Row{
        anchors.fill: parent
        Rectangle{
            id: rectBackHome
            width: parent.width/3
            height: parent.height
            color: "transparent"

            Button{
                id: backHome
                width: root.iconSize
                height: root.iconSize
                anchors.top: parent.top
                anchors.topMargin: root.tMargin
                anchors.horizontalCenter: parent.horizontalCenter
                background: Item{}
                Image {
                    anchors.fill: parent
                    source: "pic/backHome.png"
                }
            }
            Text{
                anchors.top:backHome.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                text: "回家"
                font.pixelSize: root.fontSize
                color: "white"
            }

            // 设置缩放动画行为
            Behavior on scale {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.InOutQuad  // 缓动曲线
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.clickBackHome()
                }
                onPressed: {
                    rectBackHome.scale=0.7

                }
                onReleased: {
                    rectBackHome.scale=1.0
                }
            }
        }

        Rectangle{
            id: rectToCompany
            width: parent.width/3
            height: parent.height
            color: "transparent"
            Image{
                id: toCompany
                width: root.iconSize
                height: root.iconSize
                anchors.top: parent.top
                anchors.topMargin: root.tMargin
                anchors.horizontalCenter: parent.horizontalCenter
                source: "pic/toCompany.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        root.clickToCompany()
                    }
                }
            }
            Text{
                anchors.top:toCompany.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                text: "去公司"
                font.pixelSize: root.fontSize
                color: "white"
            }
            // 设置缩放动画行为
            Behavior on scale {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.InOutQuad  // 缓动曲线
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.clickToCompany()
                }
                onPressed: {
                    rectToCompany.scale=0.7

                }
                onReleased: {
                    rectToCompany.scale=1.0
                }
            }
        }

        Rectangle{
            id: rectChargeStation
            width: parent.width/3
            height: parent.height
            color: "transparent"
            Image{
                id: chargeStation
                width: root.iconSize
                height: root.iconSize
                anchors.top: parent.top
                anchors.topMargin: root.tMargin
                anchors.horizontalCenter: parent.horizontalCenter
                source: "pic/chargeStation.png"

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        root.clickChargeStation()
                    }
                }
            }
            Text{
                anchors.top:chargeStation.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                text: "充电站"
                font.pixelSize: root.fontSize
                color: "white"
            }
            // 设置缩放动画行为
            Behavior on scale {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.InOutQuad  // 缓动曲线
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.clickChargeStation()
                }
                onPressed: {
                    rectChargeStation.scale=0.7

                }
                onReleased: {
                    rectChargeStation.scale=1.0
                }
            }
        }

    }
}
