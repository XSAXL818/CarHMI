import QtQuick
import QtQuick.Shapes

Rectangle{
    id: root
    // width: 700
    // height: 130
    color: "transparent"

    property int lrmargin: 70
    property real perWidth: (width-lrmargin*2)/9

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
        anchors.centerIn: parent

        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }

        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }

        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }

        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }
        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }
        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }
        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }
        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }
        LeftButton{
            width: root.perWidth
            height: 100
            size: 50
            source: "pic/back.png"
        }

    }



}
