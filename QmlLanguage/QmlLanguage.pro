#-------------------------------------------------
#
# Copyright (C) 2003-2103 CamelSoft Corporation
#
#-------------------------------------------------

QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    QmlLanguage.cpp

RESOURCES += qml.qrc

TRANSLATIONS = zh_CN.ts en_US.ts

HEADERS += \
    QmlLanguage.h
