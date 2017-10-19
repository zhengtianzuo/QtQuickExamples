/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.8
import QtQuick.Controls 2.1

ApplicationWindow {
    id: frmWindow
    title: qsTr("Qml堆栈窗体")
    width: 400
    height: 300
    visible: true

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
    }

    Page {
        id: mainView

        Label{
            text: qsTr("主页")
            height: 80
            width: 240
            anchors.centerIn: parent
            font.pixelSize: 20
        }
        Button {
            height: 32
            width: 120
            text: qsTr("设置")
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            onClicked: {
                page1.visible = true;
                page1.stack = stack;
                stack.push(page1)
            }
        }
    }

    Page1 {
        id: page1
        visible: false
    }
}
