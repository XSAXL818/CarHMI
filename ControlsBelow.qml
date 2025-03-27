import QtQuick
import QtQuick.Shapes
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle{
    id: root
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
            strokeColor: "darkslategray"
            fillColor: "#232a3c"
            // fillColor: "dimgray"

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

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true  // 透明边缘处理
                color: "#80ffffff"       // 阴影颜色（带透明度）
                radius: 10
                samples: 21              // 采样数（建议值为 radius*2+1）
                // horizontalOffset: 4      // 水平偏移
                verticalOffset: -4        // 垂直偏移
            }

            gradient: Gradient{
                GradientStop{
                    position: 0.0
                    color: "#2a354a"
                }
                GradientStop{
                    position: 0.5
                    color: "#232a3c"
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
