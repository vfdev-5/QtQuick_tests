// Qt
import QtQuick 2.0

// project
import "Tools.js" as Tools

Item {
    width: 300
    height: 500

    property var game;

    MainWindow {
        id: mainWindow
        anchors.fill: parent

        onNewGameButtonClicked: {

            game = Tools.createQmlObject("DrawingGame.qml", playground)
            if (game == null)
                return;
            game.anchors.fill = playground


        }

    }
}


