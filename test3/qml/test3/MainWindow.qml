
// Qt
import QtQuick 2.0

Rectangle {
    id: screen
    width: 300
    height: 500

    property string newButtonGameText : "New Game"
    signal newGameButtonClicked
    property Item playground: playground

    SystemPalette { id: activePalette }

    // Playground
    Item {
        id: playground
        width: parent.width
        height: parent.height - toolbar.height



    }

    // Toolbar
    Rectangle {
        id : toolbar
        width: parent.width
        height: parent.height*0.05
        color: activePalette.window
        anchors.bottom: screen.bottom

        Button {
            id: newGameButton
            anchors { left: parent.left; verticalCenter: parent.verticalCenter }
            text: newButtonGameText
            onClicked: screen.newGameButtonClicked();
        }
    }

}
