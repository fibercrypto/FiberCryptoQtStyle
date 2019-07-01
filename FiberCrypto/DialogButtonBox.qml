import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.FiberCrypto 2.12
import QtQuick.Controls.FiberCrypto.impl 2.12

T.DialogButtonBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    spacing: 8
    padding: 8
    verticalPadding: 2
    alignment: Qt.AlignRight
    buttonLayout: T.DialogButtonBox.AndroidLayout

    FiberCrypto.foreground: FiberCrypto.accent

    delegate: Button { flat: true }

    contentItem: ListView {
        model: control.contentModel
        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        snapMode: ListView.SnapToItem
    }

    background: PaddedRectangle {
        implicitHeight: control.FiberCrypto.dialogButtonBoxHeight
        radius: 2
        color: control.FiberCrypto.dialogColor
        // Rounded corners should be only at the top or at the bottom
        topPadding: control.position === T.DialogButtonBox.Footer ? -2 : 0
        bottomPadding: control.position === T.DialogButtonBox.Header ? -2 : 0
        clip: true
    }
}
