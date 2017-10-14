/*!
 *@file QmlImageProvider.h
 *@brief QmlImageProvider
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QQuickImageProvider>
#include <QDebug>

class ImageProvider : public QQuickImageProvider
{
public:
    ImageProvider::ImageProvider(ImageType type, Flags flags = Flags()) :
        QQuickImageProvider(type, flags)
    {
    }
    ~ImageProvider(){}
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
    {
        QString strFileName = QCoreApplication::applicationDirPath() + "/" + id;
        qDebug() << strFileName;
        QPixmap pixmap(strFileName);
        return pixmap;
    }
};
