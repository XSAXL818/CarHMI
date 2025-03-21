import QtQuick
import QtQuick.Controls

Window {
    width: 1280
    // height: 1024
    height: (width / 16) * 10
    visible: true
    title: qsTr("Hello World") 
    

    Rectangle {
        id: root
        anchors.fill: parent
        color: "red"


        
        Rectangle {
            id: left
            width: 100
            height: root.height
            color: "black"

            Column{
                anchors.fill: parent

                Button{
                    text: "btn1"
                    width: parent.width
                    height: 100

                    onClicked: {
                        rCenter.source = "Home.qml"
                    }
                }

                Button{
                    text: "btn2"
                    width: parent.width
                    height: 100

                    onClicked: {
                        rCenter.source = "Page1.qml"
                    }
                }
            }


        }
        Rectangle {
            id: right
            anchors.left: left.right
            anchors.right: root.right
            anchors.top: root.top
            height: root.height
            color: "orange"


            Rectangle{
                id: rTop
                anchors.top: right.top
                width: right.width
                height: 50
                color: "gray"

            }

            Loader{
                id: rCenter
                anchors.top: rTop.bottom
                height: right.height-rTop.height
                width: right.width
                // color: "lightgray"

                source: "Home.qml"

    
                

            }

            Rectangle{
                id: rBottom
                anchors.bottom: right.bottom
                anchors.left: right.left
                anchors.right: right.right
                anchors.margins: 50
                height: 100
                color: "black"

            }

        }




    }
}
