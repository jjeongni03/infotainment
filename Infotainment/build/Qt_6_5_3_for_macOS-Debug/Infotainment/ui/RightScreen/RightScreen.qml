import QtQuick 2.15
import QtLocation 5.12
import QtPositioning 5.12

Rectangle{
    id: rightScreen

    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }

    Plugin{
        id: mapPlugin
        // name: "mapboxgl"
         name: "osm"
    }

    Map{
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(37.53, 127.02)
        zoomLevel: 14
    }

    Image{
        id:lockIcon
        anchors{
            left: parent.left
            top: parent.top
            margins: 20
        }

        width: parent.width / 30
        fillMode: Image.PreserveAspectFit
        source: (systemHandler.carLocked ? "file:///Volumes/jjeongni/QtProgramming/Infotainment/ui/assets/lock.png"
                                         : "file:///Volumes/jjeongni/QtProgramming/Infotainment/ui/assets/unlock.png")
        MouseArea{
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked (!systemHandler.carLocked)
        }
    }

    Text{
        id: dateTimeDisplay
        anchors{
            left: lockIcon.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }

        font.pixelSize: 20
        font.bold: true
        color: "black"

        text: systemHandler.currentTime
    }

    Text{
        id: outdoorTemperatureDisplay
        anchors{
            left: dateTimeDisplay.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }

        font.pixelSize: 20
        font.bold: true
        color: "black"

        text: systemHandler.outdoorTempCelsius + (systemHandler.useCelsius ? "°C" : "°F")

        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setUseCelsius(!systemHandler.useCelsius)
        }
    }

    Text{
        id: userNameDisplay
        anchors{
            left: outdoorTemperatureDisplay.right
            leftMargin: 40
            bottom: lockIcon.bottom
        }

        font.pixelSize: 20
        font.bold: true
        color: "black"

        text: systemHandler.userName
    }

    NavigationSearchBox{
        id: navSearchBox

        width: parent.width * 1/3
        height: parent.height * 1/12

        anchors{
            left: lockIcon.left
            top: lockIcon.bottom
            topMargin: 15
        }
    }

    width: parent.width * 2/3
}
