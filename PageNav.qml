import QtQuick 2.15
import QtWebEngine
import QtWebChannel




Rectangle{
    id: root
    color: "transparent"
    anchors.fill: parent


    property string defaultUrl: mainPage.defaultMapUrl
    // property string defaultUrl:"https://game.163.com/?author_urs=liuhuanghun@163.com&lid=2&pid=1"

    WebEngineView {
        id: webView
        // anchors.fill: parent
        width: parent.width
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        url: root.defaultUrl

        // 添加这些属性配置
        settings {
            accelerated2dCanvasEnabled: true
            autoLoadImages: true
            javascriptEnabled: true
            errorPageEnabled: false
            pluginsEnabled: true
        }
        // 启用分层加速合成
        layer.enabled: true
        layer.textureSize: Qt.size(1960, 1400)

        webChannel.registeredObjects: []

        WebEngineProfile {
            cachePath: "WebCache"
            httpCacheType: WebEngineProfile.DiskHttpCache
            persistentStoragePath: "PersistentData"
        }
    }

    Rectangle{
        width: 300
        height: 100
        x: 200
        y: webView.height
        color:"transparent"
        radius: width/2

        Row{
            spacing: 40
            anchors.fill: parent
            Rectangle{
                width: 150
                height: 75
                radius: 75
                color:"#DD52afd5"

                Text {
                    text: "回家"
                    font.pixelSize: 24
                    anchors.centerIn: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log(root.defaultUrl === mainPage.navToUrl)
                        webView.url = mainPage.navToUrl
                    }
                }
            }
            Rectangle{
                width: 150
                height: 75
                radius: 75
                color:"#DD52afd5"

                Text {
                    text: "回公司"
                    font.pixelSize: 24
                    anchors.centerIn: parent
                }
            }
        }

    }

    Component.onCompleted: {
        console.log(root.defaultUrl)
    }

    Component.onDestruction: {
        mainPageRightPart.enterPageMusic(false)
        // mainPageRightPart.enterFullScreen(false)
    }
}

