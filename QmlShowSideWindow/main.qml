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

ApplicationWindow {
    id: root
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml弹出右侧信息弹窗")

    Image {
        id: image
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.top: parent.top
        anchors.topMargin: 12
        height: 36
        width: 36
        source: "qrc:/Face.png"
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                overTimer.stop();
                if (subWindow.visible === true) return;
                subWindow.opacity = 0.0;
                subWindow.visible = true;
                downAnimation.start();
                showAnimation.start();
            }
            onExited: {
                overTimer.start();
            }
        }
    }

    Button{
        text: qsTr("X")
        anchors.top: parent.top
        anchors.right: parent.right
        height: 32
        width: 32
        MouseArea{
            anchors.fill: parent
            onClicked: {Qt.quit()}
        }
    }

    Timer{
        id: overTimer
        interval: 1000
        repeat: false
        onTriggered: {
            upAnimation.start();
            hideAnimation.start();
        }
    }

    PropertyAnimation{
        id: showAnimation
        target: subWindow
        properties:"opacity"
        from: 0.0
        to: 1.0
        duration: 500
    }

    PropertyAnimation{
        id: hideAnimation
        target: subWindow
        properties:"opacity"
        from: 1.0
        to: 0.0
        duration: 300
        onStopped: {
            subWindow.visible = false;
        }
    }

    PropertyAnimation{
        id: downAnimation
        target: subWindow
        properties:"y"
        from: root.y
        to: root.y + 24
        duration: 300
    }

    PropertyAnimation{
        id: upAnimation
        target: subWindow
        properties:"y"
        from: root.y + 24
        to: root.y
        duration: 300
    }

    QmlShowSideWindow{
        id: subWindow
        visible: false
        x: root.x + root.width + 12
        y: root.y + 24
        height: 200
        width: 200
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                overTimer.stop();
            }
            onExited: {
                overTimer.start();
            }
        }
    }
}
