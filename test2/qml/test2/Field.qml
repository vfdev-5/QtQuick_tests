
import QtQuick 2.0

import CustomGraphicsItem 1.0

Item {

    id: field
//    Rectangle {
//        anchors.fill: parent
//        id: shape
//        width: 0
//        height: 0
//        color: "#FF0000FF"
//    }


    CustomGraphicsItem {
        anchors.top: parent.top
        anchors.left: parent.left
        id: shape
        color: "#FFFFFFFF"
        fillColor: "#FF0000FF"
        graphicsType: "POLYGON"
    }

    /// Method to create default rectangle using 2 points. Input is Qt.point
    function createRect(topLeft, bottomRight) {

        var pts = [];
        pts[0] = topLeft;
        pts[1] = Qt.point(bottomRight.x, topLeft.y);
        pts[2] = bottomRight;
        pts[3] = Qt.point(topLeft.x, bottomRight.y);
        shape.points = pts;

    }

    /// Method to dissect current polygon into two using a polyline. Input is Array of Qt.point
    function dissectWithPolyline(polyline){


    }


}

