/*!
 *@file QmlPageNavigation.qml
 *@brief Qml分页显示
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0

Row{
    id: pageNavigation
    property int nCout: 1
    property int nCurPage: 1
    property int nPageSize: 1

    signal sCurPage(int curPage);

    Rectangle{
        id: prevPage
        height: 24
        width: 60
        color: "#EEEEEE"
        border.color: "#AAAAAA"
        border.width: 1
        Row{
            anchors.centerIn: parent
            Image{
                height: 16
                width: 16
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/arrow.png"
                rotation: -180
            }
            Text {
                font.family: "microsoft yahei"
                font.pixelSize: 12
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("上一页")
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if (pageNavigation.nCurPage > 1) pageNavigation.nCurPage--;
            }
        }
    }

    Repeater{
        id: repeater
        model: pageNavigation.nPageSize
        delegate: Rectangle{
            property int nCurIndex: (pageNavigation.nCurPage-1)*pageNavigation.nPageSize + index + 1
            property bool hasPage: nCurIndex <= pageNavigation.nCout

            height: 24
            width: 24
            color: hasPage ? "#EEEEEE" : "transparent"
            border.color: "#AAAAAA"
            border.width: hasPage ? 1 : 0
            Text {
                font.family: "microsoft yahei"
                font.pixelSize: 12
                anchors.centerIn: parent
                text: nCurIndex
                visible: hasPage ? true : false
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: hasPage
                onEntered: {
                    parent.color = "#148014"
                }
                onExited: {
                    parent.color = "#EEEEEE"
                }
                onPressed: {
                    emit: sCurPage(nCurIndex);
                }
            }
        }
    }

    Rectangle{
        id: nextPage
        height: 24
        width: 60
        color: "#EEEEEE"
        border.color: "#AAAAAA"
        border.width: 1
        Row{
            anchors.centerIn: parent
            Text {
                font.family: "microsoft yahei"
                font.pixelSize: 12
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("下一页")
            }
            Image{
                height: 16
                width: 16
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/arrow.png"
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if (pageNavigation.nCurPage*pageNavigation.nPageSize <= pageNavigation.nCout) pageNavigation.nCurPage++;
            }
        }
    }
}
