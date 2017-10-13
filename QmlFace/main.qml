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
    height: gridView.cellHeight*5+4*2
    width: gridView.cellWidth*12+4*2
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    ListModel {
        id: listModel
    }

    Component{
        id: baseListDelegate

        Item {
            id: delegateItem
            height: gridView.cellHeight
            width: gridView.cellWidth

            Rectangle{
                id: delegateItemBack
                anchors.fill: parent
                color : "#AAAAAA"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        delegateItem.GridView.view.currentIndex = model.index;
                    }
                }

                Image {
                    id: image
                    anchors.centerIn: parent
                    source: face
                    width: 32
                    height: 32
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.debug(qsTr("选择的名称: ") + face)
                            close()
                        }
                    }
                }
            }

            states: [
                State {
                    name: "isCurrentItem"
                    when: delegateItem.GridView.isCurrentItem
                    PropertyChanges {
                        target: delegateItemBack; color : "#AAAAAA";
                    }
                },
                State {
                    name: "isNotCurrentItem"
                    when: !delegateItem.GridView.isCurrentItem
                    PropertyChanges {
                        target: delegateItemBack; color : "transparent";
                    }
                }
            ]
        }
    }

    GridView {
        id: gridView
        anchors.margins: 4
        anchors.fill: parent
        clip: true
        cellWidth: 40
        cellHeight: 40
        model: listModel
        delegate: baseListDelegate
        boundsBehavior: Flickable.StopAtBounds

        Component.onCompleted: {
            listModel.append({"face" : "emoji/Face_(0).png"})
            listModel.append({"face" : "emoji/Face_(1).png"})
            listModel.append({"face" : "emoji/Face_(2).png"})
            listModel.append({"face" : "emoji/Face_(3).png"})
            listModel.append({"face" : "emoji/Face_(4).png"})
            listModel.append({"face" : "emoji/Face_(5).png"})
            listModel.append({"face" : "emoji/Face_(6).png"})
            listModel.append({"face" : "emoji/Face_(7).png"})
            listModel.append({"face" : "emoji/Face_(8).png"})
            listModel.append({"face" : "emoji/Face_(9).png"})
            listModel.append({"face" : "emoji/Face_(10).png"})
            listModel.append({"face" : "emoji/Face_(11).png"})
            listModel.append({"face" : "emoji/Face_(12).png"})
            listModel.append({"face" : "emoji/Face_(13).png"})
            listModel.append({"face" : "emoji/Face_(14).png"})
            listModel.append({"face" : "emoji/Face_(15).png"})
            listModel.append({"face" : "emoji/Face_(16).png"})
            listModel.append({"face" : "emoji/Face_(17).png"})
            listModel.append({"face" : "emoji/Face_(18).png"})
            listModel.append({"face" : "emoji/Face_(19).png"})
            listModel.append({"face" : "emoji/Face_(20).png"})
            listModel.append({"face" : "emoji/Face_(21).png"})
            listModel.append({"face" : "emoji/Face_(22).png"})
            listModel.append({"face" : "emoji/Face_(23).png"})
            listModel.append({"face" : "emoji/Face_(24).png"})
            listModel.append({"face" : "emoji/Face_(25).png"})
            listModel.append({"face" : "emoji/Face_(26).png"})
            listModel.append({"face" : "emoji/Face_(27).png"})
            listModel.append({"face" : "emoji/Face_(28).png"})
            listModel.append({"face" : "emoji/Face_(29).png"})
            listModel.append({"face" : "emoji/Face_(30).png"})
            listModel.append({"face" : "emoji/Face_(31).png"})
            listModel.append({"face" : "emoji/Face_(32).png"})
            listModel.append({"face" : "emoji/Face_(33).png"})
            listModel.append({"face" : "emoji/Face_(34).png"})
            listModel.append({"face" : "emoji/Face_(35).png"})
            listModel.append({"face" : "emoji/Face_(36).png"})
            listModel.append({"face" : "emoji/Face_(37).png"})
            listModel.append({"face" : "emoji/Face_(38).png"})
            listModel.append({"face" : "emoji/Face_(39).png"})
            listModel.append({"face" : "emoji/Face_(40).png"})
            listModel.append({"face" : "emoji/Face_(41).png"})
            listModel.append({"face" : "emoji/Face_(42).png"})
            listModel.append({"face" : "emoji/Face_(43).png"})
            listModel.append({"face" : "emoji/Face_(44).png"})
            listModel.append({"face" : "emoji/Face_(45).png"})
            listModel.append({"face" : "emoji/Face_(46).png"})
            listModel.append({"face" : "emoji/Face_(47).png"})
            listModel.append({"face" : "emoji/Face_(48).png"})
            listModel.append({"face" : "emoji/Face_(49).png"})
            listModel.append({"face" : "emoji/Face_(50).png"})
            listModel.append({"face" : "emoji/Face_(51).png"})
            listModel.append({"face" : "emoji/Face_(52).png"})
            listModel.append({"face" : "emoji/Face_(53).png"})
            listModel.append({"face" : "emoji/Face_(54).png"})
            listModel.append({"face" : "emoji/Face_(55).png"})
            listModel.append({"face" : "emoji/Face_(56).png"})
        }
    }
}
