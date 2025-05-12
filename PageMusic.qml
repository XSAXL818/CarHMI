import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtMultimedia


Rectangle {
    id: root

    color: "transparent"

    property var songImgSources: ["pic/power.png","pic/song1.jpg","pic/song2.jpg","pic/song3.jpg","pic/song4.jpg","pic/song5.jpg",]
    property var songNames: ["POWER","半碗失忆","盛夏海边","吸引","礼物","我的回答",]
    property var songSinger: ["权志龙","卢润泽","庄淇玟29","K.A咔咔","龙神道","善宇",]
    property var zjImgSource: ["pic/zj1.png","pic/zj2.png","pic/zj3.png","pic/zj4.png","pic/zj5.png",]
    property var zjNames: ["泡芙小姐，会有人陪在她身边吗？","大女主显化：能量爆棚显化神曲","周杰伦歌曲大全！一张歌单全听完","浪琴表520心动BGM","站内收藏量过百万的欧美热曲",]
    property var zjPlay: ["141.5万","271.8万","8.5亿","3.6万","1.9亿",]

    Column{
        anchors.fill: parent

        Rectangle{
            id: rect1
            width: parent.width
            height: 50
            color:"transparent"

            Row{
                anchors.left: parent.left
                anchors.leftMargin: 20
                spacing: 30
                ProfilePicture{
                    size: rect1.height
                    source: "pic/power.png"
                }
                Image {
                    width:rect1.height
                    height: rect1.height
                    source: "pic/sunny.png"
                }
                Text {
                    width:rect1.height
                    height: rect1.height
                    verticalAlignment: Text.AlignVCenter
                    text:  mainPage.wp
                    font.pixelSize: 24
                }
                Text {
                    width:rect1.height
                    height: rect1.height
                    verticalAlignment: Text.AlignVCenter
                    text:  mainPage.tem + "°C"
                    font.pixelSize: 24
                }
                Text{
                    width: root.width/2 - 8.5*rect1.height
                    height: 1
                }

                Text {
                    width:rect1.height
                    height: rect1.height
                    verticalAlignment: Text.AlignVCenter
                    text: mainPage.hours + " : " + mainPage.minutes
                    font.pixelSize: 24
                }
            }

        }

        Rectangle{
            id: rect2
            width: parent.width
            height: 70
            color:"transparent"

            Row{
                spacing: 30
                anchors.left: parent.left
                anchors.leftMargin: 20

                Text {
                    id: txt1
                    width:rect2.height
                    height: rect2.height
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text:  "推荐"
                    font.bold: true
                    font.pixelSize: 24
                }
                Text {
                    id: txt2
                    width:rect2.height
                    height: rect2.height
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text:  "歌单"
                    font.bold: true
                    font.pixelSize: 24
                }

                Text {
                    id: txt3
                    width:rect2.height
                    height: rect2.height
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: "排行榜"
                    font.bold: true
                    font.pixelSize: 24
                }

                Text{
                    width: rect2.width-rect2.height*3-input.width-250
                    height: 1
                }

                Rectangle{
                    id: input
                    height: rect2.height
                    width: childrenRect.width
                    color:"transparent"

                    // 文本输入区域
                    TextField {
                        width: 300
                        height: rect2.height-30
                        anchors.verticalCenter: parent.verticalCenter
                        placeholderText: "搜索"
                        font.pixelSize: 16

                        // 自定义左侧搜索图标
                        leftPadding: 45  // 增加左边距给图标留空间

                        // 自定义背景
                        background: Rectangle {
                            radius: height/2
                            color: "#FFFFFF"
                            border.color: parent.activeFocus ? "#007AFF" : "#E0E0E0"
                            border.width: 2

                            // 内阴影效果
                            layer.enabled: true
                            layer.effect: DropShadow {
                                verticalOffset: 2
                                radius: 8
                                samples: 17
                                color: "#10000000"
                            }

                            Image {
                                source: "pic/search.png"
                                width: 25
                                height: 25
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        // 清除按钮
                        Button {
                            id: clearButton
                            anchors {
                                right: parent.right
                                verticalCenter: parent.verticalCenter
                                margins: 10
                            }
                            width: 24
                            height: 24
                            visible: parent.text.length > 0
                            background: Rectangle {
                                radius: 12
                                color: "#30000000"
                                Image {
                                    source: "pic/close.png"
                                    anchors.centerIn: parent
                                    sourceSize: Qt.size(12,12)
                                }
                            }
                            onClicked: parent.text = ""
                        }
                    }
                }


            }

            Rectangle{
                width: 50
                height: 10
                color: mainPage.blueColor
                x: txt1.x + txt1.width/2 - width/2 + 20
                y: txt1.y + txt1.height - height - 10

                radius: 10
            }

        }

        Rectangle{
            id: rect3
            width: parent.width
            height: 480
            color:"transparent"

            Row{
                width: parent.width
                height: parent.height

                Column{
                    height: parent.height
                    width: parent.width/10*7
                    Row{
                        spacing: 5
                        width: parent.width
                        height: rect3.height/2 - 30

                        Rectangle{
                            width: parent.width/3-40-10
                            height: parent.height
                            color:"transparent"
                            radius: 50

                            RoundedIcon {
                                iconSource: "pic/recommed1.png"
                                width: parent.width-20
                                height: parent.height-40
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 15
                                anchors.right: parent.right
                            }
                        }

                        Rectangle{
                            width: parent.width/3+80-10+20
                            height: parent.height
                            color:"transparent"


                            RoundedIcon {
                                iconSource: "pic/recommed2.png"
                                iconRadius: 20
                                width: parent.width
                                height: parent.height
                            }
                        }

                        Rectangle{
                            width: parent.width/3-40-10
                            height: parent.height
                            color:"transparent"


                            RoundedIcon {
                                iconSource: "pic/recommed3.png"
                                iconRadius: 20
                                width: parent.width-20
                                height: parent.height-40
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 15
                                anchors.left: parent.left
                            }
                        }



                    }

                    Rectangle{
                        width: parent.width
                        height: 50
                        color: "transparent"

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            height: parent.height
                            width: 50
                            text: "歌单"
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                            font.pixelSize: 24
                        }

                        Text {
                            anchors.right: parent.right
                            anchors.rightMargin: 50
                            anchors.top: parent.top
                            height: parent.height
                            width: 50
                            text: "更多   >"
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: 20
                        }

                    }

                    Row{
                        width: parent.width
                        height: rect3.height/2
                        anchors.left: parent.left
                        anchors.leftMargin: 20

                        spacing:10

                        Repeater{
                            model: 6
                            delegate: Rectangle{
                                height: parent.height
                                width: 145
                                color: "transparent"

                                RoundedIcon {
                                    id: musicIcon1
                                    iconSource: root.songImgSources[index]
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    anchors.right: parent.right
                                    anchors.bottom: parent.bottom

                                    anchors.bottomMargin: 80
                                }

                                Text {
                                    id: musicName1
                                    anchors.top:musicIcon1.bottom
                                    anchors.topMargin: 5
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    text: root.songNames[index]
                                    font.pixelSize: 24
                                }
                                Text {
                                    id: musicSin1
                                    anchors.top:musicName1.bottom
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    text: root.songSinger[index]
                                    font.pixelSize: 16
                                }

                            }
                        }


                    }

                }


                Rectangle{
                    width: parent.width/10*3 - 20
                    height: parent.height
                    radius: 20
                    color: "white"

                    Column{
                        anchors.fill: parent
                        spacing: 5

                        Text{
                            width: 1
                            height: 10
                        }

                        Repeater{
                            anchors.fill: parent
                            model: 5

                            delegate: Rectangle{
                                width: parent.width-20
                                height: 90
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                color: "transparent"

                                RoundedIcon{
                                    id: zhuanji
                                    width: 80
                                    height: parent.height-10
                                    iconSource: root.zjImgSource[index]
                                }

                                Column{
                                    anchors.left: zhuanji.right
                                    anchors.leftMargin: 20
                                    anchors.top: parent.top
                                    anchors.right: parent.right
                                    height: parent.height

                                    Text{
                                        font.pixelSize: 16
                                        font.bold: true
                                        verticalAlignment: Text.AlignVCenter

                                        text: root.zjNames[index]
                                    }

                                    Text{
                                        width: 1
                                        height: 20
                                    }

                                    Text{
                                        font.pixelSize: 12
                                        font.bold: true
                                        verticalAlignment: Text.AlignVCenter

                                        text: "播放量:" +  root.zjPlay[index]
                                    }
                                }
                            }
                        }

                    }
                }


            }

        }

        Rectangle{
            id: rect4
            width: parent.width
            height: 160
            color: "transparent"
            // color: "orange"

            Row{
                anchors.fill: parent
                Text{ width: 10 ;height: 1 }

                // 歌曲图片
                Rectangle{
                    width: 120
                    height: rect4.height
                    color: "transparent"
                    RoundedIcon{
                        iconSource: mainPage.songIconList[mainPage.curPlayIndex]
                        size: 100
                        anchors.centerIn: parent
                    }
                }
                // 歌曲信息和操作
                Column{
                    width: 300
                    height: parent.height

                    Text{
                        width: parent.width
                        height: parent.height/2
                        font.pixelSize: 20
                        text: mainPage.songNameList[mainPage.curPlayIndex] + " - " + mainPage.songSingerList[mainPage.curPlayIndex]
                        verticalAlignment: Text.AlignVCenter
                    }

                    // 操作
                    Row{
                        width: parent.width
                        height: parent.height/2
                        spacing: 10

                        Image{
                            width: 35
                            height: 35
                            source: "pic/love.png"
                        }
                        Image{
                            width: 35
                            height: 35
                            source: "pic/pl.png"
                        }
                        Image{
                            width: 35
                            height: 35
                            source: "pic/more.png"
                        }
                    }

                }

                // 播放控制
                Column{
                    width: 400
                    height: parent.height

                    Text{
                        width: 1
                        height: 20
                    }

                    // 播放/暂停等
                    Row{
                        width: parent.width
                        height: parent.height/2

                        // 播放顺序
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "transparent"

                            Image {
                                height: 40
                                width: 40
                                source: "pic/seqPlay.png"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "transparent"

                            Image {
                                height: parent.height-30
                                width: parent.height-30
                                source: "pic/lastSong256.png"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter

                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        mainPage.lastSong()
                                    }
                                }
                            }
                        }

                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "transparent"

                            Image {
                                height: parent.height-20
                                width: parent.height-20
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                source: mainPage.isPlay ? "pic/play256.png" : "pic/paused256.png"

                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        mainPage.isPlay = !mainPage.isPlay
                                    }
                                }
                            }
                        }

                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "transparent"

                            Image {
                                height: parent.height-30
                                width: parent.height-30
                                source: "pic/nextSong256.png"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter

                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        mainPage.nextSong()
                                    }
                                }
                            }
                        }

                        // 音量
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "transparent"

                            Image {
                                height: 40
                                width: 40
                                source: "pic/volume.png"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }

                    Row{
                        width: parent.width
                        height: parent.height/2 - 20

                        Text{
                            width: 40
                            height: parent.height
                            text: mainPage.curSongTime
                            font.pixelSize: 20
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text{
                            width: 10
                            height: 1
                        }

                        // 进度条
                        Rectangle{
                            width: 290
                            height: parent.height
                            color:"transparent"

                            Slider{
                                id: volumeSlider
                                anchors.fill: parent
                                orientation: Qt.Horizontal
                                value: player.position / player.duration



                                onMoved: function(){
                                    player.position = player.duration*volumeSlider.position
                                }
                            }
                        }
                        Text{
                            width: 10
                            height: 1
                        }

                        Text{
                            width: 40
                            height: parent.height
                            text: mainPage.totalSongTime
                            font.pixelSize: 20
                            verticalAlignment: Text.AlignVCenter
                        }
                    }


                }


                Text{
                    width: 100
                    height: 1
                }

                // 音质、播放列表等
                Rectangle{
                    height: parent.height
                    width: 80
                    color: "transparent"

                    Image {
                        height: 50
                        width: 50
                        source: "pic/volQual.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Rectangle{
                    height: parent.height
                    width: 80
                    color: "transparent"

                    Image {
                        height: 50
                        width: 50
                        source: "pic/dubi.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Rectangle{
                    height: parent.height
                    width: 80
                    color: "transparent"

                    Image {
                        height: 50
                        width: 50
                        source: "pic/lyrics.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Rectangle{
                    height: parent.height
                    width: 80
                    color: "transparent"

                    Image {
                        height: 50
                        width: 50
                        source: "pic/list.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }


    Component.onDestruction: {
        mainPageRightPart.enterPageMusic(false)
    }
}
