import QtQuick 2.0

Rectangle {
    width: 360
    height: 360
    gradient: Gradient {
        GradientStop { position: 0.0; color: "lightsteelblue" }
        GradientStop { position: 1.0; color: "white" }
    }


    Component.onCompleted: {
        listModel.append({"name":"Red","colorCode":"red"})
        listModel.append({"name":"<EMPTY>","colorCode":"#00000000"})
    }


    ListView {
        id: listView1
        anchors.fill: parent
        delegate: listDelegate
        model: listModel
    }

    ListModel {
        id: listModel

//        ListElement {
//            name: "Grey"
//            colorCode: "grey"
//        }

    }


    Component {
        id: listDelegate
        Item {
            x: 5
            height: 40
            Row {
                id: row1
                spacing: 10
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                TextInput {
                    text: name
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }

            }
        }
    }



}
