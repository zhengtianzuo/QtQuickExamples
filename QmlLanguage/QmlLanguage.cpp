/*!
 *@file QmlLanguage.cpp
 *@brief 语言切换
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "QmlLanguage.h"

QmlLanguage::QmlLanguage(QGuiApplication &app, QQmlApplicationEngine& engine)
{
    m_app = &app;
    m_engine = &engine;
}

void QmlLanguage::setLanguage(int nLanguage)
{
    QTranslator translator;
    if (nLanguage == 0)
    {
        translator.load(":/en_US.qm");
    }else{
        translator.load(":/zh_CN.qm");
    }
    m_app->installTranslator(&translator);
    m_engine->retranslate();
}
