import QtQuick
import QtQuick.Controls

Switch {
    id: root
    checked: true

    // 自定义开关轨道（背景）
    indicator: Rectangle {
        implicitWidth: 48
        implicitHeight: 26
        x: root.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        color: root.checked ? "#3b7cc5" : "lightgray"
        border.color: root.checked ? "#3b7cc5" : "gray"

        // 开关滑块
        Rectangle {
            x: root.checked ? parent.width - width : 0
            width: 26
            height: 26
            radius: 13
            color: "white"
            border.color: "#999999"
            Behavior on x { NumberAnimation { duration: 100 } }
        }
    }
}
