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
import QtQuick.Window 2.2

ApplicationWindow {
    id: frmWindow
    visible: true
    width: 300
    height: 400
    title: qsTr("Qml底部导航")

    footer: TabBar {
        id: bar
        height: 48
        width: parent.width
        currentIndex: 0

        ListModel {
            id: myModel
            ListElement { modelText: "消息"; modelSrc: "qrc:/Chat_MsgRecord.svg"; modelSrcG: "qrc:/Chat_MsgRecordG.svg";}
            ListElement { modelText: "联系人"; modelSrc: "qrc:/Chat_FriendManager.svg"; modelSrcG: "qrc:/Chat_FriendManagerG.svg";}
            ListElement { modelText: "发现"; modelSrc: "qrc:/Mobile_Find.svg"; modelSrcG: "qrc:/Mobile_FindG.svg";}
            ListElement { modelText: "我"; modelSrc: "qrc:/Main_P2PChat.svg"; modelSrcG: "qrc:/Main_P2PChatG.svg";}
        }

        Repeater {
            model: myModel

            TabButton {
                height: bar.height
                contentItem:Text{
                    text: modelText
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    color: (model.index === bar.currentIndex) ? "#148014" : "#000000"
                }
                background:Image{
                    width: 24
                    height: 24
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: (model.index === bar.currentIndex) ? modelSrcG : modelSrc
                }
            }
        }
    }

    SwipeView {
        id: view
        height: frmWindow.height - bar.height
        width: parent.width
        currentIndex: bar.currentIndex

        Rectangle{
            Text {
                text: qsTr("消息")
                anchors.centerIn: parent
            }
        }
        Rectangle{
            Text {
                text: qsTr("联系人")
                anchors.centerIn: parent
            }
        }
        Rectangle{
            Text {
                text: qsTr("发现")
                anchors.centerIn: parent
            }
        }
        Rectangle{
            Text {
                text: qsTr("我")
                anchors.centerIn: parent
            }
        }
    }
}
