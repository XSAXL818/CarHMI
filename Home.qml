import QtQuick
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    anchors.fill: parent
    color: "transparent"

    property real perWidth: root.width/10
    property real topHeight: 110

    // 天气属性
    property string climateSouce: "pic/sunny.png"
    property string climateLocation: "兰州市 安宁区"
    property string climateDetail: mainPage.wp + " " + mainPage.tem // "晴转多云 32°"
    property string airQuality: mainPage.aqiDesc //"优"
    property color airColor: "green"
    property string timeClock: mainPage.hours + ":" + mainPage.minutes
    property string timeDate: mainPage.month + "月" + mainPage.day + "日 " + mainPage.dayIndex

    signal clickBackHome

    // 顶部小组件
    Rectangle{
        id: top
        width: root.width
        height: root.topHeight
        // color: "blue"
        color: "transparent"

        property real mTopMargin: 20

        // ai助手
        Rectangle{
            id: aiChat
            width: root.perWidth*3.2
            height: top.height
            // color: "transparent"
            topLeftRadius: 50
            radius: 20

            gradient: Gradient{
                GradientStop{
                    position: 0.0
                    color: "#3f4658"
                }
                GradientStop{
                    position: 0.5
                    color: "#1a1f2a"
                }
            }

            Image {
                id: aiIcon
                source: "pic/aiIcon.png"
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height-top.mTopMargin*2
                width: height
                anchors.left: parent.left
                anchors.leftMargin: 20
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
        // 天气组件
        Rectangle{
            id: weatherRect
            width: root.perWidth*5
            height: top.height
            anchors.left: aiChat.right
            // color: "red"

            gradient: Gradient{
                orientation: Gradient.Horizontal
                GradientStop{
                    position: 0.0
                    color: "#3f4658"
                }
                GradientStop{
                    position: 0.5
                    color: "#1a1f2a"
                }
            }
            topLeftRadius: 50
            radius: 20

            property real perWidth: width/10


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
                    anchors.left: parent.left
                    anchors.leftMargin: 20
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
        // 时间组件
        Rectangle{
            id: time
            width: root.perWidth*2
            height: top.height
            anchors.left: weatherRect.right
            color: "transparent"
            // color: "#EDe8e6e4"

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
    // 卡片
    Rectangle{
        id: bottom
        width: root.width
        height: root.height-top.height-20
        anchors.top: top.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        color: "transparent"

        // 地图
        AppCard{
            id: amap
            width: 300
            anchors.verticalCenter: parent.verticalCenter
            bgSource: "pic/geo.png"
            iconSource: "pic/Amap.png"
            app: "道德地图"
            appColor: "black"
            bottomComponent: AmapBottomComponent{
                height: parent.height
                iconSize: 25

                onClickBackHome: {
                    mainPageRightPart.clickNavBackHome()

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

        // 音乐
        AppCard{
            id: qqMusic
            width: 300
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
                    mainPage.isPlay = isPlay
                }
            }
        }

        // 汽车模型
        Rectangle{
            anchors.left: qqMusic.right
            anchors.right: parent.right
            anchors.rightMargin: 70
            anchors.top: qqMusic.top
            anchors.bottom: parent.bottom
            color: "transparent"

            // 汽车信息
            Rectangle{
                id: carConditionRect
                width: parent.width-20
                height: parent.height/2-40
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 20
                color: "transparent"

                CarConditionCard{
                    anchors.fill: parent
                    electrical: mainPage.electrical === 100 ? 5 :
                                mainPage.electrical >= 80 ? 4 :
                                mainPage.electrical >= 60 ? 3 :
                                mainPage.electrical >= 40 ? 2 :
                                mainPage.electrical >= 20 ? 1 :
                                0

                    distance: mainPage.mileage
                    days: mainPage.companyDay
                    electDistance: mainPage.electDistance

                }

            }
            // 应用卡片
            Rectangle{
                id: appRect
                width: parent.width
                height: amap.height-carConditionRect.height
                anchors.top: carConditionRect.bottom
                anchors.left: parent.left
                // anchors.bottom: qqMusic.bottom
                color: "transparent"

                Rectangle{
                    id: ximalaya
                    anchors.top: parent.top
                    anchors.topMargin: 40
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    width: (parent.width/10)*6
                    height: parent.height-40
                    color: "transparent"

                    Ximalaya{
                        anchors.fill: parent
                    }
                }

                Rectangle{
                    id: appSet
                    anchors.top: parent.top
                    anchors.topMargin: 40
                    anchors.left: ximalaya.right
                    anchors.leftMargin: 20
                    anchors.right: parent.right
                    height: ximalaya.height
                    radius: 20
                    // color: "orange"

                    property var iconSources: ["pic/nav.png","pic/brower.png","pic/phone.png","pic/chatAss.png"]

                    color: "#222834"
                    // 启用图层渲染
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true  // 透明边缘处理
                        color: "#80ffffff"       // 阴影颜色（带透明度）
                        radius: 20               // 模糊半径
                        samples: 41              // 采样数（建议值为 radius*2+1）
                        horizontalOffset: -4      // 水平偏移
                        verticalOffset: -4        // 垂直偏移
                    }

                    // 网格布局
                    Grid {
                        anchors.centerIn: parent
                        rows: 2        // 行数
                        columns: 2     // 列数
                        spacing: 20    // 方格间距

                        // 批量生成 4 个方格
                        Repeater {
                            model: 4   // 生成 4 个子项
                            delegate: RoundedIcon {
                                size: 50
                                iconSource: appSet.iconSources[index]

                            }
                        }
                    }


                }

            }


        }

    }



}
