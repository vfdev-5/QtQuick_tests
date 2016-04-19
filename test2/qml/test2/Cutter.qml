import QtQuick 2.0

Rectangle {
    id: cutter
    width: 20
    height: 20
    color: "white"
    radius: width*0.5
    x: 0
    y: 0

    property real motionInertia: 0.07

    Behavior on x {
        NumberAnimation {
            easing.type: Easing.InOutQuad
            duration: 400
        }
    }
    Behavior on y {
        NumberAnimation {
            easing.type: Easing.InOutQuad
            duration: 400
        }
    }

}

