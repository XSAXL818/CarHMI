import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick3D.Effects
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    // anchors.fill: parent
    // color: "#2b2e3b"
    // 左侧按钮的高
    property int leftBtnHeight: height/8
    // 左侧按钮的图标长宽
    property int leftIconSize: 30


    gradient: Gradient{
        GradientStop{
            position: 0.0
            color: "#3f4658"
        }
        GradientStop{
            position: 0.5
            color: "#1a1f2a"
        }
    }

    // 左侧控制栏
    MainPageLeftPart{
        id: left
        btnHeight: leftBtnHeight
        iconSize: root.leftIconSize
    }

    // 右侧界面
    MainPageRightPart{
        id: right
        anchors.left: left.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 10
        // 用于抽屉的x起始位置
        leftWidth: left.width
    }

}
