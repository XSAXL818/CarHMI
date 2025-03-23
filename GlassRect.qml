// GlassRect.qml
import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    // -------------------- 可配置属性 --------------------
    property alias radius: blurRect.radius    // 圆角半径
    property alias border: blurRect.border    // 边框
    property real blurRadius: 16             // 模糊强度（默认值）
    property color overlayColor: "#60ffffff"  // 叠加颜色（ARGB格式）

    // 必须设置：需要模糊的底层 Item（如背景图/背景容器）
    property Item sourceItem: null

    // -------------------- 模糊核心逻辑 --------------------
    Rectangle {
        id: blurRect
        anchors.fill: parent
        color: "transparent"  // 背景透明，由模糊层提供内容

        // 截取源内容的对应区域
        ShaderEffectSource {
            id: effectSource
            sourceItem: root.sourceItem
            sourceRect: Qt.rect(blurRect.x, blurRect.y, blurRect.width, blurRect.height)
            visible: false
            live: true  // 实时更新背景变化
        }

        // 高斯模糊层
        GaussianBlur {
            anchors.fill: parent
            source: effectSource
            radius: root.blurRadius
            samples: radius * 2
        }

        // 颜色叠加层（模拟毛玻璃材质）
        Rectangle {
            anchors.fill: parent
            color: root.overlayColor
            radius: blurRect.radius
        }
    }
}
