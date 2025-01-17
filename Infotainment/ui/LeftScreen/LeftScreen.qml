import QtQuick 2.15

Rectangle{
    id: leftScreen

    anchors{
        left: parent.left
        right: rightScreen.left
        bottom: bottomBar.top
        top: parent.top
    }

     color: "white"   // 배경색 지정

    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * 0.75
        height: parent.height * 0.75
        fillMode: Image.PreserveAspectFit
        source: "file:///Volumes/jjeongni/QtProgramming/Infotainment/ui/assets/carRender.png"  // 절대 경로 사용
    }
}



