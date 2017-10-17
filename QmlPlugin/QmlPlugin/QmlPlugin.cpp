/*!
 *@file QmlPlugin.cpp
 *@brief Qml插件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "QmlPlugin.h"

void QmlPlugin::ShowWindow()
{
    engine.load(QUrl(QLatin1String("qrc:/QmlPlugin.qml")));
}

void ShowWindowApp()
{
    QmlPlugin *pp = new QmlPlugin;
    pp->ShowWindow();
}
