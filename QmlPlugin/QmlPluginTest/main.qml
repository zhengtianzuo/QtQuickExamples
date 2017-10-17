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
    width: 400
    height: 300
    title: qsTr("主窗体")

    Button{
        id:button
        text: qsTr("显示插件")
        height:48
        width:120
        anchors.centerIn: parent
        MouseArea{
            id:mouseArea
            anchors.fill: parent
            onPressed: {
                qmlPluginTest.showWindow();
            }
        }
    }
}
