/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.8
import QtQuick.Controls 2.1

ApplicationWindow {
    id: frmWindow
    title: qsTr("QmlTableView")
    width: 400
    height: 300
    visible: true
    onClosing: {qmlTableView.enabled = false;}

    QmlTableView{
        id: qmlTableView
        height: frmWindow.height - 40
        width: parent.width
        tableView.itemDelegate:Rectangle {
            TextField{
                id: textField
                height: 25
                text: styleData.value
                selectByMouse: true
                onEditingFinished: {
                    theModel.Set(styleData.row, styleData.column, textField.text);
                }
                visible: (styleData.column !== 0)
            }
            Image{
                id: image
                height: 25
                width: 25
                source: "qrc:/Face.png"
                visible: (styleData.column === 0)
            }
        }
        tableView.rowDelegate: Rectangle {
            height: 25
        }
    }

    Row{
        anchors.bottom: parent.bottom
        height: 40
        width: parent.width
        Button{
            text: qsTr("Add")
            onClicked: {
                theModel.Add("111",222,3.33);
            }
        }
        Button{
            text: qsTr("Del")
            onClicked: {
                theModel.Del();
            }
        }
        Button{
            text: qsTr("Refresh")
            onClicked: {
                theModel.Refresh();
            }
        }
    }
}
