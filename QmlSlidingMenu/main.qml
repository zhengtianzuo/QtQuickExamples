/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml侧边滑动菜单")
    property bool bMenuShown: false

    Rectangle {
        anchors.fill: parent
        color: "#AAAAAA";
        opacity: bMenuShown ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 300
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#FFFFFF"
        opacity: bMenuShown ? 0.5 : 1
        Behavior on opacity {
            NumberAnimation {
                duration: 300
            }
        }

        Button {
            width: 48
            height: 48
            text: qsTr("菜单")
            onClicked: onMenu();
        }

        transform: Translate {
            id: menuTranslate
            x: 0
            Behavior on x {
                NumberAnimation {
                    duration: 400;
                    easing.type: Easing.OutQuad
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            enabled: bMenuShown
            onClicked: onMenu();
        }
    }

    function onMenu()
    {
        menuTranslate.x = bMenuShown ? 0 : width * 0.8
        bMenuShown = !bMenuShown;
    }
}
