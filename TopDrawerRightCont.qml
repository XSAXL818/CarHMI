import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

Rectangle {
    id: root
    anchors.fill: parent
    color: "#bE5d5b58"


    property int myLeftMargin: 200
    property int myTopMargin: 60
    property double perWidth: (width-myLeftMargin*2)/2
    property double perHeight: (height-myTopMargin*3)/2

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

    Rectangle{
        id: cont
        color: "transparent"
        anchors.fill: parent
        anchors.leftMargin: root.myLeftMargin
        anchors.topMargin: root.myTopMargin
        anchors.bottom: root.bottom

        Rectangle{
            id: block1
            width: root.perWidth
            height: root.perHeight
            color:"transparent"
            property double perRowHeight: (height-80)/2

            Text {
                id: title1
                text: qsTr("Dlink快捷")
                color: "white"
                font.pixelSize: 30
            }
            Rectangle{
                id: btns1
                anchors.top: title1.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color:"transparent"

                RowLayout{
                    id: row1
                    width: parent.width
                    height: block1.perRowHeight

                    RightDrawerButton{
                        id: wifiBtn
                        width: block1.perRowHeight
                        height: block1.perRowHeight
                        text: "无线网络"
                        imgSource: "pic/wifi_white.png"
                        isOn: mainPage.isWIFIOn

                        onIsOnChanged: {
                            mainPage.isWIFIOn = isOn
                        }
                    }
                    RightDrawerButton{
                        id: bluetoothBtn
                        width: block1.perRowHeight
                        height: block1.perRowHeight
                        text: "蓝牙"
                        imgSource: "pic/bluetooth_white.png"
                        isOn: mainPage.isBluetoothOn

                        onIsOnChanged: {
                            mainPage.isBluetoothOn = isOn
                        }
                    }
                    RightDrawerButton{
                        id: themeBtn
                        width: block1.perRowHeight
                        height: block1.perRowHeight
                        text: "深色主题"
                        imgSource: "pic/theme_white.png"
                        isOn: mainPage.isThemeOn

                        onIsOnChanged: {
                            mainPage.isThemeOn = isOn
                        }
                    }
                }

                RowLayout{
                    id: row2
                    anchors.top: row1.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    width: parent.width
                    height: block1.perRowHeight

                    RightDrawerButton{
                        id: locationBtn
                        width: block1.perRowHeight
                        height: block1.perRowHeight
                        text: "位置共享"
                        imgSource: "pic/navigation_white.png"
                        isOn: mainPage.isLocationOn

                        onIsOnChanged: {
                            mainPage.isLocationOn = isOn
                        }

                    }
                    RightDrawerButton{
                        id: qlyBtn
                        width: block1.perRowHeight
                        height: block1.perRowHeight
                        text: "千里眼"
                        imgSource: "pic/QianLiYan_white.png"
                        isOn: mainPage.isQLYOn

                        onIsOnChanged: {
                            mainPage.isQLYOn = isOn
                        }

                    }
                    RightDrawerButton{
                        id: rotateBtn
                        width: block1.perRowHeight
                        height: block1.perRowHeight
                        text: "自动旋转"
                        imgSource: "pic/rotate_white.png"
                        isOn: mainPage.isRotateOn

                        onIsOnChanged: {
                            mainPage.isRotateOn = isOn
                        }
                    }
                }


            }

        }

        Rectangle{
            id: block2
            width: root.perWidth
            height: root.perHeight
            anchors.left: block1.right
            anchors.leftMargin: 20
            color:"transparent"

            property double perRowHeight: (height-80)/2


            Text {
                id: title2
                text: qsTr("赛车控制")
                color: "white"
                font.pixelSize: 30
            }
            Rectangle{
                id: btns2
                anchors.top: title2.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color:"transparent"

                RowLayout{
                    id: row3
                    width: parent.width
                    height: block2.perRowHeight

                    RightDrawerButton{
                        id: hudBtn
                        width: block2.perRowHeight
                        height: block2.perRowHeight
                        text: "抬头显示"
                        imgSource: "pic/HUD.png"
                        isOn: mainPage.isHUDOn

                        onIsOnChanged: {
                            mainPage.isHUDOn = isOn
                        }

                    }
                    RightDrawerButton{
                        id: xjBtn
                        width: block2.perRowHeight
                        height: block2.perRowHeight
                        text: "动态悬架"
                        imgSource: "pic/XuanJia.png"
                        isOn: mainPage.isXJOn

                        onIsOnChanged: {
                            mainPage.isXJOn = isOn
                        }

                    }
                    RightDrawerButton{
                        id: tfBtn
                        width: block2.perRowHeight
                        height: block2.perRowHeight
                        text: "通风加热"
                        imgSource: "pic/TongFeng.png"
                        isOn: mainPage.isTFOn

                        onIsOnChanged: {
                            mainPage.isTFOn = isOn
                        }
                    }
                }

                RowLayout{
                    id: row4
                    anchors.top: row3.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    width: parent.width
                    height: block2.perRowHeight

                    RightDrawerButton{
                        id: csBtn
                        width: block2.perRowHeight
                        height: block2.perRowHeight
                        text: "电除霜"
                        imgSource: "pic/ChuShuang.png"
                        isOn: mainPage.isCSOn

                        onIsOnChanged: {
                            mainPage.isCSOn = isOn
                        }

                    }
                    RightDrawerButton{
                        id: tcBtn
                        width: block2.perRowHeight
                        height: block2.perRowHeight
                        text: "天窗"
                        imgSource: "pic/TianChuang.png"
                        isOn: mainPage.isTCOn

                        onIsOnChanged: {
                            mainPage.isTCOn = isOn
                        }

                    }
                    RightDrawerButton{
                        id: espBtn
                        width: block2.perRowHeight
                        height: block2.perRowHeight
                        text: "ESP"
                        imgSource: "pic/ESP.png"
                        isOn: mainPage.isESPOn

                        onIsOnChanged: {
                            mainPage.isESPOn = isOn
                        }

                    }
                }
            }
        }

        Rectangle{
            id: block3
            width: root.perWidth
            height: root.perHeight
            anchors.top: block1.bottom
            anchors.topMargin: 20
            color:"transparent"

            Text {
                id: title3
                text: qsTr("音量")
                color: "white"
                font.pixelSize: 30
            }
            Rectangle{
                id: silders1
                anchors.top: title3.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color:"transparent"


                RoundedSlider{
                    id: volumeSlider1
                    width: parent.width
                    height: parent.height/2-40
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    closeSource: "pic/mute.png"
                    text:"媒体音量"
                    isOpenMutResouce: true
                    lowSource: "pic/volumeLow.png"
                    medSource: "pic/volumeMiddle.png"
                    highSource: "pic/volumeHigh.png"

                    value: mainPage.mediaVolume

                    onPositionChanged: {
                        mainPage.mediaVolume = value
                    }

                }

                RoundedSlider{
                    id: volumeSlider2
                    width: parent.width
                    height: parent.height/2-40
                    anchors.left: parent.left
                    anchors.top: volumeSlider1.bottom
                    anchors.topMargin: 20
                    closeSource: "pic/mute.png"
                    text:"导航音量"
                    isOpenMutResouce: true
                    lowSource: "pic/volumeLow.png"
                    medSource: "pic/volumeMiddle.png"
                    highSource: "pic/volumeHigh.png"

                    value: mainPage.navVolume

                    onPositionChanged: {
                        mainPage.navVolume = value
                    }

                }
            }
        }

        Rectangle{
            id: block4
            width: root.perWidth
            height: root.perHeight
            anchors.left: block3.right
            anchors.leftMargin: 20
            anchors.top: block2.bottom
            anchors.topMargin: 20
            color:"transparent"


            Text {
                id: title4
                text: qsTr("亮度")
                color: "white"
                font.pixelSize: 30
            }
            Rectangle{
                id: silders2
                anchors.top: title4.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color:"transparent"


                RoundedSlider{
                    id: brightnessSlider1
                    width: parent.width
                    height: parent.height/2-40
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    onSource: "pic/brightness.png"
                    closeSource: "pic/brightness.png"
                    text:"中控亮度"
                    isOpenImageRotate: true

                    value: mainPage.controlBrightness

                    onPositionChanged: {
                        mainPage.controlBrightness = value
                    }
                }

                RoundedSlider{
                    id: brightnessSlider2
                    width: parent.width
                    height: parent.height/2-40
                    anchors.left: parent.left
                    anchors.top: brightnessSlider1.bottom
                    anchors.topMargin: 20
                    onSource: "pic/brightness.png"
                    closeSource: "pic/brightness.png"
                    text:"仪表亮度"
                    isOpenImageRotate: true
                    value: mainPage.insBrightness

                    onPositionChanged: {
                        mainPage.insBrightness = value
                    }
                }
            }
        }
    }





}
