/*
  Tools contain useful functions
*/

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
