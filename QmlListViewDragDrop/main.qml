/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml列表项拖放")

    ListModel {
        id: listModel

        ListElement {
            text: qsTr("111222333随便的一些内容")
        }
        ListElement {
            text: qsTr("AAABBBCCC随便的一些内容")
        }
        ListElement {
            text: qsTr("DDDEEEFFF随便的一些内容")
        }
        ListElement {
            text: qsTr("GGGHHHIII随便的一些内容")
        }
        ListElement {
            text: qsTr("JJJKKKLLL随便的一些内容")
        }
    }

    ListView{
        id: listview
        width: parent.width
        height: parent.height
        anchors.fill: parent
        model: listModel
        delegate: listDelegate
        interactive: false
    }

    Component{
        id: listDelegate
        Rectangle{
            property int fromIndex: 0
            property int toIndex: 0

            id: listItem
            width: parent.width
            height: 30

            Text {
                id: label
                font.family: "microsoft yahei"
                font.pointSize: 12
                height: parent.height
                width: parent.width
                text: model.text
                color: "#148014"
                verticalAlignment: Text.AlignVCenter
            }
            Rectangle{
                color: "#AAAAAA"
                height: 1
                width: parent.width
                anchors.bottom: parent.bottom
            }
            MouseArea {
                id: mousearea
                anchors.fill: parent
                onPressed: {
                    listview.currentIndex = index;
                    listItem.fromIndex = index;
                    label.color = "#4040FF"
                }
                onReleased: {
                    label.color = "#148014"
                    console.debug("fromIndex: ", listItem.fromIndex, "toIndex: ", listItem.toIndex);
                }
                onMouseYChanged: {
                    var lastIndex = listview.indexAt(mousearea.mouseX + listItem.x,
                                                     mousearea.mouseY + listItem.y);
                    if ((lastIndex < 0) || (lastIndex > listModel.rowCount()))
                        return;
                    if (index !== lastIndex){
                        listModel.move(index, lastIndex, 1);
                    }
                    listItem.toIndex = lastIndex;
                }
            }
        }
    }
}
