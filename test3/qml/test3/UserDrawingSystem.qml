// Qt
import QtQuick 2.0
import QtQuick.Particles 2.0

Item {

    id: userDrawingSystem

    property var userShape;
    property bool isDrawing: false

    signal drawingEnded

    Timer {
        id: timer
        repeat: false
        running: false
        interval: drawingTime
        onTriggered: isDrawing=false;
    }

    ParticleSystem {
        id: sys
        anchors.fill: parent
        z: parent.z

        ImageParticle {
            system: sys
            id: cp
            // Since Qt 5.2, some default images are provided as resources to aid prototyping:
            source: "qrc:///particleresources/glowdot.png"
            colorVariation: 0.4
            color: "#000000FF"
        }

        Emitter {
            //burst on click
            id: bursty
            system: sys
            enabled: false
            x: ma.mouseX
            y: ma.mouseY
            emitRate: 8000
            lifeSpan: 500
            acceleration: AngleDirection {angleVariation: 360; magnitude: 360; }
            size: 8
            endSize: 16
            sizeVariation: 4
        }

        MouseArea {
            id: ma
            anchors.fill: parent
            onPressed: {
                bursty.pulse(drawingTime)
                userShape = [];
                userShape.push(Qt.point(mouse.x, mouse.y));
                isDrawing=true;
                timer.start();
            }
            onPositionChanged: {
                if (isDrawing)
                    userShape.push(Qt.point(mouse.x, mouse.y));
            }
            onReleased: {
                if (isDrawing)
                    userShape.push(Qt.point(mouse.x, mouse.y));

                // SHOW POINTS :
//                console.log("User shape : ");
//                for (var i=0; i<userShape.length; i++)
//                {
//                    console.log(userShape[i].x + ", " + userShape[i].y);
//                }

                // notify that drawing is ended:
                drawingEnded();
            }

        }
    }

}
