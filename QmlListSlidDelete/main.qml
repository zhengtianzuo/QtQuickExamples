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
    title: qsTr("Qml滑动删除")

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
    }

    Component{
        id: listDelegate
        Rectangle{
            id: listItem
            width: parent.width
            height: 30

            Text {
                id: text
                font.family: "microsoft yahei"
                font.pointSize: 12
                height: parent.height
                width: parent.width - delBtn.width
                text: model.text
                color: "green"
                verticalAlignment: Text.AlignVCenter
                MouseArea{
                    property point clickPos: "0,0"

                    anchors.fill: parent
                    onPressed: {
                        clickPos  = Qt.point(mouse.x,mouse.y);
                    }
                    onReleased: {
                        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                        console.debug("delta.x: " + delta.x);
                        if ((delta.x < 0) && (aBtnShow.running === false) && (delBtn.width == 0)){
                            aBtnShow.start();
                        }else if (aBtnHide.running === false && (delBtn.width > 0)){
                            aBtnHide.start();
                        }
                    }
                }
            }
            Rectangle{
                color: "#AAAAAA"
                height: 1
                width: parent.width
                anchors.bottom: parent.bottom
            }
            Rectangle{
                id: delBtn
                height: parent.height
                width: 0
                color: "#EE4040"
                anchors.right: parent.right
                Text {
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    anchors.centerIn: parent
                    text: qsTr("删除")
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listview.model.remove(index);
                    }
                }
            }
            PropertyAnimation{
                id: aBtnShow
                target: delBtn
                property: "width"
                duration: 100
                from: 0
                to: 60
            }
            PropertyAnimation{
                id: aBtnHide
                target: delBtn
                property: "width"
                duration: 100
                from: 60
                to: 0
            }
        }
    }
}
