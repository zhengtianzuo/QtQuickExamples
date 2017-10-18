/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Window 2.0

Window {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml旋转箭头")

    property bool isDown : false

    Image {
        id: image
        height: 24
        width: 24
        anchors.centerIn: parent
        source: "qrc:/image.png"

        MouseArea{
            anchors.fill: parent
            onClicked:{
                if (rotationAnimation.running === true) return;
                rotationAnimation.start();
            }
        }
    }
    RotationAnimation{
        id: rotationAnimation
        target: image
        from: 0
        to: 90
        duration: 100
        onStopped: {
            if (isDown === true)
            {
                rotationAnimation.from = 0;
                rotationAnimation.to = 90;
            }
            else
            {
                rotationAnimation.from = 90;
                rotationAnimation.to = 0;
            }
            isDown = !isDown;
        }
    }
}
