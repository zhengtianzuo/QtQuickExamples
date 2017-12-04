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

    footer: BaseTabBar{
        id: bar
        height: 48
        width: parent.width
        Component.onCompleted: {
            myModel.append({ "modelText": "消息", "modelColor": "#000000", "modelColorG": "#148014", "modelSrc": "qrc:/Chat_MsgRecord.svg", "modelSrcG": "qrc:/Chat_MsgRecordG.svg"})
myModel.append({ modelText: "联系人"; modelColor: "#000000"; modelColorG: "#148014"; modelSrc: "qrc:/Chat_FriendManager.svg"; modelSrcG: "qrc:/Chat_FriendManagerG.svg";}
//            ListElement { modelText: "发现"; modelColor: "#000000"; modelColorG: "#148014"; modelSrc: "qrc:/Mobile_Find.svg"; modelSrcG: "qrc:/Mobile_FindG.svg";}
//            ListElement { modelText: "我"; modelColor: "#000000"; modelColorG: "#148014"; modelSrc: "qrc:/Main_P2PChat.svg"; modelSrcG: "qrc:/Main_P2PChatG.svg";}
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
