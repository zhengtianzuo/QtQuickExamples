/*!
 *@file QmlKey.cpp
 *@brief Qml全局按键
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "QmlKey.h"

QmlKey::QmlKey()
{

}

bool QmlKey::eventFilter(QObject *watched, QEvent *event)
{
    if (event->type() == QEvent::KeyPress)
    {
        QKeyEvent *keyEvent = static_cast<QKeyEvent*>(event);
        if (keyEvent->key() == Qt::Key_Backspace)
        {
            emit sKeyBackPress();
            return(true);
        }
    }
    if (event->type() == QEvent::KeyRelease)
    {
        QKeyEvent *keyEvent = static_cast<QKeyEvent*>(event);
        if (keyEvent->key() == Qt::Key_Backspace)
        {
            emit sKeyBackRelease();
            return(true);
        }
    }

    return QObject::eventFilter(watched, event);
}
