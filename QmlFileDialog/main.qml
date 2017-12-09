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
import Qt.labs.platform 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml文件对话框")


    Column{
        anchors.centerIn: parent

        Button{
            text: qsTr("打开文件")
            height: 48
            width: 120
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fileDialog1.open()
                }
            }
        }
        Button{
            text: qsTr("打开多个文件")
            height: 48
            width: 120
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fileDialog2.open()
                }
            }
        }
        Button{
            text: qsTr("保存文件")
            height: 48
            width: 120
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fileDialog3.open()
                }
            }
        }
    }

    FileDialog {
        id: fileDialog1
        fileMode: FileDialog.OpenFile
        nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
        options :FileDialog.ReadOnly
    }
    FileDialog {
        id: fileDialog2
        fileMode: FileDialog.OpenFiles
        nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
        options :FileDialog.ReadOnly
    }
    FileDialog {
        id: fileDialog3
        nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
        fileMode: FileDialog.SaveFile
    }
}
