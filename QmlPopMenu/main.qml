/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

ApplicationWindow {
    id: root
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml弹出菜单")

    MouseArea{
        anchors.fill: parent
        onClicked:{
            window.visible = false
        }
    }

    Image {
        id: image
        source: "qrc:/images/online.png"
        anchors.centerIn: parent
        MouseArea{
            id: mouseArea
            anchors.fill: parent;
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked:{
                if (mouse.button === Qt.LeftButton) {
                    window.visible = true
                    menu.open();
                }
                if (mouse.button === Qt.RightButton) {
                    window.visible = false
                }
            }
        }
    }

    Window{
        id: window
        width: 80
        height: menu.height
        flags: Qt.FramelessWindowHint
        x: root.x + image.x + 16
        y: root.y + image.y + 16

        Menu{
            id: menu

            MenuItem {
                id: menuItem1
                anchors.left: parent.left
                anchors.leftMargin: 6
                text: qsTr("在线")
                height: 24
                indicator:
                Image {
                    id: image1
                    height: 16
                    width: 16
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/images/online.png"
                }
                contentItem: Text {
                    id: text1
                    text: menuItem1.text
                    font: menuItem1.font
                    opacity: enabled ? 1.0 : 0.3
                    color: menuItem1.down ? "#AA0000" : "#148014"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: menuItem1.indicator.width
                }
                onTriggered: {image.source = image1.source;window.visible = false;console.debug("状态切换 在线")}
            }
            MenuItem {
                id: menuItem2
                anchors.left: parent.left
                anchors.leftMargin: 6
                text: qsTr("离开")
                height: 24
                indicator:
                Image {
                    id: image2
                    height: 16
                    width: 16
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/images/away.png"
                }
                contentItem: Text {
                    id: text2
                    text: menuItem2.text
                    font: menuItem2.font
                    opacity: enabled ? 1.0 : 0.3
                    color: menuItem2.down ? "#AA0000" : "#148014"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: menuItem2.indicator.width
                }
                onTriggered: {image.source = image2.source;window.visible = false;console.debug("状态切换 离开")}
            }
            MenuItem {
                id: menuItem3
                anchors.left: parent.left
                anchors.leftMargin: 6
                text: qsTr("忙碌")
                height: 24
                indicator:
                Image {
                    id: image3
                    height: 16
                    width: 16
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/images/busy.png"
                }
                contentItem: Text {
                    id: text3
                    text: menuItem3.text
                    font: menuItem3.font
                    opacity: enabled ? 1.0 : 0.3
                    color: menuItem3.down ? "#AA0000" : "#148014"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: menuItem3.indicator.width
                }
                onTriggered: {image.source = image3.source;window.visible = false;console.debug("状态切换 忙碌")}
            }
            MenuItem {
                id: menuItem4
                anchors.left: parent.left
                anchors.leftMargin: 6
                text: qsTr("隐身")
                height: 24
                indicator:
                Image {
                    id: image4
                    height: 16
                    width: 16
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/images/hide.png"
                }
                contentItem: Text {
                    id: text4
                    text: menuItem4.text
                    font: menuItem4.font
                    opacity: enabled ? 1.0 : 0.3
                    color: menuItem4.down ? "#AA0000" : "#148014"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: menuItem4.indicator.width
                }
                onTriggered: {image.source = image4.source;window.visible = false;console.debug("状态切换 隐身")}
            }
        }
        }
}
