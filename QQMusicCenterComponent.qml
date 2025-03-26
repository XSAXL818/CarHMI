import QtQuick

Rectangle {
    anchors.fill: parent
    color: "transparent"

    Rectangle{
        id: img
        anchors.top: parent.top
        anchors.topMargin: 10
        RoundedIcon{
            anchors.centerIn: parent
            iconSource: "pic/power.jpg"
            size: 40
        }
    }
    Text{
        id: song
        anchors.top: img.bottom
        anchors.topMargin: 10
        text: "歌名"
    }

    Text{
        id: lyric
        anchors.top: song.bottom
        anchors.topMargin: 10
        text: "歌词"
    }
}
