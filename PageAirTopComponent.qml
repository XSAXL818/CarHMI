import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    // width: 400
    // height: 60//////////////
    color: "#2d364c"
    radius: height/2

    property int currentIndex: 0
    signal airBtn
    signal heatBtn
    signal mudBtn
    signal settingBtn

    property var btnNames: ["空调","通风加热","滤镜","空调设置"]
    // 按钮容器
    Row {
        anchors.fill: parent
        spacing: 10

        Repeater {
            model: 4

            Button {
                width: parent.width / 4 -10
                height: parent.height

                background: Rectangle {
                    color: "transparent"

                    // 文字样式
                    Text {
                        z: slider.z+1
                        text: root.btnNames[index]
                        anchors.centerIn: parent
                        color: root.currentIndex === index ? "lightblue" : /*"#666"*/ "white"

                        font.pixelSize: 16
                    }
                }

                // 点击切换当前选中索引
                onClicked: {
                    root.currentIndex = index
                    switch( index ){
                    case 1:
                        root.airBtn()
                        break
                    case 2:
                        root.heatBtn()
                        break
                    case 3:
                        root.mudBtn()
                        break
                    case 4:
                        root.settingBtn()
                        break
                    }
                }
            }
        }
    }

    // 滑动指示条
    Rectangle {
        id: slider
        width: parent.width / 4
        height: parent.height

        y: parent.height - height
        radius: height/2
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{
                position: 0.0
                color: "#9037e5f8"
            }
            GradientStop{
                position: 0.5
                color: "#900f7ce0"
            }
        }

        // 动态计算x位置
        x: root.currentIndex * width

        // 平滑动画
        Behavior on x {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }
    }
}
