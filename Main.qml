import QtQuick
import QtQuick.Controls

Window {
    width: 1280
    // height: 1024
    height: (width / 16) * 10
    visible: true
    title: qsTr("Hello World")
    

    Rectangle {
        id: root
        anchors.fill: parent
        color: "red"

        // 左侧按钮的高
        property int leftHeight: height/8
        // 左侧按钮的图标长宽
        property int iconSize: 40


        
        Rectangle {
            id: left
            width: 100
            height: root.height
            color: "black"

            Column{
                anchors.fill: parent
                anchors.topMargin: 5
                spacing: 10


                ProfilePicture{
                    size: left.width-10

                    anchors.margins: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "pic/power.jpg"

                    onClick: {
                        console.log("头像被点击")
                    }

                }


                // Canvas{
                //     id: canvas
                //     width: parent.width
                //     height: root.leftHeight

                //     // Image{
                //     //     z: parent.z-1
                //     //     anchors.fill: parent
                //     //     source: "pic/power.jpg"
                //     // }

                //     onPaint: {
                //         var ctx = getContext("2d")

                //         ctx.fillStyle="red"

                //         ctx.strokeStyle="red"
                //         ctx.beginPath()
                //         // ctx.moveTo(80,80)
                //         ctx.arc(canvas.width/2,canvas.height/2,50,0,Math.PI*2)
                //         ctx.closePath()
                //         ctx.stroke()
                //         ctx.clip()

                //         ctx.drawImage("pic/power.jpg",0,0,canvas.width,canvas.height)
                //         // ctx.fill()
                //     }

                //     Component.onCompleted: {
                //         loadImage("pic/power.jpg")
                //     }
                // }




                // Button{
                //     width: parent.width
                //     height: root.leftHeight



                //     IconImage {
                //         source: "pic/power.jpg"
                //         size: root.iconSize+38

                //     }

                //     background: Rectangle {
                //         radius: width / 2  // 半径设为宽高的一半
                //         // color: parent.down ? "#cccccc" : "#ffffff"  // 点击状态颜色
                //         // border.color: "#999999"
                //         border.width: 1
                //     }



                //     onClicked: {
                //         rCenter.source = "Home.qml"
                //     }
                // }

                Button{
                    text: "btn2"
                    width: parent.width
                    height: root.leftHeight

                    IconImage {
                        source: "pic/Loong1.png"
                        size: root.iconSize
                    }

                    onClicked: {
                        rCenter.source = "Page1.qml"
                    }
                }
                Button{
                    text: "btn3"
                    width: parent.width
                    height: root.leftHeight

                    IconImage {
                        source: "pic/Loong1.png"
                        size: root.iconSize
                    }

                    onClicked: {
                        rCenter.source = "Home.qml"
                    }
                }

                Button{
                    text: "btn4"
                    width: parent.width
                    height: root.leftHeight

                    IconImage {
                        source: "pic/Loong1.png"
                        size: root.iconSize
                    }

                    onClicked: {
                        rCenter.source = "Page1.qml"
                    }
                }
                Button{
                    text: "btn5"
                    width: parent.width
                    height: root.leftHeight

                    IconImage {
                        source: "pic/Loong1.png"
                        size: root.iconSize
                    }

                    onClicked: {
                        rCenter.source = "Home.qml"
                    }
                }

                Button{
                    text: "btn6"
                    width: parent.width
                    height: root.leftHeight

                    IconImage {
                        source: "pic/Loong1.png"
                        size: root.iconSize
                    }

                    onClicked: {
                        rCenter.source = "Page1.qml"
                    }
                }
                Button{
                    text: "btn7"
                    width: parent.width
                    height: root.leftHeight

                    IconImage {
                        source: "pic/Loong1.png"
                        size: root.iconSize
                    }

                    onClicked: {
                        rCenter.source = "Home.qml"
                    }
                }


            }


        }
        Rectangle {
            id: right
            anchors.left: left.right
            anchors.right: root.right
            anchors.top: root.top
            height: root.height
            color: "orange"


            Rectangle{
                id: rTop
                anchors.top: right.top
                width: right.width
                height: 50
                color: "gray"

            }

            Loader{
                id: rCenter
                anchors.top: rTop.bottom
                height: right.height-rTop.height
                width: right.width
                // color: "lightgray"

                source: "Home.qml"


                

            }

            Rectangle{
                id: rBottom
                anchors.bottom: right.bottom
                anchors.left: right.left
                anchors.right: right.right
                anchors.margins: 50
                height: 100
                color: "black"

            }

        }




    }
}
