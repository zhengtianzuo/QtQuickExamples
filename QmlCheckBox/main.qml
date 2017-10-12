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
    title: qsTr("Qml自定义复选框")

    CheckBox {
        id: checkBox
        text: qsTr("复选框")
        checked: true
        anchors.centerIn: parent
        spacing: 0
        enabled: true

        indicator:
        Image {
              id: image
              height: 16
              width: 16
              anchors.verticalCenter: parent.verticalCenter
              source: checkBox.checked ? "qrc:/images/checked.png" : "qrc:/images/unchecked.png"
        }

        contentItem: Text {
            id: text
            text: checkBox.text
            font: checkBox.font
            opacity: enabled ? 1.0 : 0.3
            color: checkBox.down ? "#AA0000" : "#148014"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            leftPadding: checkBox.indicator.width + checkBox.spacing
        }
    }
}
