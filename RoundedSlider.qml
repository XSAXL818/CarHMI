import QtQuick
import QtQuick.Controls

Slider {
    id: volumeSlider
    from: 0.0
    to: 1.0
    value: 0.5
    stepSize: 0.05
    live: true


    property string onSource
    property string closeSource
    property string text
    property bool isOpenImageRotate: false
    property bool isOpenMutResouce: false
    property string lowSource: ""
    property string medSource: ""
    property string highSource: ""

    onVisualPositionChanged: {
        setImgSource()
    }

    function setImgSource(){
        if( volumeSlider.isOpenMutResouce ){
            if( volumeSlider.value <= 0 ) {
                img.source = volumeSlider.closeSource
            } else if( volumeSlider.value <= 0.3 ) {
                img.source = volumeSlider.lowSource
            } else if( volumeSlider.value <= 0.7 ){
                img.source = volumeSlider.medSource
            } else {
                img.source = volumeSlider.highSource
            }
        } else {
            if( volumeSlider.v === 0.0 ) {
                img.source = closeSource
            } else {
                img.source = onSource
            }
        }
    }

    background: Rectangle {
        width: parent.width
        height: parent.height
        color: "#CF000000"
        radius: 10

        Rectangle {
            width: volumeSlider.visualPosition * parent.width
            height: parent.height
            color: "#EF3081f6"
            radius: 10
        }

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10

            Image {
                id: img
                source: volumeSlider.onSource
                width: 32
                height: 32

                // 定义旋转中心为图片中心
                transform: Rotation {
                    origin.x: img.width / 2
                    origin.y: img.height / 2
                    axis { x: 0; y: 0; z: 1 }  // Z轴旋转（平面旋转）
                    angle: volumeSlider.isOpenImageRotate ? volumeSlider.value * 360 : 0  // 外部值范围 0.0~1.0 → 0°~360°
                }

            }
            Text {
                id: txt
                text: volumeSlider.text
                color: "white"
                font.pixelSize: 24
            }
        }
    }
    handle: Rectangle {
        visible: false  // 完全隐藏
    }

    snapMode: Slider.SnapOnRelease  // 释放时对齐步长[6](@ref)
    touchDragThreshold: 0  // 立即响应触摸（无延迟）[6](@ref)
}
