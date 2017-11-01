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
#include <QQuickWindow>
#include "QmlKey.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QmlKey qmlKey;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("qmlKey", &qmlKey);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    QObject *root = engine.rootObjects()[0];
    root->installEventFilter(&qmlKey);
    QObject::connect(&qmlKey, SIGNAL(sKeyBackPress()), root, SLOT(onSKeyBackPress()));
    QObject::connect(&qmlKey, SIGNAL(sKeyBackRelease()), root, SLOT(onSKeyBackRelease()));
    return app.exec();
}
