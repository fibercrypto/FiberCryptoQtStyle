import QtQuick 2.12
import QtQuick.Controls.FiberCrypto 2.12

Rectangle {
    id: cursor

    color: parent.FiberCrypto.accentColor
    width: 2
    visible: parent.activeFocus && !parent.readOnly && parent.selectionStart === parent.selectionEnd

    // Fading cursor
    Behavior on opacity { NumberAnimation { duration: 150 } }

    Connections {
        target: cursor.parent
        onCursorPositionChanged: {
            // keep a moving cursor visible
            cursor.opacity = 1
            timer.restart()
        }
    }

    Timer {
        id: timer
        running: cursor.parent.activeFocus && !cursor.parent.readOnly
        repeat: true
        interval: Qt.styleHints.cursorFlashTime / 2
        onTriggered: cursor.opacity = !cursor.opacity ? 1 : 0
        // force the cursor visible when gaining focus
        onRunningChanged: cursor.opacity = 1
    }
}
