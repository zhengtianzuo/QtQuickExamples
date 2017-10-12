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

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml自定义等待指示器")

    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: parent
        implicitWidth: 96
        implicitHeight: 96
        opacity: running ? 0.0 : 1.0
        contentItem: QmlBusyIndicator{}
    }

    MouseArea{
        anchors.fill: parent
        onClicked: busyIndicator.running = !busyIndicator.running
    }
}
