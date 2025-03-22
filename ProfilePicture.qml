import QtQuick

// 头像按钮
Canvas{
    id: canvas
    // 组件长宽
    // property alias cWidth: canvas.width
    // property alias cHeight: canvas.height
    property int size
    // 图片资源
    property string source
    // 被点击
    signal click

    width: canvas.size
    height: canvas.size


    MouseArea{
        anchors.fill: parent
        onClicked: {
            canvas.click()
        }
    }

    onPaint: {
        var ctx = getContext("2d")

        ctx.strokeStyle="gray"
        ctx.beginPath()
        // ctx.arc(canvas.width/2,canvas.height/2,canvas.width/2,0,Math.PI*2)
        ctx.arc(canvas.width/2,canvas.width/2,canvas.width/2,0,Math.PI*2)
        ctx.closePath()
        ctx.stroke()
        ctx.clip()
        // ctx.drawImage(canvas.source,0,0,canvas.width,canvas.height)
        ctx.drawImage(canvas.source,0,0,canvas.width,canvas.width)

    }

    Component.onCompleted: {
        loadImage(canvas.source)
    }
}
