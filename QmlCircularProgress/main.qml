/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml圆形进度条")

    QmlCircularProgress{
        id: cProgress
        anchors.centerIn: parent
        arcWidth: 3
        radius: 100
        interval: 1
        arcColor: "#148014"
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
