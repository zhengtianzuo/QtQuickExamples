/*!
 *@file main.cpp
 *@brief 程序主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "QmlLog4Qml.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QmlLog4Qml log4Qml;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("log4Qml", &log4Qml);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
