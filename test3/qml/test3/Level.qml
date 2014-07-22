// Qt
import QtQuick 2.0



Item {

    anchors.fill: parent
    property int counter: 0
    property var controlPoints;

    //    Image {
    //        source: "qrc:///test3/images/L1.png"
    //        anchors.fill: parent
    //        smooth: true
    //        z: 0
    //        opacity: 0.5
    //    }

//    Rectangle
//    {
//        x: parent.width*0.1
//        y: parent.height*0.1
//        z: parent.z
//        width: parent.width*0.5
//        height: parent.height*0.3

//        color: "red"
//        opacity: 0.5
//    }


    Canvas {

        id: canvas
        anchors.fill: parent
        z: parent.z
        opacity: 0.5
//        property real scale: 1.0
//        property vector2d translation: Qt.vector2d(0.0, 0.0)
        antialiasing: true
//        onScaleChanged: requestPaint()
//        onTranslationChanged: requestPaint()
        onPaint: {

            if (!controlPoints)
            {
                console.log("Level is not setup");
                return;
            }


            var ctx = canvas.getContext('2d');
            ctx.reset();
            ctx.clearRect(0, 0, canvas.width, canvas.height);
//            ctx.translate(canvas.translation.x, canvas.translation.y);
//            ctx.scale(canvas.scale, canvas.scale);
            ctx.strokeStyle='#FFFFFF';
            ctx.lineWidth=15.0;
            ctx.lineCap='round';
//            ctx.lineJoin='round';

            if (controlPoints.length < 2)
                return;

            ctx.beginPath();
            ctx.moveTo(controlPoints[0].x, controlPoints[0].y);
            // DEBUG_BEGIN
//            ctx.stroke();
//            ctx.save();
//            ctx.strokeStyle='#0000FF';
//            ctx.fillStyle='#FF0000'
//            ctx.lineWidth=1.0;
//            ctx.ellipse(controlPoints[0].x, controlPoints[0].y, canvas.width*0.17, canvas.width*0.17);
//            ctx.stroke();
//            ctx.restore();
            // DEBUG_END


            for (var i=1; i< controlPoints.length; i++)
            {
                ctx.lineTo(controlPoints[i].x, controlPoints[i].y);
                // DEBUG_BEGIN
//                ctx.stroke();
//                ctx.save();
//                ctx.strokeStyle='#0000FF';
//                ctx.fillStyle='#FF0000'
//                ctx.lineWidth=1.0;
//                ctx.ellipse(controlPoints[i].x, controlPoints[i].y, canvas.width*0.17, canvas.width*0.17);
//                ctx.stroke();
//                ctx.restore();
                // DEBUG_END

            }
            ctx.stroke();


//            ctx.beginPath();
//            ctx.translate(0, 10);
//            ctx.beginPath();
//            ctx.arc(75,75,50,0,Math.PI*2,true); // Outer circle
//            ctx.moveTo(110,75);
//            ctx.arc(75,75,35,0,Math.PI,false);   // Mouth
//            ctx.moveTo(65,65);
//            ctx.arc(60,65,5,0,Math.PI*2,true);  // Left eye
//            ctx.moveTo(95,65);
//            ctx.arc(90,65,5,0,Math.PI*2,true);  // Right eye
//            ctx.stroke();

        }
    }


}
