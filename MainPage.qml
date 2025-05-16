import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick3D.Effects
import Qt5Compat.GraphicalEffects
import QtPositioning
import QtMultimedia



Rectangle {
    id: root
    // anchors.fill: parent
    // color: "#2b2e3b"
    // 左侧按钮的高
    property int leftBtnHeight: height/8
    // 左侧按钮的图标长宽
    property int leftIconSize: 30

    // 用于测试
    property bool testBool: false

    property bool isOpenPageBackground : false
    property string mainPageBackgroudImage: "pic/mainPageBG3.png"

    // 顶部状态栏
    property double mediaVolume: 0.5
    property double navVolume: 0.4
    property double controlBrightness: 0.5
    property double insBrightness: 0.6
    property bool isWIFIOn: true
    property bool isBluetoothOn: true
    property bool isThemeOn: false
    property bool isLocationOn: false
    property bool isQLYOn: false
    property bool isRotateOn: false
    property bool isHUDOn: false
    property bool isXJOn: false
    property bool isTFOn: false
    property bool isCSOn: false
    property bool isTCOn: false
    property bool isESPOn: false

    // 时间信息
    // property string year: value
    property string year
    property string month
    property string day
    property string hours
    property string minutes
    property string dayIndex

    // 天气状况
    property int wpCode: 0 // 天气码
    property string wp: "晴" // 天气
    property double tem: 0.0 // 温度
    property int aqi: 0 // 空气质量指数
    property string aqiDesc: "优" // 天气质量指数描述

    // 汽车设置
    property var leftBtnNames: ["DiLink","DiPilot","新能源","车辆设置","车辆健康"]

    // 音乐播放
    property bool isPlay: false
    property var songList: ["music/TooBad.mp3","music/DontStop.mp3","music/Time.mp3",]
    property var songNameList: ["TooBad","DontStop","Time",]
    property var lyricsList: ["music/DontStop.lrc","music/TooBad.lrc","music/Time.lrc",]
    property var songSingerList: ["权志龙","The Rolling Stones","Trouble Maker"]
    property var songIconList: ["pic/songIcon1.png","pic/songIcon2.png","pic/songIcon3.png",]
    property int curPlayIndex: 0
    property int songPosition: 0
    property int songDuration: 0
    property string curSongTime: "00:00"
    property string totalSongTime: "00:00"

    // 汽车状态信息
    property int companyDay: 280
    property int mileage: 8400
    property int electrical: 60
    property int electricalNum: 3
    property int electDistance: 245
    property string carImg: "pic/su7.png"

    // 空调信息
    property int airTemp1: 20
    property int airTemp2: 24
    property bool isOpenPar1: false
    property bool isOpenPar2: false

    // 地图信息
    property string homeUrl: "https://amap.com/dir?from%5Bid%5D=B03A30BH0T-from&from%5Bname%5D=%E8%A5%BF%E5%8C%97%E5%B8%88%E8%8C%83%E5%A4%A7%E5%AD%A6(%E4%BA%91%E4%BA%AD%E6%A0%A1%E5%8C%BA)&from%5Blnglat%5D=103.738439%2C36.098080&from%5Bmodxy%5D=103.731320%2C36.098125&from%5Bpoitype%5D=141201&from%5Badcode%5D=620105&to%5Bid%5D=B0FFFX7RR5&to%5Bname%5D=%E8%A5%BF%E5%8C%97%E5%B8%88%E8%8C%83%E5%A4%A7%E5%AD%A6(%E7%9F%A5%E8%A1%8C%E6%A0%A1%E5%8C%BA)&to%5Blnglat%5D=103.736609%2C36.107997&to%5Bmodxy%5D=103.733511%2C36.106616&to%5Bpoitype%5D=141201&to%5Badcode%5D=620105&type=car&policy=1&dateTime=now"
    property string workUrl: "https://amap.com/dir?from%5Bid%5D=B03A30BH0T&from%5Bname%5D=%E8%A5%BF%E5%8C%97%E5%B8%88%E8%8C%83%E5%A4%A7%E5%AD%A6(%E4%BA%91%E4%BA%AD%E6%A0%A1%E5%8C%BA)&from%5Blnglat%5D=103.738439%2C36.098080&from%5Bmodxy%5D=103.731320%2C36.098125&from%5Bpoitype%5D=141201&from%5Badcode%5D=620105&to%5Bname%5D=%E5%85%B0%E5%B7%9E%E4%B8%AD%E5%BF%83&to%5Blnglat%5D=103.774761%2C36.069013&to%5Bid%5D=B0FFFZRDD9&to%5Bpoitype%5D=060101&to%5Badcode%5D=620100&to%5Bmodxy%5D=103.775146%2C36.067658&type=car&policy=1&dateTime=now"
    property string navToUrl: "https://www.amap.com/dir?from%5Bid%5D=B0FFFX7RR5&from%5Bname%5D=%E8%A5%BF%E5%8C%97%E5%B8%88%E8%8C%83%E5%A4%A7%E5%AD%A6(%E7%9F%A5%E8%A1%8C%E6%A0%A1%E5%8C%BA)&from%5Blnglat%5D=103.736609%2C36.107997&from%5Bmodxy%5D=103.733511%2C36.106616&from%5Bpoitype%5D=141201&from%5Badcode%5D=620105&to%5Bname%5D=%E8%A5%BF%E5%8C%97%E5%B8%88%E8%8C%83%E5%A4%A7%E5%AD%A6(%E4%BA%91%E4%BA%AD%E6%A0%A1%E5%8C%BA)&to%5Blnglat%5D=103.738439%2C36.098080&to%5Bid%5D=B03A30BH0T&to%5Bpoitype%5D=141201&to%5Badcode%5D=620100&to%5Bmodxy%5D=103.731320%2C36.098125&type=car&policy=1"
    property string defaultMapUrl: "https://amap.com/"
    property string chargeUrl: "https://amap.com/search?query=%E5%85%85%E7%94%B5%E7%AB%99&city=620100&geoobj=103.89656%7C35.984714%7C104.041617%7C36.054515&zoom=13.54"


    property string blueColor: "#52afd5"


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

    // 左侧控制栏
    MainPageLeftPart{
        id: left
        btnHeight: leftBtnHeight
        iconSize: root.leftIconSize

        onProfileClicked: {
            console.log("点击头像")
        }

        onBackBtnClicked: {
            if( mainPageRightPart.isDrawerOpened() ){
                mainPageRightPart.closeDrawer()
            } else {
                // 执行页面退栈逻辑
            }
        }

        onHomeBtnClicked: {
            mainPage.pageSource = "Home.qml"
        }

        onMenuBtnClicked: {
            mainPage.pageSource = "AppPage.qml"
        }

        onClockWiseBtnClicked: {
            console.log("旋转")
        }

        onCloseBtnClicked: {
            Qt.quit()
        }
    }


    // 页面资源
    property string pageSource: "Home.qml"

    // 右侧界面
    MainPageRightPart{
        id: mainPageRightPart
        anchors.left: left.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 10
        // 用于抽屉的x起始位置
        leftWidth: left.width

    }

    // 定时更新时间
    Timer {
        id: updateDate
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            // 获取当前时间对象
            var currentDate = new Date();
            // 提取各部分时间（注意月份从0开始）
            year = currentDate.getFullYear();    // 2025
            month = currentDate.getMonth() + 1;  // 5（实际为5月）
            day = currentDate.getDate();         // 9
            hours = currentDate.getHours();      // 15（24小时制）
            minutes = currentDate.getMinutes();  // 30
            dayIndex = currentDate.getDay();

            if( minutes === "0" ){
                minutes = "00"
            } else if( minutes.length === 1 ){
                minutes = "0"+minutes
            }

            switch (dayIndex) {
            case "1": dayIndex = "星期一";break;
            case "2": dayIndex = "星期二";break;
            case "3": dayIndex = "星期三";break;
            case "4": dayIndex = "星期四";break;
            case "5": dayIndex = "星期五";break;
            case "6": dayIndex = "星期六";break;
            case "7": dayIndex = "星期天";break;
            }
        }
    }


    // 获取天气信息
    Item {
        id: weatherTool
        property string city: "Beijing"
        property string temperature: "--"
        property string description: "N/A"

        function fetchWeather() {
            const token = "ad85aece7c4e799288e2e3d17b1ed392";
            const url = `https://api.open.geovisearth.com/v2/cn/area/basic?token=${token}&location=WTX_CH101160108`

            const xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        root.tem = response.result.tem;
                        root.wpCode = response.result.wp_code;
                        root.wp = response.result.wp;


                    } else {
                        console.error("Error:", xhr.statusText);
                    }
                }
            };
            xhr.open("GET", url);
            xhr.send();
        }

        function fetchDesc() {
            const token = "46b36b8ed4dbdfc82e0d5e9bfa58f181";
            const url = `https://api.open.geovisearth.com/v2/realtime/aqi/stations?token=${token}&location=WTX_CH101160108`

            const xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        // root.aqi = response.result.aqi;
                        // root.aqi = response.result.aqi;
                        // var a = response.result.aqi;
                        // console.log("成功")
                        console.log(xhr.responseText)
                        // 计算aqi_desc

                    } else {
                        console.error("Error:", xhr.statusText);
                    }
                }
            };
            xhr.open("GET", url);
            xhr.send();
        }

        // 获取天气信息
        Component.onCompleted: {
            fetchDesc()
            fetchWeather()
        }
    }


    property int min
    property int sec

    MediaPlayer{
        id: player
        source: root.songList[root.curPlayIndex]
        audioOutput: audioOutput

        onPositionChanged: {
            min = position/60000
            sec = (position%60000)/1000
            if( min < 10 ){
                root.curSongTime = "0" + min
            } else {
                root.curSongTime = min
            }

            if( sec < 10 ){
                root.curSongTime += ":0" + sec
            } else {
                root.curSongTime += ":" + sec
            }

            min = player.duration/60000
            sec = (player.duration&60000)/1000
            if( min < 10 ){
                root.totalSongTime = "0" + min
            } else {
                root.totalSongTime = min
            }
            if( sec < 10 ){
                root.totalSongTime += ":0" + sec
            } else {
                root.totalSongTime += ":" + sec
            }

        }
        Component.onCompleted: {
            root.songPosition = 0
            root.songDuration = duration
            // player.play()
        }
    }

    onCurPlayIndexChanged: {
        min = player.duration/60000
        sec = (player.duration&60000)/1000
        if( min < 10 ){
            root.totalSongTime = "0" + min
        } else {
            root.totalSongTime = min
        }
        if( sec < 10 ){
            root.totalSongTime += ":0" + sec
        } else {
            root.totalSongTime += ":" + sec
        }
    }

    AudioOutput{
        id: audioOutput
        volume: root.mediaVolume
    }

    onIsPlayChanged: {
        if( isPlay ){
            min = player.duration/60000
            sec = (player.duration&60000)/1000
            if( min < 10 ){
                root.totalSongTime = "0" + min
            } else {
                root.totalSongTime = min
            }
            if( sec < 10 ){
                root.totalSongTime += ":0" + sec
            } else {
                root.totalSongTime += ":" + sec
            }
            player.play()
        } else {
            player.pause()
        }
    }


    function nextSong(){
        root.isPlay = false
        root.curPlayIndex += 1
        if( root.curPlayIndex == 3 ){
            root.curPlayIndex = 0
        }
        root.isPlay = true
    }

    function lastSong(){
        root.isPlay = false
        root.curPlayIndex -= 1
        if( root.curPlayIndex == -1 ){
            root.curPlayIndex = 2
        }
        root.isPlay = true
    }
}
