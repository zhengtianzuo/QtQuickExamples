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
    title: qsTr("Qml圆形进度按钮")

    Rectangle{
        property int btnHeight: 48
        property int btnWidth: 120

        id: cProBtn
        height: btnHeight
        width: btnWidth
        anchors.centerIn: parent
        border.color: "#148014"
        border.width: 2
        radius: 0
        Text{
            id: cText
            anchors.centerIn: parent
            font.family: "microsoft yahei"
            font.pixelSize: 14
            text: qsTr("开始")
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if (rAniStart.running || rAniStop.running) return
                cText.visible = false;
                rAniStart.start();
                widthAniStart.start();
            }
        }
        PropertyAnimation{
            id: rAniStart
            target: cProBtn
            property: "radius"
            duration: 300
            from: 0
            to: cProBtn.btnHeight/2
            onStopped: {
                cProgress.onStart();
                cProgress.visible = true;
            }
        }
        PropertyAnimation{
            id: widthAniStart
            target: cProBtn
            property: "width"
            duration: 300
            from: cProBtn.btnWidth
            to: cProBtn.btnHeight
        }
        QmlCircularProgress{
            id: cProgress
            anchors.centerIn: parent
            visible: false
            arcWidth: 2
            radius: cProBtn.btnHeight/2
            interval: 2
            arcColor: "#148014"
            onSStop: {
                visible = false;
                rAniStop.start();
                widthAniStop.start();
            }
        }
        PropertyAnimation{
            id: rAniStop
            target: cProBtn
            property: "radius"
            duration: 300
            from: cProBtn.btnHeight/2
            to: 0
            onStopped: {
                cText.text = qsTr("完成");
                cText.visible = true;
            }
        }
        PropertyAnimation{
            id: widthAniStop
            target: cProBtn
            property: "width"
            duration: 300
            from: cProBtn.btnHeight
            to: cProBtn.btnWidth
        }
    }
}
