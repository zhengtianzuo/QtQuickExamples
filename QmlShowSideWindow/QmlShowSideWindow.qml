/*!
 *@file QmlShowSideWindow.qml
 *@brief Qml弹出右侧信息弹窗
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

Window {
    flags: Qt.FramelessWindowHint
    color: "#AAAAAA"

    Text {
        id: info
        text: qsTr("显示信息")
    }
}
