import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick3D.Effects
import Qt5Compat.GraphicalEffects

Window {
    width: 1280
    // height: 1024
    height: (width / 16) * 10
    visible: true
    title: qsTr("Hello World")
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.WindowTitleHint

    Rectangle {
        id: root
        anchors.fill: parent
        // color: "#2b2e3b"
        // 左侧按钮的高
        property int leftHeight: height/8
        // 左侧按钮的图标长宽
        property int iconSize: 30
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

        
        // 左侧按钮
        Rectangle {
            id: left
            width: 100
            height: root.height
            color: "black"

            Column{
                anchors.fill: parent
                anchors.topMargin: 20
                spacing: 30

                ProfilePicture{
                    id: profile
                    size: left.width-30
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "pic/power.jpg"
                    onClick: {
                        console.log("头像被点击")
                    }

                }

                IconButton{
                    id: backBtn
                    width: parent.width
                    height: root.leftHeight
                    source: "pic/back.png"
                    size: root.iconSize
                    onClicked: {
                        rCenter.source = "Page1.qml"

                        if( leftDrawer.opened | rightDrawer.opened ){
                            leftDrawer.close()
                            rightDrawer.close()
                        }
                    }
                }
                IconButton{
                    id: homeBtn
                    width: parent.width
                    height: root.leftHeight
                    size: root.iconSize
                    source: "pic/Home.png"

                    onClicked: {
                        rCenter.source = "Home.qml"
                    }
                }

                IconButton{
                    id: menuBtn
                    width: parent.width
                    height: root.leftHeight
                    source: "pic/Menu.png"
                    size: root.iconSize
                    onClicked: {
                        console.log("菜单")
                    }
                }
                IconButton{
                    id: closeWiseBtn
                    width: parent.width
                    height: root.leftHeight
                    size: root.iconSize
                    source: "pic/clockwise.png"

                    onClicked: {
                        console.log("旋转")
                    }
                }

                IconButton{
                    id: closeBtn
                    width: parent.width
                    height: root.leftHeight
                    source: "pic/close.png"
                    size: root.iconSize
                    onClicked: {
                        Qt.quit()

                    }
                }

            }
        }
        // 右侧界面
        Rectangle {
            id: right
            anchors.left: left.right
            anchors.right: root.right
            anchors.top: root.top
            height: root.height
            color: "#992b2e3b"

            // 顶部状态栏
            Rectangle{
                id: rTop
                anchors.top: right.top
                width: right.width
                height: 40
                color: "gray"

                ListView{
                    model: 1
                    anchors.left: rTop.left
                    anchors.top: rTop.top
                    width: rTop.width/2
                    orientation: ListView.Horizontal

                    delegate: Image {
                        id: name
                        height: 30
                        width: 30
                        source: "pic/back.png"
                    }
                }

                // 优化的话：可以一个抽屉，然后通过判断mouseX的位置，选择抽屉的组件进行显示....
                // 左侧抽屉（从顶部左半部分下拉）
                Drawer {
                    x: left.width
                    id: leftDrawer
                    edge: Qt.TopEdge
                    width: parent.width-left.width
                    height: root.height
                    dragMargin: 40  // 触发区域高度
                    interactive: false  // 禁用默认交互，通过手势控制
                    dim: false // 关键：关闭遮罩层
                    modal: false // 关键：允许与非抽屉区域交互
                    background: Item {} // 清空默认背景

                    // 左侧内容
                    Rectangle {
                        anchors.fill: parent
                        color: "#99000000"
                        Text {
                            anchors.centerIn: parent
                            text: "左侧页面"
                            font.pixelSize: 24
                        }

                        MouseArea {
                            anchors.fill: parent
                            property real startY: 0
                            property real startX: 0

                            onPressed: {startY = mouseY;startX = mouseX}
                            onPositionChanged: {
                                // 判断是否为底部上拉手势
                                if (startY-mouseY  > 150 && startY > root.height-200) {
                                    leftDrawer.close()
                                } // 判断是否为切换到右抽屉
                                else if( startX - mouseX > 150 && Math.abs(startY-mouseY) < 100 ){
                                    leftDrawer.close()
                                    rightDrawer.open()
                                }
                            }
                        }
                    }
                }

                // 右侧抽屉（从顶部右半部分下拉）
                Drawer {
                    id: rightDrawer
                    x: left.width
                    edge: Qt.TopEdge
                    width: parent.width-left.width
                    height: root.height
                    dragMargin: 40
                    interactive: false
                    dim: false // 关键：关闭遮罩层
                    modal: false // 关键：允许与非抽屉区域交互
                    background: Item {} // 清空默认背景

                    // 右侧内容
                    Rectangle {
                        anchors.fill: parent
                        color: "#99000000"
                        Text {
                            anchors.centerIn: parent
                            text: "右侧页面"
                            font.pixelSize: 24
                        }
                        MouseArea {
                            anchors.fill: parent
                            property real startY: 0
                            property real startX: 0

                            onPressed: {startY = mouseY;startX = mouseX}
                            onPositionChanged: {
                                // 判断是否为底部上拉手势
                                if (startY-mouseY  > 150 && startY > root.height-200) {
                                    rightDrawer.close()
                                } // 判断是否为切换到右抽屉
                                else if( mouseX - startX > 150 && Math.abs(startY-mouseY) < 100 ){
                                    rightDrawer.close()
                                    leftDrawer.open()
                                }

                            }
                        }
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
                anchors.topMargin: 20
                height: root.height-rTop.height-rBottom.height-60
                width: right.width-70
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.right: parent.right
                anchors.rightMargin: 20

                source: "Home.qml"
            }
            // 底部控件
            Rectangle{
                id: rBottom
                anchors.bottom: right.bottom
                anchors.left: right.left
                anchors.right: right.right
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
    }
}
