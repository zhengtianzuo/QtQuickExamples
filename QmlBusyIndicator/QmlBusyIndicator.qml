/*!
 *@file QmlBusyIndicator.qml
 *@brief Qml自定义等待指示器
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {

    Rectangle {
        id: rect
        width: parent.width
        height: parent.height
        color: Qt.rgba(0, 0, 0, 0)
        radius: width / 2
        border.width: width / 6
        visible: false
    }

    ConicalGradient {
        width: rect.width
        height: rect.height
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#80c342" }
            GradientStop { position: 1.0; color: "#006325" }
        }
        source: rect

        Rectangle {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: rect.border.width
            height: width
            radius: width / 2
            color: "#006325"
        }

        RotationAnimation on rotation {
            from: 0
            to: 360
            duration: 800
            loops: Animation.Infinite
        }
    }
}
