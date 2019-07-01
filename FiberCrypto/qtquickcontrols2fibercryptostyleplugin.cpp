#include <QtQuickControls2/private/qquickstyleplugin_p.h>

#include "qquickfibercryptostyle_p.h"
#include "qquickfibercryptotheme_p.h"
#include "qquickfibercryptobusyindicator_p.h"
#include "qquickfibercryptoprogressbar_p.h"
#include "qquickfibercryptoripple_p.h"

#include <QtQuickControls2/private/qquickstyleselector_p.h>
#include <QtQuickControls2/private/qquickpaddedrectangle_p.h>

QT_BEGIN_NAMESPACE

class QtQuickControls2FiberCryptoStylePlugin : public QQuickStylePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    QtQuickControls2FiberCryptoStylePlugin(QObject *parent = nullptr);

    void registerTypes(const char *uri) override;

    QString name() const override;
    void initializeTheme(QQuickTheme *theme) override;
};

QtQuickControls2FiberCryptoStylePlugin::QtQuickControls2FiberCryptoStylePlugin(QObject *parent) : QQuickStylePlugin(parent)
{
    QQuickFiberCryptoStyle::initGlobals();
}

void QtQuickControls2FiberCryptoStylePlugin::registerTypes(const char *uri)
{
    qmlRegisterModule(uri, 2, QT_VERSION_MINOR); // Qt 5.12->2.12, 5.13->2.13...
    qmlRegisterUncreatableType<QQuickFiberCryptoStyle>(uri, 2, 0, "FiberCrypto", tr("FiberCrypto is an attached property"));

    QByteArray import = QByteArray(uri) + ".impl";
    qmlRegisterModule(import, 2, QT_VERSION_MINOR); // Qt 5.12->2.12, 5.13->2.13...

    qmlRegisterType<QQuickFiberCryptoBusyIndicator>(import, 2, 0, "BusyIndicatorImpl");
    qmlRegisterType<QQuickFiberCryptoProgressBar>(import, 2, 0, "ProgressBarImpl");
    qmlRegisterType<QQuickFiberCryptoRipple>(import, 2, 0, "Ripple");
    qmlRegisterType(resolvedUrl(QStringLiteral("BoxShadow.qml")), import, 2, 0, "BoxShadow");
    qmlRegisterType(resolvedUrl(QStringLiteral("CheckIndicator.qml")), import, 2, 0, "CheckIndicator");
    qmlRegisterType(resolvedUrl(QStringLiteral("CursorDelegate.qml")), import, 2, 0, "CursorDelegate");
    qmlRegisterType(resolvedUrl(QStringLiteral("ElevationEffect.qml")), import, 2, 0, "ElevationEffect");
    qmlRegisterType(resolvedUrl(QStringLiteral("RadioIndicator.qml")), import, 2, 0, "RadioIndicator");
    qmlRegisterType(resolvedUrl(QStringLiteral("RectangularGlow.qml")), import, 2, 0, "RectangularGlow");
    qmlRegisterType(resolvedUrl(QStringLiteral("SliderHandle.qml")), import, 2, 0, "SliderHandle");
    qmlRegisterType(resolvedUrl(QStringLiteral("SwitchIndicator.qml")), import, 2, 0, "SwitchIndicator");
}

QString QtQuickControls2FiberCryptoStylePlugin::name() const
{
    return QStringLiteral("FiberCrypto");
}

void QtQuickControls2FiberCryptoStylePlugin::initializeTheme(QQuickTheme *theme)
{
    QQuickFiberCryptoTheme::initialize(theme);
}

QT_END_NAMESPACE

#include "qtquickcontrols2fibercryptostyleplugin.moc"
