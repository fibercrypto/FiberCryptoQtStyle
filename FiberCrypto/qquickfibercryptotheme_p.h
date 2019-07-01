#ifndef QQUICKFIBERCRYPTOTHEME_P_H
#define QQUICKFIBERCRYPTOTHEME_P_H

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

#include <QtCore/qglobal.h>

QT_BEGIN_NAMESPACE

class QQuickTheme;

class QQuickFiberCryptoTheme
{
public:
    static void initialize(QQuickTheme *theme);
};

QT_END_NAMESPACE

#endif // QQUICKMATERIALTHEME_P_H
