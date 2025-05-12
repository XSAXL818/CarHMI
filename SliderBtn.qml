import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    // width: 400
    // height: 60
    color: "#2d364c"
    radius: openBackground ? isHorizontal ? height/2 : width/2 : 0

    property int currentIndex: 0
    signal btnSelected(int index)
    property bool isHorizontal: true
    property bool openBackground: false
    property int fontSize: 24
    property var btnNames: ["按钮1","按钮2","按钮3","按钮4"]

    property double needToMinusSize: 0
    property double perBtnHeight: height/btnNames.length - needToMinusSize
    property double perBtnWidth: width/btnNames.length - needToMinusSize
    property bool isGradient: true



    // 主布局容器
    Loader {
        id: layoutLoader
        anchors.fill: parent
        sourceComponent: isHorizontal ? rowComponent : columnComponent
    }


    // 按钮容器
    Component{
        id: rowComponent
        Row {
            anchors.fill: parent
            // spacing: 10

            Repeater {
                model: btnNames.length

                Button {
                    width: root.perBtnWidth
                    height: parent.height

                    background: Rectangle {
                        color: "transparent"

                        // 文字样式
                        Text {
                            z: mySlider.z+1
                            text: root.btnNames[index]
                            anchors.centerIn: parent
                            color: "white"

                            font.pixelSize: root.fontSize
                        }
                    }

                    // 点击切换当前选中索引
                    onClicked: {
                        root.currentIndex = index
                        root.btnSelected(index)
                    }
                }
            }
        }
    }

    Component{
        id: columnComponent
        Column {
            anchors.fill: parent
            // spacing: 10
            Repeater {
                model: btnNames.length

                Button {
                    width: parent.width
                    height: root.perBtnHeight

                    background: Rectangle {
                        color: "transparent"

                        // 文字样式
                        Text {
                            z: mySlider.z+1
                            text: root.btnNames[index]
                            anchors.centerIn: parent
                            color: "white"

                            font.pixelSize: root.fontSize
                        }
                    }

                    // 点击切换当前选中索引
                    onClicked: {
                        root.currentIndex = index
                        root.btnSelected(index)
                    }
                }
            }
        }
    }



    // 滑动指示条
    Rectangle {
        id: mySlider
        width: isHorizontal ? root.perBtnWidth : parent.width
        height: !isHorizontal ? root.perBtnHeight : parent.height
        z: 0

        radius: isHorizontal ? height/2 : width/2
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{
                position: 0.0
                color: root.isGradient ? "#9037e5f8" : "#903cbee5"
            }
            GradientStop{
                position: 0.5
                color: root.isGradient ? "#900f7ce0" : "#903cbee5"
            }
        }

        // 动态计算x位置
        x: isHorizontal ? root.currentIndex * width : x
        // 动态计算y位置
        y: !isHorizontal ? root.currentIndex * height : y

        // 平滑动画
        Behavior on x {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }
        Behavior on y {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }
    }
}
