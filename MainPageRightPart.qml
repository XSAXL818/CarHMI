import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick3D.Effects
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    height: parent.height
    color: "#602b2e3b"

    // 左边控制栏的宽度
    property double leftWidth

    // 状态信息
    property bool onBluetooth: false // 蓝牙
    property bool onWIFI: false // 无线网络
    property bool onTheme: false // 主题色,默认浅色
    property bool onLocationShare: false // 位置共享
    property bool onClockwise: false // 自动旋转
    property bool onQianLiYan: false // 千里眼
    property bool onHUD: false // 抬头显示HUD
    property bool onDS: false // 动态悬架
    property bool onWinHeat: false // 通风加热
    property bool onElecD: false // 电除霜
    property bool onSkylight: false // 天窗
    property bool onESP: false // ESP
    property real onMedia: 50 // 媒体音量
    property real onNavigation: 50 // 导航音量
    property real onCCS: 70 // 中控亮度
    property real onDashboard: 70 // 仪表亮度

    // 顶部状态栏
    Rectangle{
        id: rTop
        anchors.top: root.top
        width: root.width
        height: 40
        // color: "#992b2e3b"
        color: "transparent"

        ListView{
            model: 1
            anchors.left: rTop.left
            width: rTop.width/2
            height: rTop.height
            orientation: ListView.Horizontal

            delegate: Image {
                id: name
                height: 30
                width: 30
                source: "pic/notification.png"
            }
        }

        // 优化的话：可以一个抽屉，然后通过判断mouseX的位置，选择抽屉的组件进行显示....
        // 左侧抽屉（从顶部左半部分下拉）
        Drawer {
            x: root.leftWidth
            id: leftDrawer
            edge: Qt.TopEdge
            width: parent.width-root.leftWidth
            height: parent.height
            dragMargin: 40  // 触发区域高度
            interactive: false  // 禁用默认交互，通过手势控制
            dim: false // 关键：关闭遮罩层
            modal: false // 关键：允许与非抽屉区域交互
            background: Item {} // 清空默认背景

            // 左侧内容
            TopDrawerLeftCont{
                anchors.fill: parent
            }
        }

        // 右侧抽屉（从顶部右半部分下拉）
        Drawer {
            id: rightDrawer
            x: root.leftWidth
            edge: Qt.TopEdge
            width: parent.width - root.leftWidth
            height: parent.height
            dragMargin: 40
            interactive: false
            dim: false // 关键：关闭遮罩层
            modal: false // 关键：允许与非抽屉区域交互
            background: Item {} // 清空默认背景

            // 右侧内容
            TopDrawerRightCont{
                anchors.fill: parent
            }
        }

        // 手势控制逻辑
        MouseArea {
            anchors.fill: parent
            property real startY: 0
            property real startX: 0

            onPressed: {startY = mouseY;startX = mouseX}

            onPositionChanged: {
                // 判断是否为顶部下拉手势
                if (mouseY - startY > 50 && mouseY < 100) {
                    if (mouseX < width / 2) {
                        // 左侧下拉：打开左抽屉
                        leftDrawer.open()
                    } else {
                        // 右侧下拉：打开右抽屉
                        rightDrawer.open()
                    }
                }
            }
        }
    }
    // 中间主页面
    Loader{
        id: rCenter
        anchors.top: rTop.bottom
        // anchors.topMargin: 10
        height: parent.height-rTop.height-rBottom.height-60
        width: root.width-70
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.right: parent.right
        anchors.rightMargin: 20

        source: "Home.qml"
    }
    // 底部控件
    Rectangle{
        id: rBottom
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right
        anchors.rightMargin: 30
        anchors.leftMargin: 50
        anchors.bottomMargin: 20
        height: 120
        color: "transparent"

        ControlsBelow{
            id: controlsBelow
            anchors.fill: parent

            onLeftTemperatureChanged: (temp) => {
                console.log("温度(左)调节为："+temp)
            }

            onRightTemperatureChanged: (temp) => {
                console.log("温度(右)调节为："+temp)
            }

            onCarBtnClick: {
                console.log("bottom-car")
            }

            onNavigationBtnClick: {
                console.log("bottom-navigation")
            }

            onFanBtnClick: {
                console.log("bottom-fan")
            }

            onAirBtnClick: {
                rCenter.source = "PageAirConditioner.qml"
            }

            onDefogBtnClick: {
                console.log("bottom-defog")
            }

            onMusicBtnClick: {
                console.log("bottom-music")
            }

            onBookBtnClick: {
                console.log("bottom-book")
            }

        }
    }
}
