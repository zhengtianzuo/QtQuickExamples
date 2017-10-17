/*!
 *@file QmlPluginTest.h
 *@brief Qml调用插件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QObject>

class QmlPluginTest : public QObject
{
    Q_OBJECT
public:
    QmlPluginTest();

    Q_INVOKABLE void showWindow();
};
