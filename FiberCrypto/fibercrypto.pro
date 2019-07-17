TARGET = qtquickcontrols2fibercryptostyleplugin
TARGETPATH = QtQuick/Controls.2/FiberCrypto
TEMPLATE = lib

# Uncomment the following line if you want to use a static plugin
# CONFIG += static

# Static plugins have special deployment steps:
# 1. Use the Q_IMPORT_PLUGIN() macro in your application.
# 2. Use the Q_INIT_RESOURCE() macro in your application because the plugin ships qrc files.
# 3. Link your application with your plugin library using LIBS in the .pro file.
# See the Plug & Paint example and the associated Basic Tools plugin for details on how to do this.
# Note: If you are not using qmake to build the plugin you need to make sure that the QT_STATICPLUGIN preprocessor macro is defined.


IMPORT_NAME = QtQuick.Controls.FiberCrypto
IMPORT_VERSION = 2.$$QT_MINOR_VERSION

QT += qml quick
QT_PRIVATE += core-private gui-private qml-private quick-private quicktemplates2-private quickcontrols2-private

include(fibercrypto.pri)

OTHER_FILES += \
    qmldir \
    $$QML_FILES

SOURCES += \
    $$PWD/qtquickcontrols2fibercryptostyleplugin.cpp

RESOURCES += \
    $$PWD/qtquickcontrols2fibercryptostyleplugin.qrc
