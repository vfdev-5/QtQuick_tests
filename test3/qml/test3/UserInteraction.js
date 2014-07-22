
var PRECISION = 10;


function compareShapes(userShape, controlPoints, precisionRatio)
{
    PRECISION = Math.min(gameScreen.width, gameScreen.height)*precisionRatio;
    var checkPoints=controlPoints.slice(0);
    var result=0;


    // Check if userShape passes through the control points
    for (var i=0; i<userShape.length;i++)
    {
        var usp = userShape[i];
        var index=-1;
        for (var j=0; j<checkPoints.length; j++)
        {
            var cp = checkPoints[j];
            if (Math.abs(usp.x - cp.x) < PRECISION
                    && Math.abs(usp.y - cp.y) < PRECISION)
            {
                result++;
                index=j;
                break;
            }
        }
        // remove found control point:
        if (index >= 0)
            checkPoints.splice(index, 1);
    }

    return result == controlPoints.length;
}

