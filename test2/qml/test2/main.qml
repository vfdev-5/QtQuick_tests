
// Qt
import QtQuick 2.0

// project
import "logic.js" as Logic
import Polygon 1.0
import CutterTracker 1.0
import CustomGraphicsItem 1.0


Rectangle {
    id: screen
//    width: 490;
//    height: 720;

    width: 300
    height: 500


    SystemPalette { id: activePalette }

    // Playground
    Item {
        id: playground
        width: parent.width
        height: parent.height - toolbar.height
//        anchors { top: parent.top; bottom: toolbar.top }
        transformOrigin: Item.Center

        property bool isStartedNewGame: false

        Rectangle {
            id: background
            anchors.fill: parent
            color: "steelblue"
        }

        CustomGraphicsItem {
            id: polyline
            color: "white"
            graphicsType: "POLYLINE"
        }


        Cutter {
            id: cutterItem
            x: -width;
            y: -height;

        }

        CutterTracker{
            id: cutterTracker
        }


        MouseArea {

            anchors.fill: parent;
            onClicked: {
                if (parent.isStartedNewGame)
                    Logic.handleClick(mouse.x,mouse.y)
                else
                {
                    console.log("Mouse point : " + mouse.x + ", " + mouse.y)
                    if (playground.scale == 1.0)
                        polyline.clear();

//                    console.log("Polyline: append a point")
                    polyline.appendPoint(Qt.point(mouse.x,mouse.y));
//                    console.log("Polyline: points : " + polyline.points)

                    playground.x = -(mouse.x - playground.width*0.5) * playground.scale;
                    playground.y = -(mouse.y - playground.height*0.5) * playground.scale;

                    playground.scale *= 1.05;

//                    console.log("Playground : scale = " + background.scale);
//                    console.log("Playground : (x,y) = " + background.x + ", " + background.y);

                }
            }

        }

        Component.onCompleted: {
//            var pts = [];
//            pts[0] = Qt.point(5.0, 10.0);
//            pts[1] = Qt.point(10.0, 5.0);
//            pts[2] = Qt.point(15.0, 5.0);
//            pts[3] = Qt.point(20.0, 10.0);
//            pts[4] = Qt.point(20.0, 15.0);
//            pts[5] = Qt.point(15.0, 20.0);
//            pts[6] = Qt.point(10.0, 20.0);
//            pts[7] = Qt.point(5.0, 15.0);
//            polyline.points = pts;
        }
    }

    // Toolbar
    Rectangle {
        id : toolbar
        width: parent.width; height: parent.height*0.05
        color: activePalette.window
        anchors.bottom: screen.bottom

        Button {
            anchors { left: parent.left; verticalCenter: parent.verticalCenter }
            text: "New Game"
            onClicked : {
                polyline.clear()
                console.log("Start new game")
                Logic.startNewGame()
                playground.isStartedNewGame=true;
            }
        }

        Button {
            anchors { right: parent.right; verticalCenter: parent.verticalCenter }
            text: "Zoom out"
            onClicked : {
                playground.scale = 1.0;
                playground.x = 0.0;
                playground.y = 0.0;

            }
        }

    }

    // TEST (funny stuff):
//    Rectangle {
//        width: 60; height: 60
//        x: rect1.x - 5; y: rect1.y - 5
//        color: "green"

//        Behavior on x { SmoothedAnimation { velocity: 200 } }
//        Behavior on y { SmoothedAnimation { velocity: 200 } }
//    }

//    Rectangle {
//        id: rect1
//        width: 50; height: 50
//        color: "red"
//    }

//    focus: true
//    Keys.onRightPressed: rect1.x = rect1.x + 100
//    Keys.onLeftPressed: rect1.x = rect1.x - 100
//    Keys.onUpPressed: rect1.y = rect1.y - 100
//    Keys.onDownPressed: rect1.y = rect1.y + 100

}


// CANVAS TEST :
//Canvas {

//    id: canvas
//    anchors.fill: parent
//    property real scale: 1.0
//    property vector2d translation: Qt.vector2d(0.0, 0.0)

//    antialiasing: true

//    onScaleChanged: requestPaint()
//    onTranslationChanged: requestPaint()

//    onPaint: {

//        var ctx = canvas.getContext('2d');
//        ctx.save();
//        ctx.clearRect(0, 0, canvas.width, canvas.height);

//        ctx.translate(canvas.translation.x, canvas.translation.y);
//        ctx.scale(canvas.scale, canvas.scale);

//        ctx.translate(0, 10);

//        ctx.beginPath();
//        ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
//        ctx.moveTo(110,75);
//        ctx.arc(75,75,35,0,Math.PI,false);   // Mouth
//        ctx.moveTo(65,65);
//        ctx.arc(60,65,5,0,Math.PI*2,true);  // Left eye
//        ctx.moveTo(95,65);
//        ctx.arc(90,65,5,0,Math.PI*2,true);  // Right eye
//        ctx.stroke();

//        ctx.translate(120, 0);
//        ctx.beginPath();
//        ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
//        ctx.moveTo(110,75);
//        ctx.arc(75,75,35,0,Math.PI,false);   // Mouth
//        ctx.moveTo(65,65);
//        ctx.arc(60,65,5,0,Math.PI*2,true);  // Left eye
//        ctx.moveTo(95,65);
//        ctx.arc(90,65,5,0,Math.PI*2,true);  // Right eye
//        ctx.stroke();
//        ctx.restore();
//    }
//}

//onClicked: {
// Change scale :
//                    canvas.scale *= 2.0;
//}

//onPressed: {
//    tranlationX = mouse.x;
//    tranlationY = mouse.y;
//}

//onReleased: {
//    tranlationX -= mouse.x;
//    tranlationY -= mouse.y;

//    if (tranlationX > width*0.05 || tranlationY > height*0.05)
//    {
//        console.log("Translation : " + tranlationX + ", " + tranlationY);
//        canvas.translation = Qt.vector2d(-tranlationX, -tranlationY);
//        isTranslated = true;
//    }
//    isTranslated = false;
//}

//Button {
//    anchors { right: parent.right; verticalCenter: parent.verticalCenter }
//    text: "Zoom out"
//    onClicked : {
//        canvas.scale = 1.0;
//        canvas.translation = Qt.vector2d(0.0,0.0);
//    }
//}
