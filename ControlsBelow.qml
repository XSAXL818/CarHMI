import QtQuick
import QtQuick.Shapes
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

Rectangle{
    id: root
    color: "transparent"

    property int lrmargin: 70
    property real perWidth: (width-lrmargin*2)/9

    signal leftTemperatureChanged( int temp )
    signal rightTemperatureChanged( int temp )
    signal carBtnClick
    signal navigationBtnClick
    signal fanBtnClick
    signal airBtnClick
    signal defogBtnClick
    signal musicBtnClick
    signal bookBtnClick

    Canvas {
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()

            // 清除画布
            ctx.clearRect(0, 0, width, height)

            // 设置样式
            // 1. 创建线性渐变对象
            // 参数：(x0, y0)为起点坐标，(x1, y1)为终点坐标
            const gradient = ctx.createLinearGradient(0, 0, width, height)

            // 2. 添加色标（颜色节点）
            gradient.addColorStop(0, "#2a354a")      // 起点颜色
            gradient.addColorStop(0.5, "#232a3c")   // 中间颜色
            gradient.addColorStop(1, "#2a354a")       // 终点颜色

            // 3. 设置填充样式为渐变
            ctx.fillStyle = gradient
            // ctx.fillStyle = "#232a3c"
            ctx.strokeStyle = "darkslategray"
            ctx.lineWidth = 2

            // 定义梯形参数
            const topWidth = width-80
            const bottomWidth = width
            const radius = 10
            const heightOffset = height - 2 * radius

            // 开始绘制路径
            ctx.beginPath()

            // 左下角（起点，避开圆弧）
            ctx.moveTo(radius, height - radius)

            // 底部边（从左到右）
            ctx.lineTo(bottomWidth - radius, height - radius)

            // 右下角圆弧
            ctx.arcTo(
                        bottomWidth, height - radius,
                        bottomWidth, height - 2 * radius,
                        radius
                        )

            // 右侧边（下到上）
            ctx.lineTo((width + topWidth)/2, radius)

            // 右上角圆弧
            ctx.arcTo(
                        (width + topWidth)/2, 0,
                        (width + topWidth)/2 - radius, 0,
                        radius
                        )

            // 顶部边（从右到左）
            ctx.lineTo((width - topWidth)/2 + radius, 0)

            // 左上角圆弧
            ctx.arcTo(
                        (width - topWidth)/2, 0,
                        (width - topWidth)/2, radius,
                        radius
                        )

            // 左侧边（上到下）
            ctx.lineTo(radius, height - 2 * radius)

            // 左下角圆弧（闭合路径）
            // ctx.arcTo(
            //             0, height - radius,
            //             radius, height - radius,
            //             radius
            //             )

            ctx.closePath()

            // 填充和描边
            ctx.fill()
            ctx.stroke()
        }
    }

    // 按钮
    Row{
        width: root.perWidth*9
        height: root.height
        anchors.horizontalCenter: parent.horizontalCenter

        IconButton{
            id: carBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/car.png"

            onClick: {
                root.carBtnClick()
            }
        }
        // 导航按钮
        IconButton{
            id: navigationBtn
            width: root.perWidth
            height: root.height
            size: 40
            source: "pic/navigation.png"

            onClick: {
                root.navigationBtnClick()
            }
        }


        IconButton{
            id: fanBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/fan.png"
            onClick: {
                root.fanBtnClick()
            }
        }

        // 进阶版
        TemperatureControl {
            id: leftTempControl
            width: root.perWidth
            height: root.height-20
            temperatureValue: mainPage.airTemp1
            onTemperatureChanged: (temp) =>{
                root.leftTemperatureChanged(temp)
                console.log(temp)
                mainPage.airTemp1 = temp
            }
        }
        IconButton{
            id: airBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/air.png"

            onClick: {
                root.airBtnClick()
            }
        }
        TemperatureControl{
            id: rightTempControl
            width: root.perWidth
            height: root.height-20
            temperatureValue: mainPage.airTemp2
            onTemperatureChanged: (temp) =>{
                root.rightTemperatureChanged(temp)
                mainPage.airTemp2 = temp
            }
        }

        IconButton{
            id: defogBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/defog.png"

            onClick: {
                root.defogBtnClick()
            }
        }

        IconButton{
            id: musicBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/music.png"

            onClick: {
                root.musicBtnClick()
            }
        }
        IconButton{
            id: bookBtn
            width: root.perWidth
            height: root.height
            size: 50
            source: "pic/book.png"

            onClick: {
                root.bookBtnClick()
            }
        }
    }
}
