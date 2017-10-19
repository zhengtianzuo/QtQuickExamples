/*!
 *@file Page3.qml
 *@brief Page3
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.8
import QtQuick.Controls 2.1

Page {
    id: frmWindow
    title: qsTr("帐号")
    visible: true

    property StackView stack: null

    Button {
        height: 32
        width: 120
        text: "<-"
        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: stack.pop()
    }

    Label{
        id: label
        text: qsTr("帐号")
        height: 80
        width: 240
        anchors.centerIn: parent
        font.pixelSize: 20
    }

    Label{
        anchors.top: label.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("帐号信息")
        height: 80
        width: 240
        font.pixelSize: 20
    }
}
