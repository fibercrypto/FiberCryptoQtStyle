import QtQuick 2.12
import QtQuick.Controls.FiberCrypto 2.12
import QtQuick.Controls.FiberCrypto.impl 2.12

Rectangle {
    id: indicatorItem
    implicitWidth: 18
    implicitHeight: 18
    color: "transparent"
    border.color: !control.enabled ? control.FiberCrypto.hintTextColor
        : checkState !== Qt.Unchecked ? control.FiberCrypto.accentColor : control.FiberCrypto.secondaryTextColor
    border.width: checkState !== Qt.Unchecked ? width / 2 : 2
    radius: 2

    property Item control
    property int checkState: control.checkState

    Behavior on border.width {
        NumberAnimation {
            duration: 100
            easing.type: Easing.OutCubic
        }
    }

    Behavior on border.color {
        ColorAnimation {
            duration: 100
            easing.type: Easing.OutCubic
        }
    }

    // TODO: This needs to be transparent
    Image {
        id: checkImage
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 14
        height: 14
        source: "qrc:/fibercrypto-project/imports/QtQuick/Controls.2/FiberCrypto/images/check.png"
        fillMode: Image.PreserveAspectFit

        scale: checkState === Qt.Checked ? 1 : 0
        Behavior on scale { NumberAnimation { duration: 100 } }
    }

    Rectangle {
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 12
        height: 3

        scale: checkState === Qt.PartiallyChecked ? 1 : 0
        Behavior on scale { NumberAnimation { duration: 100 } }
    }

    states: [
        State {
            name: "checked"
            when: checkState === Qt.Checked
        },
        State {
            name: "partiallychecked"
            when: checkState === Qt.PartiallyChecked
        }
    ]

    transitions: Transition {
        SequentialAnimation {
            NumberAnimation {
                target: indicatorItem
                property: "scale"
                // Go down 2 pixels in size.
                to: 1 - 2 / indicatorItem.width
                duration: 120
            }
            NumberAnimation {
                target: indicatorItem
                property: "scale"
                to: 1
                duration: 120
            }
        }
    }
}
