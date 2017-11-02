/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 320
    title: qsTr("Qml倒影")
    color: "#AAAAAA"

    Image {
        id: img
        width: 128
        height: 128
        anchors.top: parent.top
        anchors.topMargin: 16
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/1.png"

        ShaderEffect {
            height: parent.height
            width: parent.width
            anchors.top: parent.bottom
            anchors.left: parent.left

            property variant source: img
            property size sourceSize: Qt.size(0.5 / img.width, 0.5 / img.height)

            fragmentShader: "
                varying highp vec2 qt_TexCoord0;
                uniform lowp sampler2D source;
                uniform lowp vec2 sourceSize;
                uniform lowp float qt_Opacity;
                void main() {
                    lowp vec2 tc = qt_TexCoord0 * vec2(1, -1) + vec2(0, 1);
                    lowp vec4 col = 0.25 * (texture2D(source, tc + sourceSize)
                                            + texture2D(source, tc- sourceSize)
                                            + texture2D(source, tc + sourceSize * vec2(1, -1))
                                            + texture2D(source, tc + sourceSize * vec2(-1, 1))
                                           );
                    gl_FragColor = col * qt_Opacity * (1.0 - qt_TexCoord0.y) * 0.5;
                }"
        }
    }
}
