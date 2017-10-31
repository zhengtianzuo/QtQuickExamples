/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml进度条")

    QmlProgress {
        id: cProgress
        anchors.centerIn: parent
    }

    Button{
        id: btnStart
        anchors.horizontalCenter: cProgress.horizontalCenter
        anchors.top: cProgress.bottom
        anchors.topMargin: 6
        text: cProgress.isRunning() ? qsTr("结束") : qsTr("开始")
        onClicked: {
            if (cProgress.isRunning()){
                cProgress.onStop();
            }else{
                cProgress.onStart();
            }
        }
    }
}
