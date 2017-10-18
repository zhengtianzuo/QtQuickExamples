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
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml签名修改")

    function subEditingFinished()
    {
        if (textFieldback.visible !== true) return;
        textFieldback.visible = false
        textField.focus = false
        textMetrics.text = textField.text
        textField.text = textMetrics.elidedText
        console.debug("textMetrics.elidedText: ", textMetrics.elidedText);
        console.debug("textMetrics.text: ", textMetrics.text);
        console.debug("textField.text: ", textField.text);
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            subEditingFinished();
        }
    }

    TextMetrics {
        id: textMetrics
        elide: Text.ElideRight
        elideWidth: textField.width - 12
        text: qsTr("123这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字")
    }

    TextField{
        id: textField
        text: textMetrics.elidedText
        height: 32
        width: 120
        anchors.centerIn: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment:Text.AlignLeft
        selectByMouse: true

        background: Rectangle {
            id: textFieldback
            implicitWidth: 120
            implicitHeight: 32
            border.color:  "#CCCCCC"
            visible: false
        }

        onPressed:{
            textFieldback.visible = true
            textField.text = textMetrics.text
            console.debug("textMetrics.text: ", textMetrics.text);
        }

        onEditingFinished :{
            subEditingFinished();
        }
    }
}
