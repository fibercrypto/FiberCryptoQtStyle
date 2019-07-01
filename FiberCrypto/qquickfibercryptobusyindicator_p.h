#ifndef QQUICKFIBERCRYPTOBUSYINDICATOR_P_H
#define QQUICKFIBERCRYPTOBUSYINDICATOR_P_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include <QtGui/qcolor.h>
#include <QtQuick/qquickitem.h>

QT_BEGIN_NAMESPACE

class QQuickFiberCryptoBusyIndicator : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor FINAL)
    Q_PROPERTY(bool running READ isRunning WRITE setRunning FINAL)

public:
    explicit QQuickFiberCryptoBusyIndicator(QQuickItem *parent = nullptr);

    QColor color() const;
    void setColor(QColor color);

    bool isRunning() const;
    void setRunning(bool running);

    int elapsed() const;

protected:
    void itemChange(ItemChange change, const ItemChangeData &data) override;
    QSGNode *updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *) override;

private:
    int m_elapsed = 0;
    QColor m_color = Qt::black;
};

QT_END_NAMESPACE

QML_DECLARE_TYPE(QQuickFiberCryptoBusyIndicator)

#endif // QQUICKFIBERCRYPTOBUSYINDICATOR_P_H
