/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml拖放")

    Text{
        id: sourceLabel
        anchors.left: parent.left
        anchors.leftMargin: 120
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("这是一段文字")

        Drag.active: dragArea.drag.active;
        Drag.supportedActions: Qt.CopyAction;
        Drag.dragType: Drag.Automatic;
        Drag.mimeData: {"text": text};

        MouseArea {
            id: dragArea;
            anchors.fill: parent;
            drag.target: parent;
        }
    }

    Rectangle{
        anchors.left: sourceLabel.left
        anchors.top: sourceLabel.bottom
        anchors.topMargin: 20
        border.color: "#AAAAAA"
        border.width: 1
        height: 25
        width: 100

        TextEdit{
            id: targetEdit
            height: parent.height-2
            width: parent.width-2
            anchors.centerIn: parent
            text: qsTr("")

            DropArea {
                id: dropContainer
                anchors.fill: parent;
                onDropped: {
                    if (drop.supportedActions == Qt.CopyAction){
                        targetEdit.text = drop.getDataAsString("text")
                    }
                }
            }
        }
    }

    Image{
        id: sourceImage
        height: 36
        width: 36
        anchors.right: parent.right
        anchors.rightMargin: 120
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Face.png"

        Drag.active: dragArea1.drag.active;
        Drag.supportedActions: Qt.CopyAction;
        Drag.dragType: Drag.Automatic;
        Drag.mimeData: {"pic": source};

        MouseArea {
            id: dragArea1;
            anchors.fill: parent;
            drag.target: parent;
        }
    }

    Rectangle{
        anchors.left: sourceImage.left
        anchors.top: sourceLabel.bottom
        anchors.topMargin: 20
        border.color: "#AAAAAA"
        border.width: 1
        height: 36
        width: 36

        Image{
            id: targetImage
            height: parent.height-2
            width: parent.width-2
            anchors.centerIn: parent

            DropArea {
                id: dropContainer1
                anchors.fill: parent;
                onDropped: {
                    if (drop.supportedActions == Qt.CopyAction){
                        targetImage.source = drop.getDataAsString("pic")
                    }
                }
            }
        }
    }
}
