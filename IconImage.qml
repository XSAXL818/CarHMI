import QtQuick
import QtQuick.Controls
// import QtGraphicalEffects


// 图标，默认居中父元素，且长宽相同
Image {
    id: icon
    anchors.centerIn: parent

    property int size: 40
    property alias source: icon.source

    height: size
    width: size

}


