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
import QtQuick.Window 2.2

Window {
    id: frmWindow
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml全局按键")

    Label{
        id: label
        text: qsTr("文本")
        height: 48
        width: 120
        anchors.centerIn: parent
    }

    function onSKeyBackPress(){
        label.text = qsTr("按下了Backspace")
    }

    function onSKeyBackRelease(){
        label.text = qsTr("松开了Backspace")
    }
}
