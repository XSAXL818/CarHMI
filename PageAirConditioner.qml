import QtQuick

Rectangle {
    id: root
    anchors.fill: parent

    Image {
        // anchors.fill: parent
        width: parent.width
        height: parent.height
        source: "pic/bg_air.png"
        fillMode: Image.PreserveAspectCrop
    }

    PageAirTopComponent{
        anchors.top: parent.top
        width: parent.width-100
        height: 60
        anchors.horizontalCenter: parent.horizontalCenter

        onAirBtn: {
            console.log("空调设置界面："+"点击空调")
        }

        onHeatBtn: {
            console.log("空调设置界面："+"点击通风加热")
        }

        onMudBtn: {
            console.log("空调设置界面："+"点击滤镜")
        }

        onSettingBtn: {
            console.log("空调设置界面："+"点击空调设置")
        }
    }



}
