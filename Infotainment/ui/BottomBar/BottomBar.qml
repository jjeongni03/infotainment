import QtQuick 2.15

Rectangle{
    id: bottomBar
    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12

    Image {
        id: carSettingIcon
        anchors{
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.85
        fillMode: Image.PreserveAspectFit

        source: "file:///Volumes/jjeongni/QtProgramming/Infotainment/ui/assets/car-5.png"
    }

    HVACComponent{
        id: driverHVACControl
        anchors{
            top: parent.top
            bottom: parent.bottom
            left: carSettingIcon.right
            leftMargin: 150
        }

        havacController: driverHVAC
    }

    HVACComponent{
        id: passengerHVACControl
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: volumeControl.left
            rightMargin: 150
        }

        havacController: passengerHVAC
    }

    VolumeControlComponent{
        id: volumeControl
        anchors{
            right: parent.right
            rightMargin: 30
            top: parent.top
            bottom: parent.bottom

        }
    }

}
