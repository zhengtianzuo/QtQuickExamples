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
    visible: true
    width: 400
    height: 300
    title: qsTr("Qml圆形波浪进度条")

    //range信息
    property int rangeValue: 66;
    property int nowRange: 0;

    //画布
    property int mW: 250;
    property int mH: 250;
    property int lineWidth: 2;

    //圆
    property double r: mH / 2; //圆心
    property double cR: r - 16 * lineWidth; //圆半径

    //Sin曲线
    property int sX: 0;
    property int sY: mH / 2;
    property int axisLength: mW;        //轴长
    property double waveWidth: 0.015;   //波浪宽度,数越小越宽
    property double waveHeight: 6;      //波浪高度,数越大越高
    property double speed: 0.09;        //波浪速度，数越大速度越快
    property double xOffset: 0;         //波浪x偏移量

    Canvas{
        id: canvas
        height: mH
        width: mW
        anchors.centerIn: parent
        onPaint: {
            var ctx = getContext("2d");

            ctx.clearRect(0, 0, mW, mH);

            //显示外圈
            ctx.beginPath();
            ctx.strokeStyle = '#148014';
            ctx.arc(r, r, cR+5, 0, 2*Math.PI);
            ctx.stroke();
            ctx.beginPath();
            ctx.arc(r, r, cR, 0, 2*Math.PI);
            ctx.clip();

            //显示sin曲线
            ctx.save();
            var points=[];
            ctx.beginPath();
            for(var x = sX; x < sX + axisLength; x += 20 / axisLength){
                var y = -Math.sin((sX + x) * waveWidth + xOffset);
                var dY = mH * (1 - nowRange / 100 );
                points.push([x, dY + y * waveHeight]);
                ctx.lineTo(x, dY + y * waveHeight);
            }

            //显示波浪
            ctx.lineTo(axisLength, mH);
            ctx.lineTo(sX, mH);
            ctx.lineTo(points[0][0],points[0][1]);
            ctx.fillStyle = '#1c86d1';
            ctx.fill();
            ctx.restore();

            //显示百分数
            ctx.save();
            var size = 0.4*cR;
            ctx.font = size + 'px Arial';
            ctx.textAlign = 'center';
            ctx.fillStyle = "rgba(14, 80, 14, 0.8)";
            ctx.fillText(~~nowRange + '%', r, r + size / 2);
            ctx.restore();

            //增加Rang值
            if(nowRange <= rangeValue){
                nowRange += 1;
            }

            if(nowRange > rangeValue){
                nowRange -= 1;
            }
            xOffset += speed;
        }

        Timer{
            id: timer
            running: false
            repeat: true
            interval: 10
            onTriggered:{
                parent.requestPaint();
            }
        }
    }

    Button{
        id: button
        height: 24
        width: 60
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("开始")
        onClicked: {
            if (timer.running === false){
                timer.start();
                button.text = qsTr("停止");
            }else{
                timer.stop();
                button.text = qsTr("开始");
            }
        }
    }
}
