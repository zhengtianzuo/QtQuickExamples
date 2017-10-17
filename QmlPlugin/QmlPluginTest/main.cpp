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
#include "QmlPluginTest.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QmlPluginTest qmlPluginTest;
    engine.rootContext()->setContextProperty("qmlPluginTest", &qmlPluginTest);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
