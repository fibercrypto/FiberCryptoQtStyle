import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls.FiberCrypto 2.12
import QtQuick.Controls.FiberCrypto.impl 2.12

T.CheckBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    spacing: 8
    padding: 8
    verticalPadding: padding + 7

    indicator: CheckIndicator {
        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control

        Ripple {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 28; height: 28

            z: -1
            anchor: control
            pressed: control.pressed
            active: control.down || control.visualFocus || control.hovered
            color: control.checked ? control.FiberCrypto.highlightedRippleColor : control.FiberCrypto.rippleColor
        }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.enabled ? control.FiberCrypto.foreground : control.FiberCrypto.hintTextColor
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
}
