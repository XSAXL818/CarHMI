import QtQuick
import QtQuick.Controls

Rectangle {
    id: root

    anchors.fill: parent
    color:"transparent"

    Rectangle{
        id: left
        width: 160
        height: root.height
        color:"#212732"
        radius: 10

        SliderBtn{
            width: parent.width
            height: parent.height
            isHorizontal: false
            needToMinusSize: 30
            btnNames: mainPage.leftBtnNames
            onBtnSelected: index => {
                               // console.log(index)

                           }
        }

    }

    Rectangle{
        id: right
        anchors.left: left.right
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.top: parent.top
        height: root.height
        color:"#1b1e2c"
        radius: 20

        Rectangle{
            id: rightTop
            width: parent.width
            height: 60
            color: "#272f41"
            radius: 10

            property int currentIndex: 0

            property var btnNames: ["智能底盘","灯光氛围","抬头显示","迎宾","智能记忆","空调","门窗和锁","智能提醒"]
            // 按钮容器
            Row {
                anchors.fill: parent

                Repeater {
                    model: rightTop.btnNames.length

                    Button {
                        width: parent.width / rightTop.btnNames.length
                        height: parent.height

                        background: Rectangle {
                            color: "transparent"

                            // 文字样式
                            Text {
                                z: topSlider.z+1
                                text: rightTop.btnNames[index]
                                anchors.centerIn: parent
                                color: root.currentIndex === index ? "lightblue" : /*"#666"*/ "white"

                                font.pixelSize: 20
                            }
                        }

                        // 点击切换当前选中索引
                        onClicked: {
                            rightTop.currentIndex = index
                            switch(index) {
                            case 0:
                                flickable.scrollToPosition(title1.y)
                                break;
                            case 1:
                                flickable.scrollToPosition(title2.y)
                                break;
                            case 2:
                                flickable.scrollToPosition(title3.y)
                                break;
                            case 3:
                                flickable.scrollToPosition(title4.y)
                                break;
                            }
                        }
                    }
                }
            }

            // 滑动指示条
            Rectangle {
                id: topSlider
                width: 50
                height: 10
                color: "#31c0ec"

                y: parent.height - height
                radius: height/2

                // 动态计算x位置
                x: rightTop.currentIndex * (parent.width / rightTop.btnNames.length) + ( (parent.width / rightTop.btnNames.length  /2 ) - width/2)

                // 平滑动画
                Behavior on x {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }
            }


        }

        Rectangle{
            id: rightLeft
            width: parent.width/2 - 60
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: rightTop.bottom
            anchors.topMargin: 30
            anchors.bottom: parent.bottom
            color: "transparent"


            // 使用 Flickable 包裹内容
            Flickable {
                id: flickable
                anchors.fill: parent
                clip: true
                contentHeight: col.height // 关键：设置内容总高度

                // 滚动到指定位置的动画
                Behavior on contentY { NumberAnimation { duration: 500 } }

                // 触发动画滚动的函数（例如点击按钮）
                function scrollToPosition(posY) {
                    // 确保不超过内容边界
                    flickable.contentY = Math.min(Math.max(posY, 0), contentHeight - height)
                }

                Column{
                    id: col
                    spacing: 5
                    width: parent.width-50
                    height: childrenRect.height

                    Rectangle{
                        id: rect1
                        width: parent.width
                        height: childrenRect.height
                        color: "transparent"
                        Column{
                            width: parent.width
                            height: childrenRect.height
                            spacing: 15

                            // 1
                            MyTitle{ id: title1; type: 2 ;text: "智能底盘" }

                            MyTitle{ type: 4 ;text: "转向助力模式" }
                            SliderBtn{
                                width: parent.width
                                height: 40
                                openBackground: true
                                isGradient: false
                                btnNames: ["舒适","运动"]
                            }

                            MyTitle{ type: 4 ;text: "交通环境" }
                            SliderBtn{
                                width: parent.width
                                height: 40
                                openBackground: true
                                isGradient: false
                                btnNames: ["城市","越野"]
                            }

                            MyTitle{ type: 4 ;text: "舒适停车" }

                            MySwitch { checked: true }

                            // 2
                            MyTitle{ id: title2; type: 2 ;text: "灯光氛围" }

                            MyTitle{ type: 4 ;text: "大灯高度调节" }
                            SliderBtn{
                                width: parent.width
                                height: 40
                                openBackground: true
                                isGradient: false
                                btnNames: ["1档","2档","3档","4档","5档","6档"]
                            }

                            MyTitle{ type: 4 ;text: "氛围灯" }
                            MySwitch { checked: true }

                            MyTitle{ type: 4 ;text: "氛围灯动态色彩" }
                            MySwitch { checked: false }


                            // 3
                            MyTitle{ id: title3; type: 2 ;text: "抬头显示" }

                            MyTitle{ type: 4 ;text: "高度调节" }
                            MySwitch { checked: false }

                            MyTitle{ type: 4 ;text: "高度调节" }
                            SliderBtn{
                                width: parent.width
                                height: 40
                                openBackground: true
                                isGradient: false
                                btnNames: ["1档","2档","3档"]
                            }
                            MyTitle{ type: 4 ;text: "亮度调节" }
                            SliderBtn{
                                width: parent.width
                                height: 40
                                openBackground: true
                                isGradient: false
                                btnNames: ["1档","2档","3档","4档"]
                            }

                            MyTitle{ type: 4 ;text: "旋转调节" }
                            SliderBtn{
                                width: parent.width
                                height: 40
                                openBackground: true
                                isGradient: false
                                btnNames: ["1档","2档","3档","4档"]
                            }


                            // 4
                            MyTitle{ id: title4; type: 2 ;text: "迎宾" }


                            // 5
                            MyTitle{ type: 2 ;text: "5" }
                        }


                    }
                }




            }
        }

        Rectangle{
            id: rightRight
            width: parent.width/2
            anchors.left: rightLeft.right
            anchors.top: rightTop.bottom
            anchors.bottom: parent.bottom
            color: "transparent"

            Column{
                anchors.fill: parent
                spacing: 40

                Rectangle{
                    width: parent.width
                    height: 50
                    color: "transparent"
                }

                Rectangle{
                    id: l1
                    width: childrenRect.width
                    anchors.right: parent.right
                    height: 40
                    color: "transparent"
                    Text{
                        id: txt1
                        anchors.top: parent.top
                        anchors.topMargin: 3
                        text: "已安全陪伴"
                        color: "gray"
                        font.pixelSize: 18
                    }
                    Text{
                        id: txt2
                        anchors.left: txt1.right
                        anchors.leftMargin: 5
                        text: mainPage.companyDay
                        color: "white"
                        font.pixelSize: 25
                    }
                    Text{
                        id: txt3
                        anchors.left: txt2.right
                        anchors.leftMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: 3
                        text: "天"
                        color: "gray"
                        font.pixelSize: 18
                    }
                }




                Rectangle{
                    id: l2
                    width: childrenRect.width
                    anchors.right: parent.right
                    height: 40
                    color: "transparent"
                    Image{
                        id: distanceIcon
                        width: 25
                        height: 25
                        anchors.verticalCenter: parent.verticalCenter
                        source: "pic/distance.png"
                    }
                    Text{
                        id: distanceTxt
                        anchors.left: distanceIcon.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 22
                        color: "white"
                        text: mainPage.mileage + " km"
                    }
                }
                Rectangle{
                    id: l3
                    width: childrenRect.width
                    anchors.right: parent.right
                    height: 40
                    color: "transparent"

                    Image{
                        id: electIcon
                        width: 35
                        height: 35
                        anchors.verticalCenter: parent.verticalCenter
                        source: "pic/elect" + mainPage.electricalNum + ".png"
                    }

                    Text{
                        anchors.left: electIcon.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        text: mainPage.electDistance + " km"
                        font.pixelSize: 22
                        color: "white"
                    }
                }

                // 背景图片
                Image {
                    id: bg
                    width: parent.width
                    height: 200
                    source: mainPage.carImg
                    fillMode: Image.PreserveAspectCrop
                }
            }
        }
    }
}
