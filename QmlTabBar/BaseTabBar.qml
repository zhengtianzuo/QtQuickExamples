/*!
 *@file BaseTabBar.qml
 *@brief 自定义TabBar
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

TabBar {
    property alias myModel: myModel


    id: bar
    height: 48
    width: parent.width
    currentIndex: 0

    ListModel {
        id: myModel
//        ListElement { modelText: "消息"; modelColor: "#000000"; modelColorG: "#148014"; modelSrc: "qrc:/Chat_MsgRecord.svg"; modelSrcG: "qrc:/Chat_MsgRecordG.svg";}
//        ListElement { modelText: "联系人"; modelColor: "#000000"; modelColorG: "#148014"; modelSrc: "qrc:/Chat_FriendManager.svg"; modelSrcG: "qrc:/Chat_FriendManagerG.svg";}
//        ListElement { modelText: "发现"; modelColor: "#000000"; modelColorG: "#148014"; modelSrc: "qrc:/Mobile_Find.svg"; modelSrcG: "qrc:/Mobile_FindG.svg";}
//        ListElement { modelText: "我"; modelColor: "#000000"; modelColorG: "#148014"; modelSrc: "qrc:/Main_P2PChat.svg"; modelSrcG: "qrc:/Main_P2PChatG.svg";}
    }

    Repeater {
        model: myModel

        TabButton {
            height: bar.height
            contentItem:Text{
                text: modelText
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                color: (model.index === bar.currentIndex) ? modelColorG : modelColor
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
