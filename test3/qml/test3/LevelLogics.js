

function generateLevel(levelNumber)
{
    var level = null;
    level = Tools.createQmlObject("Level.qml", gameScreen)
    if (level == null)
        return level;

    readLevelFile("C:/VFomin_folder/PISE_project/MyExamples/quick/test3/data/levels.txt")

    if (levelNumber === 1)
    {
        level.counter=levelNumber;
        level.controlPoints=getCPsLevelOne(level.width, level.height);
    }
    else if (levelNumber === 2)
    {
        level.counter=levelNumber;
        level.controlPoints=getCPsLevelTwo(level.width, level.height);
    }
    return level;
}

function getCPsLevelOne(width, height)
{
    var cps = new Array(5);

    cps[0] = Qt.point(width*0.25, height*0.5);
    cps[1] = Qt.point(width*0.37, height*0.37);
    cps[2] = Qt.point(width*0.5, height*0.25);
    cps[3] = Qt.point(width*0.5, height*0.5);
    cps[4] = Qt.point(width*0.5, height*0.75);

    return cps;
}

function getCPsLevelTwo(width, height)
{
    var cps = new Array(6);

    cps[0] = Qt.point(width*0.25, height*0.5);
    cps[1] = Qt.point(width*0.37, height*0.25);
    cps[2] = Qt.point(width*0.62, height*0.25);
    cps[3] = Qt.point(width*0.75, height*0.5);
    cps[4] = Qt.point(width*0.25, height*0.75);
    cps[5] = Qt.point(width*0.75, height*0.75);

    return cps;
}


function readLevelFile(filename)
{
    var data;
    var xhr = new XMLHttpRequest;
    xhr.open("GET", filename);
    xhr.send();
    xhr.onreadystatechange = function(){
        if (xhr.readyState == XMLHttpRequest.DONE)
        {
            var d = xhr.responseText.toString()
            console.log(xhr.responseText.toString())
        }
    }

    return data;
}




function showLevelIsComplete()
{

    var messageBox = Tools.createQmlObject("MessageBox.qml", gameScreen)
    if (messageBox == null)
        return messageBox;

    messageBox.visible=true;

}
