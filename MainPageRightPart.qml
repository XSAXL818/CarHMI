import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick3D.Effects
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root
    height: parent.height
    color: "#602b2e3b"

    property bool isShowBackground: false
    property string backgroundImgSource: ""


    Rectangle{
        id: background
        anchors.fill: parent
        visible: root.isShowBackground

        Image {
            anchors.fill: parent
            source: root.backgroundImgSource
            fillMode: Image.PreserveAspectCrop
        }
    }

    // 应用高斯模糊到捕获的背景
    layer.enabled: leftDrawer.opened || rightDrawer.opened ? true : false
    layer.effect: GaussianBlur {
        radius: 16
        samples: 32
        transparentBorder: true  // 避免边缘锐化
    }

    // 左边控制栏的宽度
    property double leftWidth

    // 顶部状态栏
    Rectangle{
        id: rTop
        anchors.top: root.top
        width: root.width
        height: 40
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
                id: rightCont
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
        height: parent.height-rTop.height-rBottom.height-60
        width: root.width-70
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.right: parent.right
        anchors.rightMargin: 20

        source: mainPage.pageSource

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
        height: 140
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
                // root.enterFullScreen(true)
                root.enterPageMusic(true)
                mainPage.pageSource = "PageNav.qml"
            }

            onFanBtnClick: {
                console.log("bottom-fan")
            }

            onAirBtnClick: {
                mainPage.pageSource = "PageAirConditioner.qml"
            }

            onDefogBtnClick: {
                console.log("bottom-defog")
            }

            onMusicBtnClick: {
                console.log("bottom-music")

                root.enterPageMusic(true)
                mainPage.pageSource = "PageMusic.qml"
            }

            onBookBtnClick: {
                console.log("bottom-book")
            }

        }
    }

    // 检查顶部状态栏是否开启
    function isDrawerOpened(){
        if( leftDrawer.opened || rightDrawer.opened ){
            return true
        }
        return false
    }

    // 关闭顶部状态栏
    function closeDrawer(){
        leftDrawer.close()
        rightDrawer.close()
    }

    function enterFullScreen(enter){
        if( enter ){
            rBottom.visible = false
            rCenter.height += rBottom.height - 50
        } else {
            rBottom.visible = true
            rCenter.height -= rBottom.height - 50
        }
    }

    function enterPageMusic(enter){
        if( enter ){
            rBottom.visible = false
            // rCenter.height += 180
            // rCenter.anchors.fill = rCenter.parent
            rCenter.anchors.leftMargin = 0
            rCenter.anchors.rightMargin = 0
            rCenter.anchors.bottom = rCenter.parent.bottom
            // rCenter.width += 100
            root.isShowBackground = true
            root.backgroundImgSource = "pic/musicBackground.png"
        } else {
            rBottom.visible = true
            // rCenter.height = parent.height-rTop.height-rBottom.height-60
            rCenter.width = root.width-70
            rCenter.anchors.leftMargin = 50
            rCenter.anchors.rightMargin = 20
            rCenter.anchors.bottom = rBottom.top
            // rCenter.anchors.bottomMargin = 200

            root.isShowBackground = false
        }
    }

    property bool isFirst: true


    function clickNavBackHome(){
        mainPage.defaultMapUrl = mainPage.navToUrl
        controlsBelow.navigationBtnClick()
        mainPage.defaultMapUrl = "https://amap.com/"
    }

    Component.onCompleted: {
        // enterFullScreen(false)
    }
}
