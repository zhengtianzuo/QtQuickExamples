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
    title: qsTr("Dialog")

    Column{
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 20

        Text {
            id: textLabel
            height: 24
            width: 120
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("TextLabel")
        }
        Button{
            id: pushButton
            height: 24
            width: 120
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("PushButton")
        }

        Column{
            anchors.right: parent.right
            anchors.rightMargin: 20

            RadioButton{
                id: enChk
                text: qsTr("English")
                checked: true
                onClicked: {
                    qmlLanguage.setLanguage(0);
                }
            }
            RadioButton{
                id: cnCHK
                text: qsTr("简体中文")
                onClicked: {
                    qmlLanguage.setLanguage(1);
                }
            }
        }
    }
}
