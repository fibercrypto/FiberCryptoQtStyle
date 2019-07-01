import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.FiberCrypto 2.12
import QtQuick.Controls.FiberCrypto.impl 2.12

T.Dial {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding) || 100 // ### remove 100 in Qt 6
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding) || 100 // ### remove 100 in Qt 6

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 100

        x: control.width / 2 - width / 2
        y: control.height / 2 - height / 2
        width: Math.max(64, Math.min(control.width, control.height))
        height: width
        color: "transparent"
        radius: width / 2

        border.color: control.enabled ? control.FiberCrypto.accentColor : control.FiberCrypto.hintTextColor
    }

    handle: SliderHandle {
        x: background.x + background.width / 2 - handle.width / 2
        y: background.y + background.height / 2 - handle.height / 2
        transform: [
            Translate {
                y: -background.height * 0.4 + handle.height / 2
            },
            Rotation {
                angle: control.angle
                origin.x: handle.width / 2
                origin.y: handle.height / 2
            }
        ]
        implicitWidth: 10
        implicitHeight: 10

        value: control.value
        handleHasFocus: control.visualFocus
        handlePressed: control.pressed
        handleHovered: control.hovered
    }
}
