import QtQuick
import QtQuick.Shapes
import QtQuick.Controls

Rectangle{
    id: root
    // width: 700
    // height: 130
    color: "transparent"

    property int lrmargin: 70
    property real perWidth: (width-lrmargin*2)/9

    signal leftTemperatureChanged( int temp )
    signal rightTemperatureChanged( int temp )
    signal carBtnClick
    signal navigationBtnClick
    signal fanBtnClick
    signal airBtnClick
    signal defogBtnClick
    signal musicBtnClick
    signal bookBtnClick

    Shape{
        anchors.fill: parent
        ShapePath{
            strokeColor: "#232a3c"
            fillColor: "#232a3c"
            strokeWidth: 1

            startX: root.lrmargin
            startY: 0

            PathQuad{
                x: 0
                y: root.height
            }

            PathLine{
                x: root.width
                y: root.height
            }

            PathQuad{
                x: root.width-root.lrmargin
                y: 0
                controlX: root.width
                controlY: 0
            }

            PathLine{
                x: root.lrmargin
                y: 0
            }

        }

        Rectangle{
            anchors.centerIn: parent
            width: root.perWidth*5
            height: root.height
            radius: 10

            gradient: Gradient{
                GradientStop{
                    position: 0.0
                    color: "#6c7eac"
                }
                GradientStop{
                    position: 0.3
                    color: "#374362"
                }
                GradientStop{
                    position: 0.7
                    color: "#2e3851"
                }

            }
        }

    }

    Row{
        width: root.perWidth*9
        anchors.horizontalCenter: parent.horizontalCenter

        IconButton{
            id: carBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/car.png"

            onClick: {
                root.carBtnClick()
            }
        }
        IconButton{
            id: navigationBtn
            width: root.perWidth
            height: root.height
            size: 40
            source: "pic/navigation.png"

            onClick: {
                root.navigationBtnClick()
            }
        }


        IconButton{
            id: fanBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/fan.png"
            onClick: {
                root.fanBtnClick()
            }
        }


        // 进阶版
        TemperatureControl {
            id: leftTempControl
            width: root.perWidth
            height: root.height
            onTemperatureChanged: (temp) =>{
                root.leftTemperatureChanged(temp)
            }
        }
        IconButton{
            id: airBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/air.png"

            onClick: {
                root.airBtnClick()
            }
        }
        TemperatureControl{
            id: rightTempControl
            width: root.perWidth
            height: root.height
            onTemperatureChanged: (temp) =>{
                root.rightTemperatureChanged(temp)
            }
        }

        IconButton{
            id: defogBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/defog.png"

            onClick: {
                root.defogBtnClick()
            }
        }

        IconButton{
            id: musicBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/music.png"

            onClick: {
                root.musicBtnClick()
            }
        }
        IconButton{
            id: bookBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/book.png"

            onClick: {
                root.bookBtnClick()
            }
        }
    }
}
