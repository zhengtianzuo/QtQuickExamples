/*!
 *@file QmlLanguage.h
 *@brief 语言切换
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QObject>
#include <QTranslator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

class QmlLanguage : public QObject
{
    Q_OBJECT
public:
    QmlLanguage(QGuiApplication& app, QQmlApplicationEngine &engine);

    Q_INVOKABLE void setLanguage(int nLanguage);

private:
    QGuiApplication *m_app;
    QQmlApplicationEngine *m_engine;
};
