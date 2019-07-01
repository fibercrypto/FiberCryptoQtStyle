import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

T.ProgressBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    contentItem: ProgressBarImpl {
        implicitHeight: 4

        scale: control.mirrored ? -1 : 1
        color: control.Material.accentColor
        progress: control.position
        indeterminate: control.visible && control.indeterminate
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 4
        y: (control.height - height) / 2
        height: 4

        color: Qt.rgba(control.Material.accentColor.r, control.Material.accentColor.g, control.Material.accentColor.b, 0.25)
    }
}
