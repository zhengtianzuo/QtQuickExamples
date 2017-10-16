/*!
 *@file QmlLog4Qml.cpp
 *@brief Qml写日志
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "QmlLog4Qml.h"
#include <QMutex>
#include <QFile>
#include <QDateTime>
#include <QTextStream>

void outputMessage(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    static QMutex mutex;
    mutex.lock();

    QString text;
    switch(type)
    {
    case QtDebugMsg:
        text = QString("Debug:");
        break;

    case QtWarningMsg:
        text = QString("Warning:");
        break;

    case QtCriticalMsg:
        text = QString("Critical:");
        break;

    case QtFatalMsg:
        text = QString("Fatal:");
    }

    QString message = "";
    if (context.file != nullptr)
    {
        QString context_info = QString("File:(%1) Line:(%2)").arg(QString(context.file)).arg(context.line);
        QString current_date_time = QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss ddd");
        QString current_date = QString("(%1)").arg(current_date_time);
        message = QString("%1 %2 %3 %4").arg(text).arg(context_info).arg(msg).arg(current_date);
    }
    else
    {
        message = msg;
    }

    QFile file("log.txt");
    file.open(QIODevice::WriteOnly | QIODevice::Append);
    QTextStream text_stream(&file);
    text_stream << message << "\r\n";
    file.flush();
    file.close();

    mutex.unlock();
}

QmlLog4Qml::QmlLog4Qml()
{
    qInstallMessageHandler(outputMessage);
}

void QmlLog4Qml::qDebug_Info(int type, QString strInfo)
{
    QMessageLogContext context;
    context.file = nullptr;
    outputMessage((QtMsgType)type, context, strInfo);
}
