import QtQuick
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    anchors.fill: parent
    // color: "lightgray"
    color: "transparent"

    property real perWidth: root.width/10
    property real topHeight: 150

    // 天气属性
    property string climateSouce: "pic/sunny.png"
    property string climateLocation: "兰州市 安宁区"
    property string climateDetail: "晴转多云 32°"
    property string airQuality: "优"
    property color airColor: "green"
    property string timeClock: "20:44"
    property string timeDate: "9月5日 星期四"


    Rectangle{
        id: top
        width: root.width
        height: root.topHeight
        // color: "blue"
        color: "transparent"

        property real mTopMargin: 40

        Rectangle{
            id: aiChat
            width: root.perWidth*3.2
            height: top.height
            // color: "transparent"
            topLeftRadius: 50
            radius: 20

            gradient: Gradient{
                orientation: Gradient.Horizontal
                GradientStop{
                    position: 0.0
                    color: "gray"
                }
                GradientStop{
                    position: 0.5
                    color: "black"
                }

            }

            Image {
                id: aiIcon
                source: "pic/aiIcon.png"
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height-top.mTopMargin*2
                width: height
            }

            Text{
                id: txt1
                anchors.left: aiIcon.right
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: top.mTopMargin
                height: parent.height/5
                text:"你可以这样说:"
                color: "lightgray"
                font.pixelSize: 15
            }

            Text{
                id: query
                anchors.left: txt1.left
                // anchors.leftMargin: 5
                anchors.top: txt1.bottom
                anchors.topMargin: 10
                height: parent.height/3
                text:"小爱去公司的路况怎么样?"
                color: "white"
                font.pixelSize: 18
            }
        }

        Rectangle{
            id: weatherRect
            width: root.perWidth*5
            height: top.height
            anchors.left: aiChat.right
            // color: "red"

            topLeftRadius: 50
            radius: 20

            property real perWidth: width/10

            gradient: Gradient{
                orientation: Gradient.Horizontal
                GradientStop{
                    position: 0.0
                    color: "gray"
                }
                GradientStop{
                    position: 0.5
                    color: "black"
                }
            }

            Rectangle{
                id: w1
                width: weatherRect.perWidth*5
                height: weatherRect.height
                color: "transparent"

                Image {
                    id: weatherIcon
                    source: root.climateSouce
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height-top.mTopMargin*2
                    width: height
                }

                Text{
                    id: location
                    anchors.left: weatherIcon.right
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: top.mTopMargin
                    height: parent.height/4
                    text: root.climateLocation

                    color: "white"
                    font.pixelSize: 18
                }

                Text{
                    id: weatherText
                    anchors.left: location.left
                    anchors.top: location.bottom
                    anchors.topMargin: 5
                    height: parent.height/5
                    text: root.climateDetail
                    color: "lightgray"
                    font.pixelSize: 15
                }
            }
            Rectangle{
                id: w2
                width: 4
                height: weatherRect.height-20
                anchors.verticalCenter: parent.verticalCenter
                color: "lightgray"
                anchors.left: w1.right

            }
            Rectangle{
                id: w3
                width: w1.perWidth*6
                height: weatherRect.height
                anchors.left: w2.right
                color: "transparent"

                Text{
                    id: airQuality
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                    anchors.top: parent.top
                    anchors.topMargin: top.mTopMargin
                    height: parent.height/4
                    text:"空气质量"

                    color: "white"
                    font.pixelSize: 18
                }

                Text{
                    id: airQualityLabel
                    anchors.left: airQuality.right
                    anchors.leftMargin: 5
                    anchors.top: airQuality.top
                    // anchors.topMargin: top.mTopMargin
                    height: parent.height/4
                    text: root.airQuality
                    color: root.airColor
                    font.pixelSize: 18
                }

                Text{
                    id: airLocation
                    anchors.left: airQuality.left
                    anchors.top: airQuality.bottom
                    anchors.topMargin: 5
                    height: parent.height/5
                    text:"车内 20 车外 120"
                    color: "lightgray"
                    font.pixelSize: 15
                }
            }

        }

        Rectangle{
            id: time
            width: root.perWidth*2
            height: top.height
            anchors.left: weatherRect.right
            color: "transparent"

            Text{
                id: time1
                width: parent.width
                height: (parent.height/4)*2.5
                anchors.top: parent.top
                anchors.topMargin: 10
                horizontalAlignment: Qt.AlignHCenter
                text: root.timeClock
                color: "white"
                font.pixelSize: 66
            }
            Text{
                id: date1
                width: parent.width
                height: parent.height/4
                anchors.top: time1.bottom
                horizontalAlignment: Qt.AlignHCenter
                color: "lightgray"
                text: root.timeDate
                font.pixelSize: 20
            }
        }

    }

    Rectangle{
        id: bottom
        width: root.width
        height: root.height-top.height-20
        anchors.top: top.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        color: "green"


        AppCard{
            id: amap
            width: 250
            anchors.verticalCenter: parent.verticalCenter
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
            id: qqMusic
            width: 250
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: amap.right
            anchors.leftMargin: 10
            bgSource: "pic/QQMusicBG.png"
            iconSource: "pic/QQMusic.png"
            app: "QQ音乐"
            appColor: "white"

            centerComponent: QQMusicCenterComponent{
                anchors.fill: parent
            }

            bottomComponent: QQMusicBottomComponent{
                height: parent.height

                onClickLeft: {
                    console.log("上一首")
                }

                onClickCenter: (isPlay) => {
                    console.log("当前播放状态:"+isPlay)
                }
            }

        }

    }



}
