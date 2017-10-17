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
    id:applicationWindow
    visible: true
    width: 320
    height: 240
    title: qsTr("这是插件")

    Button{
        id:button
        text: qsTr("插件中的按钮")
        height:48
        width:120
        anchors.centerIn: parent
        MouseArea{
            id:mouseArea
            anchors.fill: parent
            onPressed: {
                console.debug(qsTr("点击了插件中的按钮"));
            }
        }
    }
}
