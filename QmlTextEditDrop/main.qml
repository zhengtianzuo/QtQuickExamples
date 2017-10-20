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
    width: 640
    height: 480
    title: qsTr("QmlTextEdit接受拖放")

    TextEdit{
        id: textEdit
        height: 300
        width: parent.width
        DropArea{
            anchors.fill: parent
            onDropped: {
                if (drop.hasUrls){
                    console.debug("拖放了文件: " + drop.urls.length);
                    for(var i = 0; i < drop.urls.length; i++){
                        console.debug("文件: " + drop.urls[i]);
                        textEdit.append("文件: " + drop.urls[i])
                    }
                }
                else if (drop.hasText){
                    console.debug("拖放了本文: " + drop.text.length);
                    console.debug("文本: " + drop.text);
                    textEdit.append("文本: " + drop.text)
                }
            }
        }
    }
}
