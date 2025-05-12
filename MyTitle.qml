import QtQuick

Text {
    property int type: 1

    text: ""
    font.pixelSize: {
        switch(type){
        case 1: 40 ; break;
        case 2: 32 ; break;
        case 3: 24 ; break;
        case 4: 20 ; break;
        case 5: 16 ; break;
        }
    }

    color: "white"

}
