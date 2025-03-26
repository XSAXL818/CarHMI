import QtQuick

Rectangle {
    id: root
    // anchors.fill: parent
    anchors.left: parent.left
    anchors.leftMargin: 50
    anchors.top: parent.top
    anchors.topMargin: 50
    anchors.right: parent.right
    anchors.rightMargin: 20
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 200
    color: "lightgray"

    property real perWidth: root.width/10
    property real topHeight: 200

    Rectangle{
        id: top
        width: root.width
        height: root.topHeight
        color: "blue"

    }

    Rectangle{
        id: bottom
        width: root.width
        height: root.height-top.height-10
        anchors.top: top.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        color: "green"


        AppCard{
            id: amap
            bgSource: "pic/geo.jpg"
            iconSource: "pic/Amap.png"
            app: "道德地图"
            appColor: "black"
            bottomComponent: AmapBottomComponent{
                height: parent.height
                iconSize: 25

                onClickBackHome: {
                    console.log("回家")
                }

                onClickToCompany: {
                    console.log("去公司")
                }

                onClickChargeStation: {
                    console.log("充电站")
                }
            }
        }
        AppCard{
            anchors.left: amap.right
            anchors.leftMargin: 10
            bgSource: "pic/QQMusicBG.png"
            iconSource: "pic/QQMusic.png"
            app: "QQ音乐"
            appColor: "black"

            centerComponent: QQMusicCenterComponent{
                anchors.fill: parent
            }

            bottomComponent: QQMusicBottomComponent{
                height: parent.height
            }

        }

    }



}
