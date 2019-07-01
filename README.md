# FiberCryptoQtStyle  
*Qt Quick Controls 2 style plugin for* ***FiberCrypto wallet***  

-----------------------------------------------------------

Available themes:  
* Light theme  
* Dark theme  

## Installation  
This style uses Qt internals private headers. That is neccesary in order to get the maximum performance, but the flip part is that doing so ties this plugin to the Qt version it was compiled against.  
That means that using it with **any** other version, no matter if greater or lower, can cause the application that uses it to **eventually crash at some random point**.  
To avoid that, you **must** use the plugin that matches the Qt version you are using. Both dynamic and static binaries of the plugin are provided to some version of Qt. However, we believe that is more safe that you compile the plugin and install it manually.  

### Option 1: Precompiled binaries  
1. Download the precompiled binaries that matches your Qt version, if any. If you can't find one, then you must compile it from sources using the Option 2.  
2. Uncompress the content.  
3. Copy the folder `FiberCrypto` to `$QTDIR/qml/QtQuick/Controls.2/`  

### Option 2: Building from sources  
1. Clone or download this repository.  
2. Open the project (`.pro`) file in Qt Creator.  
3. Build it.  
4. Copy the following files to a new folder named `FiberCrypto`:  
	- All `.qml` files, located in the `fibercrypto` folder of this repository.  
	- The `qmldir` file, located in the `fibercrypto` folder of this repository.  
	- The `plugins.qmltypes` file, located in the `fibercrypto` folder of this repository.  
	- The compiled plugin, named `libqtquickcontrols2fibercryptostyleplugin`, ending with `.so` or `.a` depending of if it's a dynamic or static plugin respectively. If it is dynamic, remove the version number so the final name is: `libqtquickcontrols2fibercryptostyleplugin.so`. If it is static, keep it as is.  
5. Copy the folder to `$QTDIR/qml/QtQuick/Controls.2/`

## Usage  
Import the plugin in Qt Creator:  
`import QtQuick.Controls.FiberCrypto 2.X`  
Replace `X` with the Qt minor version number (i.e. `2.12` for Qt 5.12, `2.13` for Qt 5.13, etc...).  

## WIP  
### This is a Work In Progress  