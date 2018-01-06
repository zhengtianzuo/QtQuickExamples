/*!
 *@file QmlFontList.qml
 *@brief Qml获取字体列表
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

Window{
    id: fontList
    visible: false
    flags: Qt.Window | Qt.FramelessWindowHint

    signal sClick(string sFontName);

    ListView{
        id: listView
        height: contentHeight
        width: parent.width - vbar.width
        y: -vbar.position * listView.height
        model: Qt.fontFamilies()
        delegate: Item {
            height: 32
            width: parent.width

            Rectangle{
                id: fontSelect
                height: 24
                width: parent.width

                Text {
                    id: txtShow
                    anchors.left: parent.left
                    anchors.leftMargin: 6
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Select Font 选择字体")
                    font.family: modelData
                    font.pixelSize: 14
                }

                Text {
                    id: txtFont
                    anchors.left: txtShow.right
                    anchors.leftMargin: 6
                    anchors.verticalCenter: txtShow.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    text: modelData
                    font.pixelSize: 14
                }
            }

            Rectangle {
                height: 2
                width: parent.width
                anchors.top: fontSelect.bottom
                color: "#148014"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    emit: sClick(modelData);
                    fontList.visible = false;
                }
            }
        }
    }
    ScrollBar {
        id: vbar
        hoverEnabled: true
        active: hovered || pressed
        orientation: Qt.Vertical
        size: parent.height / listView.height
        width: 10
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
