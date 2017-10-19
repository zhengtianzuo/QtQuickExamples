/*!
 *@file QmlTableView.h
 *@brief QmlTableView
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "QmlTableView.h"
#include <QDebug>

QmlTableViewModel::QmlTableViewModel() : QAbstractTableModel(0)
{
}

int QmlTableViewModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_aryData.size();
}

int QmlTableViewModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return 3;
}

QVariant QmlTableViewModel::data(const QModelIndex &index, int role) const
{
    return m_aryData[index.row()][role];
}

QHash<int, QByteArray> QmlTableViewModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[OneRole] = "1";
    roles[TwoRole] = "2";
    roles[ThreeRole] = "3";
    return roles;
}

void QmlTableViewModel::Add(QString one, QString two, QString three)
{
    beginInsertRows(QModelIndex(), m_aryData.size(), m_aryData.size());
    QVector<QString> list;
    list.push_back(one);
    list.push_back(two);
    list.push_back(three);
    m_aryData.push_back(list);
    endInsertRows();
}

void QmlTableViewModel::Set(int row, int column, QString text)
{
    if (row == -1){return;}
    if (column == -1){return;}
    beginResetModel();
    m_aryData[row][column] = text;
    endResetModel();
}

void QmlTableViewModel::Del()
{
    if (m_aryData.size() <= 0) return;
    beginRemoveRows(QModelIndex(), m_aryData.size() - 1, m_aryData.size() - 1);
    m_aryData.removeLast();
    endRemoveRows();
}

void QmlTableViewModel::Refresh()
{
    beginResetModel();
    endResetModel();
}
