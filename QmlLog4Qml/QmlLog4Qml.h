/*!
 *@file QmlLog4Qml.h
 *@brief Qml写日志
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include <QObject>

class QmlLog4Qml : public QObject
{
    Q_OBJECT

public:
    QmlLog4Qml();
    Q_INVOKABLE void qDebug_Info(int type, QString strInfo);
};
