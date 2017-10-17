/*!
 *@file QmlPlugin.h
 *@brief Qml插件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once

#include <QQmlApplicationEngine>
#include <QtCore/qglobal.h>

#if defined(QTDLL_LIBRARY)
#  define QTDLLSHARED_EXPORT Q_DECL_EXPORT
#else
#  define QTDLLSHARED_EXPORT Q_DECL_IMPORT
#endif

class QTDLLSHARED_EXPORT QmlPlugin
{
public:
    void ShowWindow();

private:
    QQmlApplicationEngine engine;
};

extern "C" QTDLLSHARED_EXPORT void ShowWindowApp();
