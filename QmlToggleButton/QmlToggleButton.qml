/*!
 *@file QmlToggleButton.qml
 *@brief Qml选择开关
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.0

Rectangle {
    id: root
    width: 80
    height: 26
    color: "#EAEAEA"
    radius: 12

    property string leftString
    property string rightString
    signal toggleLeft
    signal toggleRight

    Rectangle {
        id: rect
        width: parent.width * 0.6
        radius: parent.radius
        color: rect.state == "left"? "#4040FF" : "#CCCCCC"
        state: "left"
        anchors {
            top: parent.top
            bottom: parent.bottom
        }

        states: [
            State {
                name: "right"
                PropertyChanges {
                    target: rect
                    x: root.width - rect.width
                }
            }

        ]

        transitions: [
            Transition {
                from: "*"
                to: "*"
                NumberAnimation { property: "x"; duration: 200 }
            }
        ]

        Text {
            id: label
            anchors.centerIn: parent
            text: rect.state == "left"? root.leftString : root.rightString
            color: "white"
            font.pointSize: 10
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            if(rect.state == "left"){
                rect.state = "right";
                root.toggleRight();
            }else {
                rect.state = "left";
                root.toggleLeft();
            }
        }
    }
}
