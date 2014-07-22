import QtQuick 2.0

Rectangle {

    id: container
    width: 100
    height: 62

    color: activePalette.window;
    radius: 5.0
    border.width: width*0.01
    border.color: Qt.darker(activePalette.window)

    property string message: "Level is complete!"
    signal clicked
    property var activePalette: systemPalette

    SystemPalette { id: systemPalette }

    Column {
        spacing: parent.height*0.1
        anchors.centerIn: parent
        Text {
            text: message
            font.weight: Font.Bold
        }

        Button {
            id: button
            text: "Next..."
            onClicked: container.clicked()
        }
    }



}
