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
    id:mainWidnow
    title: qsTr("Qml圆形图片")
    width: 400
    height: 300
    visible: true

    Item {
        width: 96
        height: 96
        anchors.centerIn: parent
        Image {
            id: sourceimage
            source: "qrc:/qt.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: false
        }

        Rectangle {
            id: mask
            width: parent.width
            height: parent.height
            radius: height/2
            color:"red"
            visible: false

        }

        OpacityMask {
            anchors.fill: sourceimage
            source: sourceimage
            maskSource: mask
        }
    }
}
