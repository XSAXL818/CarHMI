import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

// 温度控制器
Rectangle {
    id: root
    width: 180
    height: 130
    color: "transparent"
    // 属性定义
    property int temperatureValue: 22
    property int maxTemp: 30
    property int minTemp: 16
    property color textColor: "white"
    property color activeColor: "white"
    property color negativeColor: "lightgray"
    // 记录前一个温度值
    property int previousTemp: temperatureValue

    signal temperatureChanged(int temp)

    Column {
        anchors.fill: parent
        // 升温按钮
        Button {
            width: parent.width
            height: 35
            text: "^"
            font.pixelSize: 30
            background: Item{}
            Material.foreground: root.temperatureValue < root.maxTemp ? root.activeColor : root.negativeColor

            onClicked: {
                root.previousTemp = root.temperatureValue
                root.temperatureValue = Math.min(root.maxTemp, root.temperatureValue + 1)
            }

            scale: pressed ? 0.7 : 1.0
            Behavior on scale { NumberAnimation { duration: 100 } }
        }
        // 温度显示（带变化动画）
        Text {
            id: tempText
            width: parent.width
            height: 60
            text: root.temperatureValue + "°"
            color: root.textColor
            horizontalAlignment: Text.Center
            font {pixelSize: 40;bold: true}

            onTextChanged: {
                // 每次变化时会覆盖上一次的timer
                timer.start()
            }
        }

        Timer{
            id: timer
            interval: 1000
            running: false
            // 结束后发送
            onTriggered: {
                root.temperatureChanged(temperatureValue)
            }
        }

        // 减温按钮
        Button {
            width: parent.width
            height: 35
            text: ">"
            font.pixelSize: 30
            background: Item{}
            rotation: 90
            Material.foreground: root.temperatureValue > root.minTemp ? root.activeColor : root.negativeColor
            onClicked: {
                root.previousTemp = root.temperatureValue
                root.temperatureValue = Math.max(root.minTemp, root.temperatureValue - 1)
            }

            scale: pressed ? 0.7 : 1.0
            Behavior on scale { NumberAnimation { duration: 100 } }
        }

    }
}
