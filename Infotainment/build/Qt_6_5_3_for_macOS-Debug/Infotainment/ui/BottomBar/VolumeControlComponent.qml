import QtQuick 2.15

Item {

    property string fontColor: "#f0eded"

    Connections {
        target: audioController
        onVolumeLevelChanged: {
            volumeIcon.visible = false
            visibileTimer.stop()
            visibileTimer.start()
        }
    }

    Timer{
        id: visibileTimer
        interval: 1000
        repeat: false
        onTriggered: {
            volumeIcon.visible = true
        }

    }


    width: 120 * (parent.width / 1280)
    Rectangle{
        id: decrementButton
        anchors{
            right: volumeIcon.left
            rightMargin: 15
            top: parent.top
            bottom: parent.bottom

        }
        width: height / 2
        color: "black"
        Text{
            id: decremntText
            color: fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }

        MouseArea{
            anchors.fill: parent
            onClicked: audioController.incrementVolume(-1)
        }
    }

    Image {
        id: volumeIcon
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        anchors{
            right: incrementButton.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
        source: {
            if(audioController.VolumLevel <= 1)
                return "file:///Volumes/jjeongni/QtProgramming/Infotainment/ui/assets/mute.png"
            else if(audioController.VolumLevel <= 50)
                return "file:///Volumes/jjeongni/QtProgramming/Infotainment/ui/assets/down.png"
            else
                return  "file:///Volumes/jjeongni/QtProgramming/Infotainment/ui/assets/up.png"
        }
    }

    Text{
        id: volumeTextLabel
        visible: !volumeIcon.visible
        anchors{
            centerIn: volumeIcon
        }
        color: fontColor
        font.pixelSize: 24
        text: audioController.VolumLevel

    }

    Rectangle{
        id: incrementButton
        anchors{
            right: parent.right
            rightMargin: 15
            top: parent.top
            bottom: parent.bottom

        }
        width: height / 2
        color: "black"
        Text{
            id: incremntText
            color: fontColor
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 12
        }

        MouseArea{
            anchors.fill: parent
            onClicked: audioController.incrementVolume(1)
        }
    }
}
