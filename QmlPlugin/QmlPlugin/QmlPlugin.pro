#-------------------------------------------------
#
# Copyright (C) 2003-2103 CamelSoft Corporation
#
#-------------------------------------------------

QT += qml quick

CONFIG += c++11

TEMPLATE = lib

DEFINES += QTDLL_LIBRARY

SOURCES += \
    QmlPlugin.cpp

HEADERS += \
    QmlPlugin.h

RESOURCES += \
    QmlPlugin.qrc
