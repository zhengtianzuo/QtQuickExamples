/*!
 *@file QmlPluginTest.cpp
 *@brief Qml调用插件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "QmlPluginTest.h"
#include <QLibrary>
#include <QDebug>
#include <QCoreApplication>

QmlPluginTest::QmlPluginTest()
{

}

void QmlPluginTest::showWindow()
{
    typedef void(*FUN1)();
    QLibrary lib(QCoreApplication::applicationDirPath() + "/plugins/QmlPlugin/QmlPlugin.dll");
    if (lib.load())
    {
        FUN1 pShow = (FUN1)lib.resolve("ShowWindowApp");
        if (pShow)
        {
            pShow();
        }
        else
        {
            qDebug() << "fun error";
        }
    }
    else
    {
        qDebug() << "load error";
    }
}
