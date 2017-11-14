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
    title: qsTr("Qml分页显示")

    Text {
        id: txtPage
        anchors.centerIn: parent
        font.family: "microsoft yahei"
        font.pixelSize: 20
        text: qsTr("第1页")
    }

    QmlPageNavigation{
        id: pageNavigation
        anchors.left: parent.left
        anchors.leftMargin: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        nCout: 23
        nCurPage: 1
        nPageSize: 5
        onSCurPage: {
            txtPage.text = qsTr("第") + curPage + qsTr("页");
        }
    }
}
