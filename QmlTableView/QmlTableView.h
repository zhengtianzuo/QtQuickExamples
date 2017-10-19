/*!
 *@file QmlTableView.h
 *@brief QmlTableView
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QAbstractTableModel>
#include <QVector>

enum Role {
    OneRole,
    TwoRole,
    ThreeRole
};

class QmlTableViewModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    explicit QmlTableViewModel();
    int rowCount(const QModelIndex & parent = QModelIndex()) const Q_DECL_OVERRIDE;
    int columnCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;
    QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;

    Q_INVOKABLE void Add(QString one, QString two, QString three);
    Q_INVOKABLE void Set(int row, int column, QString text);
    Q_INVOKABLE void Del();
    Q_INVOKABLE void Refresh();
private:
   QVector<QVector<QString>> m_aryData;
};
