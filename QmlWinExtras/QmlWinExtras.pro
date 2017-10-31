#-------------------------------------------------
#
# Copyright (C) 2003-2103 CamelSoft Corporation
#
#-------------------------------------------------

QT += qml quick winextras

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

win32{
    RESOURCES += QmlWinExtras.qrc
    RC_FILE = QmlWinExtras.rc
}