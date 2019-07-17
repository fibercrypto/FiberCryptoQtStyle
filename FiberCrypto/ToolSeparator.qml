import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.Material 2.12

T.ToolSeparator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    horizontalPadding: vertical ? 12 : 5
    verticalPadding: vertical ? 5 : 12

    contentItem: Rectangle {
        implicitWidth: vertical ? 1 : 38
        implicitHeight: vertical ? 38 : 1
        color: control.Material.hintTextColor
    }
}
