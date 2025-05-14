import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Launcher

// 应用页面
Rectangle {

    anchors.fill: parent
    color: "transparent"

    Timer{
        id: timer
        interval: 2000

        onTriggered: {
            warningDialog.visible = false
        }
    }

    RowLayout {
        id: row1
        height: 160
        width: parent.width
        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/brower.png"
            appName: "浏览器"
            iconSize: 90

            onClicked: {
                warningDialog.visible = true
                timer.start()
            }
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/Caltulator.png"
            appName: "Caltulator"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/facebook-messenger.png"
            appName: "Facebook"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/phone.png"
            appName: "电话"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/Settings.png"
            appName: "设置"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/shopee.png"
            appName: "shopee"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/spotify.png"
            appName: "spotify"
            iconSize: 90
        }

    }

    RowLayout {
        id: row2
        height: 160
        width: parent.width
        anchors.top: row1.bottom
        anchors.left: parent.left
        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/themes.png"
            appName: "主题"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/tiktok.png"
            appName: "tiktok"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/videos.png"
            appName: "天气"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/ximalaya.png"
            appName: "喜马拉雅"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/videos.png"
            appName: "视频"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/chatAss.png"
            appName: "chatAss"
            iconSize: 90
        }

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/gallery.png"
            appName: "图片"
            iconSize: 90
        }

    }


    RowLayout {
        height: 160
        width: parent.width
        anchors.top: row2.bottom
        anchors.left: parent.left

        AppBtn{
            // id:
            height: 150
            width: 130
            appIcon: "pic/game.png"
            appName: "我的游戏"
            iconSize: 90

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    launcher.startExe("D:/Code/MyGame/Windows/Ch2.exe")
                }
            }
        }

    }

    Rectangle{
        id: warningDialog
        width: 500
        height: 300
        radius: 50
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 300
        anchors.leftMargin: 300
        visible: false
        color: "#ACd5dfe4"

        Column{
            anchors.fill: parent


            Rectangle{
                width: parent.width
                height: parent.height/2
                color: "transparent"
                Image {
                    anchors.centerIn: parent
                    width: 100
                    height: 100
                    source: "pic/warning.png"
                }
            }



            Text{
                width: parent.width
                height: parent.height/2
                text:"驾驶员驾驶时禁止使用该功能！"
                font.pixelSize: 32
                horizontalAlignment: Text.AlignHCenter
            }
        }



    }

    ProcessLauncher {
        id: launcher
    }
}
