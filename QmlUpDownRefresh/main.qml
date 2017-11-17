/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: root
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml上拉下拉刷新")

    property int nCurUp: 0
    property int nCurDown: 18
    property int nPullHeight: 64

    function funDownRefresh(){
        console.debug(qsTr("启动下刷新..."))
        listView.y = -nPullHeight;

        busyDownRefresh.running = false;
        timerDownRefresh.start();
    }

    BusyIndicator {
        id: busyDownRefresh
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter
        implicitWidth: 48
        implicitHeight: 48
        opacity: running ? 0.0 : 1.0
        contentItem: QmlBusyIndicator{}
    }

    Timer{
        id: timerDownRefresh
        interval: 1000
        repeat: false
        running: false
        onTriggered: {
            busyDownRefresh.running = true;

            //上面增加数据
            listModel.append({"name": nCurDown.toString(), "number": nCurDown.toString()});
            nCurDown++;
            listModel.append({"name": nCurDown.toString(), "number": nCurDown.toString()});
            nCurDown++;
            listModel.append({"name": nCurDown.toString(), "number": nCurDown.toString()});
            nCurDown++;

            aniDownRefresh.start();
        }
    }

    NumberAnimation {
        id: aniDownRefresh
        target: listView
        property: "y"
        duration: 200
        from: -nPullHeight
        to: 0
        onStopped: {
            listView.contentY = listView.contentHeight - listView.height;
        }
    }

    function funUpRefresh(){
        console.debug(qsTr("启动上刷新..."))
        listView.y = nPullHeight;

        busyUpRefresh.running = false;
        timerUpRefresh.start();
    }

    BusyIndicator {
        id: busyUpRefresh
        anchors.top: parent.top
        anchors.topMargin: 6
        anchors.horizontalCenter: parent.horizontalCenter
        implicitWidth: 48
        implicitHeight: 48
        opacity: running ? 0.0 : 1.0
        contentItem: QmlBusyIndicator{}
    }

    Timer{
        id: timerUpRefresh
        interval: 1000
        repeat: false
        running: false
        onTriggered: {
            busyUpRefresh.running = true;

            //上面增加数据
            listModel.insert(0, {"name": nCurUp.toString(), "number": nCurUp.toString()});
            nCurUp--;
            listModel.insert(0, {"name": nCurUp.toString(), "number": nCurUp.toString()});
            nCurUp--;
            listModel.insert(0, {"name": nCurUp.toString(), "number": nCurUp.toString()});
            nCurUp--;

            aniUpRefresh.start();
        }
    }

    NumberAnimation {
        id: aniUpRefresh
        target: listView
        property: "y"
        duration: 200
        from: nPullHeight
        to: 0
        onStopped: {
            listView.y = 0;
        }
    }

    ListView {
        id: listView
        width: parent.width
        height: parent.height
        model: listModel
        delegate: Rectangle{
            height: 24
            width: parent.width
            border.color: "#AAAAAA"
            border.width: 1
            Text {
                font.family: "microsoft yahei"
                font.pixelSize: 15
                anchors.centerIn: parent
                text: name + ": " + number
            }
        }
        states: [
            State {
                id: downRefresh
                name: "downRefresh"; when: (listView.contentHeight > 0) && (listView.contentY > (listView.contentHeight - root.height + nPullHeight))
                StateChangeScript {
                    name: "funDownRefresh"
                    script: funDownRefresh()
                }
            },
            State {
                id: upRefresh
                name: "upRefresh"; when: (listView.contentY < -nPullHeight)
                StateChangeScript {
                    name: "funUpRefresh"
                    script: funUpRefresh()
                }
            }
        ]
    }


    ListModel {
        id: listModel
        ListElement {
            name: "A"
            number: "01"
        }
        ListElement {
            name: "B"
            number: "02"
        }
        ListElement {
            name: "C"
            number: "03"
        }
        ListElement {
            name: "D"
            number: "04"
        }
        ListElement {
            name: "E"
            number: "05"
        }
        ListElement {
            name: "F"
            number: "06"
        }
        ListElement {
            name: "G"
            number: "07"
        }
        ListElement {
            name: "H"
            number: "08"
        }
        ListElement {
            name: "I"
            number: "09"
        }
        ListElement {
            name: "J"
            number: "10"
        }
        ListElement {
            name: "K"
            number: "11"
        }
        ListElement {
            name: "L"
            number: "12"
        }
        ListElement {
            name: "M"
            number: "13"
        }
        ListElement {
            name: "N"
            number: "14"
        }
        ListElement {
            name: "O"
            number: "15"
        }
        ListElement {
            name: "P"
            number: "16"
        }
        ListElement {
            name: "Q"
            number: "17"
        }
        ListElement {
            name: "R"
            number: "18"
        }
    }

}
