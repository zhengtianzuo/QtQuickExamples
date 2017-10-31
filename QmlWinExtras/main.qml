/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtWinExtras 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("QmlWinExtras")

    TaskbarButton {
        property real proValue: 0
        property alias interval: timer.interval

        function isRunning(){
            return(timer.running)
        }

        function onStart(){
            taskbar.proValue = 0;
            timer.running = true;
        }

        function onStop(){
            timer.running = false;
        }

        id: taskbar
        overlay.iconSource: "qrc:/logo.ico"
        overlay.accessibleDescription: qsTr("加载中...")
        progress.visible: (progress.value != 0)
        progress.value: taskbar.proValue

        Timer{
            id: timer
            running: false
            repeat: true
            interval: 20
            onTriggered:{
                taskbar.proValue++;
                if (taskbar.proValue > 100){
                    taskbar.onStop();
                    return;
                }
            }
        }
    }

    Button{
        id: btnTaskbar
        height: 24
        width: 120
        anchors.centerIn: parent
        text: taskbar.isRunning() ? qsTr("结束") : qsTr("开始")
        onClicked: {
            if (taskbar.isRunning()){
                taskbar.onStop();
            }else{
                taskbar.onStart();
            }
        }
    }

    ThumbnailToolBar {
        ThumbnailToolButton {
            iconSource: "qrc:/Chat_MsgRecordG.svg"
            tooltip: qsTr("消息")
        }
        ThumbnailToolButton {
            iconSource: "qrc:/Chat_FriendManagerG.svg"
            tooltip: qsTr("联系人")
        }
        ThumbnailToolButton {
            iconSource: "qrc:/Mobile_FindG.svg"
            tooltip: qsTr("发现")
        }
        ThumbnailToolButton {
            iconSource: "qrc:/Main_P2PChatG.svg"
            tooltip: qsTr("我")
            onClicked: {
                Qt.quit()
            }
        }
    }
}
