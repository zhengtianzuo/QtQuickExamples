/*!
 *@file QmlKey.h
 *@brief Qml全局按键
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QObject>
#include <QEvent>
#include <QKeyEvent>

class QmlKey : public QObject
{
    Q_OBJECT
public:
    QmlKey();

protected:
    virtual bool eventFilter(QObject *watched, QEvent *event);

signals:
    void sKeyBackPress();
    void sKeyBackRelease();
};
