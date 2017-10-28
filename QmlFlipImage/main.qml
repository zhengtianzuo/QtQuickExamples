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
    id: root
    visible: true
    width: 400
    height: 400
    title: qsTr("Qml翻转效果")

    Flipable{
        id: flip
        width: 300
        height: 300
        anchors.centerIn: parent

        property bool flipped: false

        front:Image{
            anchors.fill: parent
            source: "qrc:/images/1.jpg"
        }

        back:Image{
            anchors.fill: parent
            source: "qrc:/images/2.jpg"
        }

        transform: Rotation{
            id: rotation
            origin.x: flip.width / 2
            origin.y: flip.height / 2
            axis.x: rx.checked
            axis.y: ry.checked
            axis.z: rz.checked
            angle: 0
        }

        states:State{
            PropertyChanges {
                target: rotation
                angle:180
            }
            when:flip.flipped
        }

        transitions: Transition{
            NumberAnimation{
                target:rotation
                properties: "angle"
                duration:1000
            }
        }
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6

        RadioButton{
            id: rx
            height: 24
            text: qsTr("X轴")
            checked: true
        }

        RadioButton{
            id: ry
            height: 24
            text: qsTr("Y轴")
        }

        RadioButton{
            id: rz
            height: 24
            text: qsTr("Z轴")
        }
        Button{
            height: 24
            text: qsTr("翻转")
            onClicked: flip.flipped = !flip.flipped
        }
    }
}
