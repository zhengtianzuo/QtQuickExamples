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
    visible: true
    width: 400
    height: 300
    title: qsTr("QmlCanvas文字")

    Canvas{
        id: canvas
        width: 300
        height: 100
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "red";
            ctx.font = fontMetrics.getFontToContext2D();

            ctx.beginPath();
            ctx.text(qsTr("Canvas 这是一段文字"), 20, 40);
            ctx.fill();
        }
    }

    Text{
        id: text
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 60
        font: fontMetrics.font
        color: "red"
        text: qsTr("Text 这是一段文字")
    }

    FontMetrics {
        id: fontMetrics
        font.family: "Microsoft Yahei"
        font.pixelSize: 16
        font.italic: false
        font.bold: false

        function getFontToContext2D() {
            var cssFontString = "";
            if(fontMetrics.font.italic) {
                cssFontString += "italic ";
            } else {
                cssFontString += "normal ";
            }

            if(fontMetrics.font.bold) {
                cssFontString += "bold ";
            } else {
                cssFontString += "normal ";
            }

            cssFontString += (fontMetrics.font.pixelSize+"px ");
            cssFontString += fontMetrics.font.family;
            return cssFontString;
        }
    }
}
