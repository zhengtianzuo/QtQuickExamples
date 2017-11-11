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
    title: qsTr("Qml使用FontAwesome")

    Row{
        anchors.centerIn: parent
        spacing: 20

        Text{
            color: Qt.rgba(0, 160, 230, 1.0)
            font.family: "FontAwesome"
            font.pixelSize: 20
            text: "\uf00e"
        }
        Text{
            color: "green"
            font.family: "FontAwesome"
            font.pixelSize: 30
            text: "\uf004"
        }
    }
}
