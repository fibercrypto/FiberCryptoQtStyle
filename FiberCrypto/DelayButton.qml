import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

T.DelayButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topInset: 6
    bottomInset: 6
    padding: 12
    horizontalPadding: padding - 4

    Material.elevation: control.down ? 8 : 2

    transition: Transition {
        NumberAnimation {
            duration: control.delay * (control.pressed ? 1.0 - control.progress : 0.3 * control.progress)
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        color: !control.enabled ? control.Material.hintTextColor : control.Material.foreground
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    // TODO: Add a proper ripple/ink effect for mouse/touch input and focus state
    background: Rectangle {
        implicitWidth: 64
        implicitHeight: control.Material.buttonHeight

        radius: control.height/2
        color: !control.enabled ? control.Material.buttonDisabledColor : control.Material.buttonColor

        gradient: !control.enabled ? gradientDisabled : gradientNormal

        Gradient {
            id: gradientNormal
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.00;
                color: control.Material.buttonColor
            }
            GradientStop {
                position: 1.00;
                color: Qt.lighter(control.Material.buttonColor, 1.25)
            }
        }

        Gradient {
            id: gradientDisabled
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.00;
                color: control.Material.buttonDisabledColor
            }
        }

        PaddedRectangle {
            y: parent.height - 4
            width: parent.width
            height: 4
            radius: 2
            topPadding: -2
            leftPadding: control.height/4
            rightPadding: control.height/4
            clip: true
            color: control.checked && control.enabled ? control.Material.accentColor : control.Material.secondaryTextColor

            PaddedRectangle {
                width: parent.width * control.progress
                height: 4
                radius: 2
                topPadding: -2
                leftPadding: control.height/4
                rightPadding: control.height/4
                clip: true
                color: control.Material.accentColor
            }
        }

        layer.enabled: control.enabled && control.Material.buttonColor.a > 0
        layer.effect: ElevationEffect {
            elevation: control.Material.elevation
        }

        Ripple {
            clipRadius: control.height/2 // match the radius of the background
            width: parent.width
            height: parent.height
            pressed: false//control.pressed
            anchor: control
            active: control.down || control.visualFocus || control.hovered
            color: control.pressed ? "#2A000000" : control.Material.rippleColor
            Behavior on color { ColorAnimation {} }
        }
    }
}
