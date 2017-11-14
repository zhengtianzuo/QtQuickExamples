/*!
 *@file QmlCircularProgress.qml
 *@brief Qml圆形进度条
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.4

Canvas {
    property color arcColor: "#148014"
    property color arcBackgroundColor: "#EEEEEE"
    property int arcWidth: 2
    property real progress: 0
    property real radius: 100
    property bool anticlockwise: false
    property alias interval: timer.interval

    signal sStart()
    signal sStop()

    id: canvas
    width: 2*radius + arcWidth
    height: 2*radius + arcWidth

    Text{
        anchors.centerIn: parent
        font.pointSize: 15
        text: Math.floor((parent.progress / 360) * 100 )+ "%"
    }

    Timer{
        id: timer
        running: false
        repeat: true
        interval: 5
        onTriggered:{
            parent.progress++;
            if (parent.progress > 360){
                onStop();
                return;
            }
            parent.requestPaint();
        }
    }

    function isRunning(){
        return(timer.running)
    }

    function onStart(){
        progress = 0;
        var ctx = getContext("2d");
        ctx.clearRect(0,0,width,height);
        timer.running = true;
        emit: sStart()
    }

    function onStop(){
        timer.running = false;
        emit: sStop()
    }

    onPaint: {
        var ctx = getContext("2d")
        ctx.clearRect(0,0,width,height)
        ctx.beginPath()
        ctx.strokeStyle = arcBackgroundColor
        ctx.lineWidth = arcWidth
        ctx.arc(width/2,height/2,radius,0,Math.PI*2,anticlockwise)
        ctx.stroke()

        var r = progress*Math.PI/180
        ctx.beginPath()
        ctx.strokeStyle = arcColor
        ctx.lineWidth = arcWidth

        ctx.arc(width/2,height/2,radius,0-90*Math.PI/180,r-90*Math.PI/180,anticlockwise)
        ctx.stroke()
    }
}



