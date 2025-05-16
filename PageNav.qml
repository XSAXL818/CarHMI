import QtQuick 2.15
import QtWebEngine
import QtWebChannel




Rectangle{
    id: root
    color: "transparent"
    anchors.fill: parent


    property string currentMapUrl: mainPage.defaultMapUrl

    WebEngineView {
        id: webView
        // anchors.fill: parent
        width: parent.width
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        url: root.currentMapUrl

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
                        root.currentMapUrl = mainPage.homeUrl
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        root.currentMapUrl = mainPage.workUrl
                    }
                }
            }
            Rectangle{
                width: 150
                height: 75
                radius: 75
                color:"#DD52afd5"

                Text {
                    text: "充电站"
                    font.pixelSize: 24
                    anchors.centerIn: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        root.currentMapUrl = mainPage.chargeUrl
                    }
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

