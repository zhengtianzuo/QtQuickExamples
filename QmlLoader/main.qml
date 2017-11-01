/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Window{
    width: 400
    height: 300
    visible: true
    flags: Qt.Window | Qt.WindowStaysOnTopHint
	title: qsTr("QmlLoader")

    Text{
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("主页面")
    }

    Button{
        height: 32
        width: 60
        anchors.centerIn: parent
        text: qsTr("下一页")
        onClicked: changePage();
    }

    Button{
        height: 32
        width: 32
        text: "X"
        anchors.right: parent.right
        anchors.rightMargin: 4
        anchors.top: parent.top
        anchors.topMargin: 4
        onClicked: {
            Qt.quit()
        }
    }

    Loader{
        id: pageLoader
    }

    function changePage(){
        pageLoader.source = "Page1.qml"
        close();
    }
}
