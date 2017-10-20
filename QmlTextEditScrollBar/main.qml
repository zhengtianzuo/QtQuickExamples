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
    width: 400
    height: 300
    title: qsTr("QmlTextEdit带滚动条")

    Rectangle {
          id: frame
          clip: true
          width: parent.width
          height: parent.height
          border.color: "black"
          anchors.centerIn: parent
          anchors.top: parent.bottom
          anchors.left: parent.left
          focus: true

          Keys.onUpPressed: vbar.decrease()
          Keys.onDownPressed: vbar.increase()

          TextEdit {
              id: textEdit
              text: "ABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKLABCDEFGHIJKL"
              font.pointSize: 14
              height: contentHeight
              width: frame.width - vbar.width
              y: -vbar.position * textEdit.height
              wrapMode: TextEdit.Wrap
              selectByKeyboard: true
              selectByMouse: true

              MouseArea{
                  anchors.fill: parent
                  onWheel: {
                      if (wheel.angleDelta.y > 0) {
                          vbar.decrease();
                      }
                      else {
                          vbar.increase();
                      }
                  }
                  onClicked: {
                      textEdit.forceActiveFocus();
                  }
              }
          }

          ScrollBar {
              id: vbar
              hoverEnabled: true
              active: hovered || pressed
              orientation: Qt.Vertical
              size: frame.height / textEdit.height
              width: 10
              anchors.top: parent.top
              anchors.right: parent.right
              anchors.bottom: parent.bottom
          }
      }
}
