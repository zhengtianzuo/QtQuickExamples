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
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml字体选择对话框")

    Button{
        anchors.centerIn: parent
        height: 48
        width: 120
        text: qsTr("打开")
        MouseArea{
            anchors.fill: parent
            onClicked: {
                fontDialog.open()
            }
        }
    }

    FontDialog {
        id: fontDialog
        onAccepted: {
            console.debug(qsTr("选择的字体名称是: ") + fontDialog.currentFont.family)
            console.debug(qsTr("选择的字体大小是: ") + fontDialog.currentFont.pointSize)
        }
    }
}
