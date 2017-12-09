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
import Qt.labs.platform 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml选择颜色对话框")
    color: colorDialog.color

    Button{
        text: qsTr("选择颜色")
        height: 48
        width: 120
        anchors.centerIn: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {
                colorDialog.open();
            }
        }
    }

    ColorDialog {
        id: colorDialog
        title: qsTr("选择颜色")
        color: "#AAAAAA"
    }
}
