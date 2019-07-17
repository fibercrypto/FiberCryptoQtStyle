import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.FiberCrypto 2.12

T.ApplicationWindow {
    id: window

    color: FiberCrypto.backgroundColor

    overlay.modal: Rectangle {
        color: window.FiberCrypto.backgroundDimColor
        Behavior on opacity { NumberAnimation { duration: 150 } }
    }

    overlay.modeless: Rectangle {
        color: window.FiberCrypto.backgroundDimColor
        Behavior on opacity { NumberAnimation { duration: 150 } }
    }
}
