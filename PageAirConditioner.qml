import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes


Rectangle {
    id: root
    anchors.fill: parent

    Image {
        // anchors.fill: parent
        width: parent.width
        height: parent.height
        source: "pic/bg_air.png"
        fillMode: Image.PreserveAspectCrop

        layer.enabled: true
        layer.effect: GaussianBlur {
            radius: 8      // 模糊半径（控制模糊强度）
            samples: 16     // 采样数（建议为 radius*2，影响平滑度）
        }

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

    Rectangle{
        id: leftControl
        width: 400
        height: 400
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        anchors.topMargin: 100

        color: "transparent"


        // 当前温度属性（16~32）
        property real currentTemp: mainPage.airTemp1
        readonly property real minTemp: 16
        readonly property real maxTemp: 32

        // 背景弧形轨道
        Shape {
            id: track1
            anchors.centerIn: parent
            width: 400
            height: 400

            // 主弧形轨道
            ShapePath {
                strokeColor: "#DD272e3a"
                strokeWidth: 70
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap
                PathAngleArc {
                    centerX: track1.width / 2
                    centerY: track1.height / 2
                    radiusX: track1.width / 2 - 30
                    radiusY: track1.height / 2 - 30
                    startAngle: 40     // 修改点1：起始角度设为40°
                    sweepAngle: 280    // 保持280°跨度
                }
            }
        }

        // 滑动按钮
        Rectangle {
            id: sliderButton1
            width: 70
            height: 70
            radius: 35
            color: "#2196F3"
            antialiasing: true
            border.width: 2
            border.color: Qt.darker(color, 1.2)

            // 按钮阴影
            layer.enabled: true
            layer.effect: DropShadow {
                radius: 8
                color: "#80000000"
                spread: 0.2
            }

            // 温度数值显示
            Text {
                id: temTxt
                anchors.centerIn: parent
                text: Math.round(leftControl.currentTemp) + "°C"
                color: "white"
                font.pixelSize: 16
                font.bold: true

                onTextChanged: {
                    mainPage.airTemp1 = Math.round(leftControl.currentTemp)
                }
            }


            x: track1.x + leftControl.calcX(120)
            y: track1.y + leftControl.calcY(120)
        }

        // 拖拽逻辑修改
        MouseArea {
            anchors.fill: sliderButton1
            drag { target: sliderButton1; axis: Drag.XAndYAxis }

            onPositionChanged: {
                let centerX = track1.x + track1.width / 2;
                let centerY = track1.y + track1.height / 2;
                let dx = mouseX + sliderButton1.x - centerX;
                let dy = mouseY + sliderButton1.y - centerY;
                let angle = Math.atan2(dy, dx) * 180 / Math.PI;

                // 修改点2：将角度转换为0~360范围
                if (angle < 0) angle += 360;

                // 修改点3：限制角度在40°~320°
                angle = Math.max(40, Math.min(320, angle));

                // 更新按钮位置
                sliderButton1.x = track1.x + leftControl.calcX(angle);
                sliderButton1.y = track1.y + leftControl.calcY(angle);

                // 修改点4：重新映射温度值（40°→16°, 320°→32°）
                leftControl.currentTemp = leftControl.minTemp + ((angle - 40) / 280) * (leftControl.maxTemp - leftControl.minTemp);
            }
        }

        // 坐标计算函数（需适配新角度）
        function calcX(angle) {
            let radius = track1.width / 2 - 30;
            return track1.width / 2 - sliderButton1.width / 2 + radius * Math.cos(angle * Math.PI / 180);
        }

        function calcY(angle) {
            let radius = track1.height / 2 - 30;
            return track1.height / 2 - sliderButton1.height / 2 + radius * Math.sin(angle * Math.PI / 180);
        }
    }


    Rectangle{
        id: rightControl
        width: 400
        height: 400
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 50
        anchors.topMargin: 100

        color: "transparent"

        // 当前温度属性（16~32）
        property real currentTemp: mainPage.airTemp2
        property real currentAngle: -140 + (currentTemp-16)*17.5
        readonly property real minTemp: 16
        readonly property real maxTemp: 32

        // 背景弧形轨道
        Shape {
            id: track2
            anchors.fill: parent
            // 主弧形轨道
            ShapePath {
                strokeColor: "#DD272e3a"
                strokeWidth: 70
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap
                PathAngleArc {
                    centerX: track2.width / 2
                    centerY: track2.height / 2
                    radiusX: track2.width / 2 - 30
                    radiusY: track2.height / 2 - 30
                    startAngle: -140   // 起始角度（左端）
                    sweepAngle: 280    // 弧形跨度（覆盖280度）
                }
            }
        }

        // 滑动按钮
        Rectangle {
            id: sliderButton2
            width: 70
            height: 70
            radius: 35
            color: "#2196F3"
            antialiasing: true
            border.width: 2
            border.color: Qt.darker(color, 1.2)

            // 初始位置（对应中间温度24°C）
            x: track2.x + rightControl.calcX(0)  // -110° 对应中间位置
            y: track2.y + rightControl.calcY(0)

            // 按钮阴影
            layer.enabled: true
            layer.effect: DropShadow {
                radius: 8
                color: "#80000000"
                spread: 0.2
            }

            // 温度数值显示
            Text {
                anchors.centerIn: parent
                text: Math.round(rightControl.currentTemp) + "°C"
                color: "white"
                font.pixelSize: 16
                font.bold: true

                onTextChanged: {
                    mainPage.airTemp2 = Math.round(rightControl.currentTemp)
                }
            }
        }

        // 拖拽逻辑
        MouseArea {
            anchors.fill: sliderButton2
            drag { target: sliderButton2; axis: Drag.XAndYAxis }

            onPositionChanged: {
                let centerX = track2.x + track2.width / 2;
                let centerY = track2.y + track2.height / 2;

                // 计算相对于中心的角度
                let dx = mouseX + sliderButton2.x - centerX;
                let dy = mouseY + sliderButton2.y - centerY;
                let angle = Math.atan2(dy, dx) * 180 / Math.PI;

                // 限制角度范围 (-140° ~ +140°)
                angle = Math.min(140, Math.max(-140, angle));

                // 更新按钮位置
                sliderButton2.x = track2.x +rightControl.calcX(angle);
                sliderButton2.y = track2.y + rightControl.calcY(angle);

                // 映射角度到温度值
                let progress = (angle + 140) / 280;  // 0~1
                rightControl.currentTemp = rightControl.minTemp + progress * (rightControl.maxTemp - rightControl.minTemp);
            }
        }

        // 计算按钮X坐标（根据角度）
        function calcX(angle) {
            let radius = track2.width / 2 - 30;
            return track2.width / 2 - sliderButton2.width / 2 + radius * Math.cos(angle * Math.PI / 180);
        }

        // 计算按钮Y坐标（根据角度）
        function calcY(angle) {
            let radius = track2.height / 2 - 30;
            return track2.height / 2 - sliderButton2.height / 2 + radius * Math.sin(angle * Math.PI / 180);
        }

    }


    // 粒子按钮
    Rectangle {
        id: parBtn1
        x: leftControl.x + leftControl.width/2 - 30
        y: leftControl.y + leftControl.height/2 - 30
        width: 70
        height: 70
        radius: 35
        // color: "#2196F3"
        antialiasing: true
        border.width: 2
        border.color: Qt.darker(color, 1.2)


        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{
                position: 0.0
                color: "#9037e5f8"
            }
            GradientStop{
                position: 0.5
                color: "#900f7ce0"
            }
        }

        // 按钮阴影
        layer.enabled: true
        layer.effect: DropShadow {
            radius: 8
            color: "#80000000"
            spread: 0.2
        }

        Text {
            anchors.centerIn: parent
            text: "负离子"
            color: "white"
            font.pixelSize: 20
            font.bold: true
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainPage.isOpenPar1 = !mainPage.isOpenPar1
                if ( mainPage.isOpenPar1 ) {
                    particle1.startParticle()
                } else {
                    particle1.stopParticle()
                }
            }
        }

    }

    // 粒子按钮
    Rectangle {
        id: parBtn2
        x: rightControl.x + rightControl.width/2 -30
        y: rightControl.y + rightControl.height/2 -30
        width: 70
        height: 70
        radius: 35
        // color: "#2196F3"

        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{
                position: 0.0
                color: "#9037e5f8"
            }
            GradientStop{
                position: 0.5
                color: "#900f7ce0"
            }
        }

        antialiasing: true
        border.width: 2
        border.color: Qt.darker(color, 1.2)

        // 按钮阴影
        layer.enabled: true
        layer.effect: DropShadow {
            radius: 8
            color: "#80000000"
            spread: 0.2
        }

        // 温度数值显示
        Text {
            anchors.centerIn: parent
            text: "香薰"
            color: "white"
            font.pixelSize: 20
            font.bold: true
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainPage.isOpenPar2 = !mainPage.isOpenPar2
                if ( mainPage.isOpenPar2 ) {
                    particle2.startParticle()
                } else {
                    particle2.stopParticle()
                }
            }
        }

    }

    Rectangle{
        width: 300
        height: 400
        color: "transparent"
        x: parBtn2.x - 150
        y: parBtn2.y- 70

        LineParticles{
            id: particle2
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 1
            isDeDirection: true
            Component.onCompleted: {
                mainPage.isOpenPar2 ? particle2.startParticle() : particle2.stopParticle()
            }
        }
    }

    Rectangle{
        width: 300
        height: 400
        color: "transparent"
        x: parBtn1.x - 150
        y: parBtn1.y- 70

        LineParticles{
            id: particle1
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 1

            Component.onCompleted: {
                mainPage.isOpenPar1 ? particle1.startParticle() : particle1.stopParticle()
            }
        }
    }



}
