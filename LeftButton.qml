import QtQuick
import QtQuick.Controls

Button{
    id: btn
    property int size: 40
    property string source
    signal click

    // background: Item{}
    background: Rectangle{
        anchors.fill: parent
        color: btn.pressed ? "gray" : "transparent"
        radius: 40
    }


    Image {
        id: icon
        anchors.centerIn: parent
        height: btn.size
        width: btn.size
        source: btn.source
    }

    onClicked: {
        btn.click()
    }
}
