/*!
 *@file QmlTableView.qml
 *@brief QmlTableView
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.8
import QtQuick.Controls 1.4

TableView {
    property alias tableView: tableView

    id: tableView
    TableViewColumn {title: "1"; role: "1"; width: 120}
    TableViewColumn {title: "2"; role: "2"; width: 120}
    TableViewColumn {title: "3"; role: "3"; width: 120}
    model: theModel
    alternatingRowColors: false
    backgroundVisible: false
}
