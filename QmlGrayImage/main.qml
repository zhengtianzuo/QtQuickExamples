/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml图片转灰度")

    Row{
        anchors.centerIn: parent

        Image {
            id: source
            source: "qrc:/1.png"
            smooth: true
        }

        Image {
            id: target
            source: "qrc:/1.png"
            smooth: true
            Desaturate {
                anchors.fill: parent
                source: parent
                desaturation: 1.0
            }
        }
    }
}
