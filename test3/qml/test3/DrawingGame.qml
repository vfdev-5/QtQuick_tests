// Qt
import QtQuick 2.0
import QtQuick.Dialogs 1.1

// Project
import "UserInteraction.js" as Uia
import "Tools.js" as Tools
import "LevelLogics.js" as LL

Rectangle {

    id: gameScreen
    width: 300
    height: 500

    color: "black"
    property int drawingTime: 1500
    property var level
    property real precisionRatio: 0.1

    function setupLevel(n)
    {
        // setup level
        level = LL.generateLevel(n)
        if (level == null)
            return false;
        level.anchors.fill=gameScreen;
        level.z=0;
        return true;
    }

    Component.onCompleted: {
        if (!setupLevel(1))
            console.log("Failed to setup level");
    }

    UserDrawingSystem {
        id: userDrawingSystem
        anchors.fill: parent
        z:1

        onDrawingEnded: {
            if (!level || !level.controlPoints)
            {
                console.log("Level is null or not setup");
                return;
            }

            if (Uia.compareShapes(userShape, level.controlPoints, precisionRatio))
            {
                console.log("Level is complete")
                userDrawingSystem.visible=false;
                messageBox.message = "Level is complete";
                messageBox.anchors.centerIn=gameScreen;
                messageBox.visible=true;
            }


        }
    }

    MessageBox {
        id: messageBox
        width: gameScreen.width*0.4
        height: width*0.45
        z: 0.5
        visible: false;
        onClicked: {
            //console.log("Go to the next level");
            var n = level.counter;
            level.destroy();
            if (!setupLevel(n+1))
                console.log("Failed to setup level");

            userDrawingSystem.visible=true;
            messageBox.visible=false;

        }
    }


}
