
var g_cutter;
var g_field;
var g_cutterTracker;


/// Method to create Qml object using qml file
function createQmlObject(filename, parent)
{
    var component = Qt.createComponent(filename)
    if (component.status == Component.Ready)
    {
        var object = component.createObject(parent);
        if (object == null)
        {
            console.log("error creating object : " + filename);
            console.log(component.errorString());
            return null;
        }
        return object;
    }
    console.log("error creating qml component : " + filename);
    console.log(component.errorString());
    return null;
}


/// Method to initialize a new game : create Field and Cutter
function startNewGame()
{
    // Clean up previous state:
    if (g_field != null)
        g_field.destroy();

    // Create field
    g_field = createQmlObject("Field.qml", background)
    if (g_field == null)
        return false;

//    var hMargin = 0.12
//    var vMargin = 0.07
    var hMargin = 0.32
    var vMargin = 0.27
//    g_field.x = background.width*hMargin
//    g_field.y = background.height*vMargin
//    g_field.width = background.width*(1.0 - 2.0*hMargin)
//    g_field.height = background.height*(1.0 - 2.0*vMargin)
    var topLeft = Qt.point(background.width*hMargin, background.height*vMargin);
    var bottomRight = Qt.point(background.width*(1.0 - hMargin),background.height*(1.0 - vMargin));
    g_field.createRect(topLeft, bottomRight);


    // create Cutter
//    cutter = createQmlObject("Cutter.qml", background)
//    if (cutter == null)
//        return false;
    g_cutter = cutterItem;

    g_cutter.x = background.width*0.5
    g_cutter.y = background.height - g_cutter.height;

    // Create cutterTracker
    g_cutterTracker = cutterTracker;

    return true;
}

/// Method to modify coordinate due to boundary presence
function fixOnBoundary(x, minLimit, maxLimit)
{
    var out = x;
    if (out < minLimit)
        out = minLimit;
    if (out > maxLimit)
        out = maxLimit;
    return out;
}

/// Method to test if point is in the Field
function isInField(x, y)
{
    if (g_field.x > x || x >= g_field.x + g_field.width  )
    {
        return false;
    }
    if (g_field.y > y || y >= g_field.y + g_field.height  )
    {
        return false;
    }
    return true;
}


/// Method to handle mouse click : move Cutter
function handleClick(x, y)
{
    if (g_cutter == null)
        return;

    var newX = x - g_cutter.width*0.5 + (x - g_cutter.x)*g_cutter.motionInertia;
    var newY = y - g_cutter.height*0.5 + (y - g_cutter.y)*g_cutter.motionInertia;
    newX = fixOnBoundary(newX, g_cutter.width*0.5, background.width - g_cutter.width);
    newY = fixOnBoundary(newY, g_cutter.height*0.5, background.height - g_cutter.height);

    if (isInField(newX, newY))
    {
        console.log("isInField");
        if (!g_cutterTracker.isTracked)
        {
            // append previous point:
            g_cutterTracker.appendPoint(Qt.point(g_cutter.x, g_cutter.y));
            g_cutterTracker.isTracked = true;
        }
        g_cutterTracker.appendPoint(Qt.point(newX, newY));
    }
    else
    {
        console.log("Not isInField");
        if (g_cutterTracker.isTracked)
        {
            g_cutterTracker.appendPoint(Qt.point(newX, newY));
            g_cutterTracker.isTracked = false;

            // SHOW ALL points:
            console.log("Points :")
            for (var i=0; i<g_cutterTracker.nbOfPoints();i++)
            {
                var p = g_cutterTracker.getPoint(i);
                console.log(p.x + ", " + p.y);
            }
            // SHOW ALL points:

            // Draw the cutting line on the Field


            // cut a part ...

            // clear points:
            g_cutterTracker.clear();
        }
    }
    g_cutter.x = newX;
    g_cutter.y = newY;







}

