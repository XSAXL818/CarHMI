import QtQuick
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    property real size
    property alias iconSource: icon.source
    width: size
    height: size


    layer.enabled: true  // 启用独立渲染层
    layer.effect: OpacityMask {  // 直接附加蒙版
        maskSource: Rectangle {
            width: root.width
            height: root.height
            radius: 5
        }
    }
    Image {
        id: icon
        anchors.fill: parent
        source: ""
        fillMode: Image.PreserveAspectCrop
    }

}
