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
    height: 400
    title: qsTr("Qml超链接")

    Rectangle {
        width: 200
        height: 200
        anchors.centerIn: parent
        color: "lightblue"

        Text {
            anchors.centerIn: parent
            text: '<html></style><a href="http://www.baidu.com">点击</a></html>'
            MouseArea {
               anchors.fill: parent;
               hoverEnabled: true;
               cursorShape:
                   (containsMouse? Qt.PointingHandCursor: Qt.ArrowCursor);
               onClicked: Qt.openUrlExternally("http://www.baidu.com")
           }
        }

    }
}
