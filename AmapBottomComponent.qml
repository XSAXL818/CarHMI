import QtQuick


Rectangle {
    id: root
    anchors.fill: parent
    radius: 10
    color: "#99000000"

    // width: 200
    // height: 70

    property real iconSize: 40
    property real tMargin: 10
    property int fontSize: 15

    Row{
        anchors.fill: parent
        Rectangle{
            width: parent.width/3
            height: parent.height
            color: "transparent"
            Image{
                id: backHome
                width: root.iconSize
                height: root.iconSize
                anchors.top: parent.top
                anchors.topMargin: root.tMargin
                anchors.horizontalCenter: parent.horizontalCenter
                source: "pic/backHome.png"
            }
            Text{
                anchors.top:backHome.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "回家"
                font.pixelSize: root.fontSize
                color: "white"
            }
        }

        Rectangle{
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
            }
            Text{
                anchors.top:toCompany.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "去公司"
                font.pixelSize: root.fontSize
                color: "white"
            }
        }

        Rectangle{
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
            }
            Text{
                anchors.top:chargeStation.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "充电站"
                font.pixelSize: root.fontSize
                color: "white"
            }
        }

    }
}
