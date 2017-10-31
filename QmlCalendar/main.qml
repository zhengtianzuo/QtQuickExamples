/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml日历")

    function dayValid(date){
        var myArray = new Array();
        myArray[0]="13";
        myArray[1]="17";
        myArray[2]="26";

        for(var i = 0; i < myArray.length;i++)
        {
            if (myArray[i] === date)
            {
                return(false);
            }
        }
        return(true);
    }

    Calendar {
        anchors.centerIn: parent

        style: CalendarStyle {
            gridVisible: false
            dayDelegate: Rectangle {
                property bool dayIsValid: dayValid(styleData.date.getDate().toString())

                gradient: Gradient {
                    GradientStop {
                        position: 0.00
                        color: styleData.selected && dayIsValid ? "#148014" : (styleData.visibleMonth && styleData.valid ? (dayIsValid ? "#CCCCCC" : "#FFFFFF") : "#FFFFFF");
                    }
                }

                Label {
                    text: styleData.date.getDate()
                    anchors.centerIn: parent
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#EEEEEE"
                    anchors.bottom: parent.bottom
                }

                Rectangle {
                    width: 1
                    height: parent.height
                    color: "#EEEEEE"
                    anchors.right: parent.right
                }
            }
        }
    }
}
