import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0
import QtQuick.Controls 1.4


Rectangle
{
    id: root
    color: "#222222"

    state: "stateUsers"
    states:
    [
        State
        {
            name: "statePower"
            
            PropertyChanges { target: pagePower;    enabled: true ; focus: true ; x: 0 }
            PropertyChanges { target: pageSessions; enabled: false; focus: false; x: areaMain.width }
            PropertyChanges { target: pageUsers;    enabled: false; focus: false; x: areaMain.width * 2 }

            PropertyChanges { target: buttonPagePower;    selected: true  }
            PropertyChanges { target: buttonPageSessions; selected: false }
            PropertyChanges { target: buttonPageUsers;    selected: false }

        },
        State
        {
            name: "stateSessions"

            PropertyChanges { target: pagePower;    enabled: false; focus: false; x: -areaMain.width }
            PropertyChanges { target: pageSessions; enabled: true ; focus: true ; x: 0 }
            PropertyChanges { target: pageUsers;    enabled: false; focus: false; x: areaMain.width }

            PropertyChanges { target: buttonPagePower;    selected: false }
            PropertyChanges { target: buttonPageSessions; selected: true  }
            PropertyChanges { target: buttonPageUsers;    selected: false }
        },
        State
        {
            name: "stateUsers"

            PropertyChanges { target: pagePower;    enabled: false; focus: false; x: -areaMain.width * 2 }
            PropertyChanges { target: pageSessions; enabled: false; focus: false; x: -areaMain.width }
            PropertyChanges { target: pageUsers;    enabled: true ; focus: true ; x: 0 }

            PropertyChanges { target: buttonPagePower;    selected: false }
            PropertyChanges { target: buttonPageSessions; selected: false }
            PropertyChanges { target: buttonPageUsers;    selected: true  }
        }
    ]

    TextConstants { id: localeText }

    Item
    {
        id: areaTop
        x: 0
        y: 0
        width: root.width
        height: 35

        SlicedButton
        {
            id: buttonPagePower
            x: 5
            y: 5

            hasLeftSlice: false
            text: sddm.hostName ? sddm.hostName : "Hostname"

            enabled: sddm.canPowerOff || sddm.canReboot || sddm.canSuspend || sddm.canHibernate || sddm.canHybridSleep

            onClicked: if (enabled) root.state = "statePower"
        }

        SlicedButton
        {
            id: buttonPageSessions
            x: buttonPagePower.x + buttonPagePower.widthPartial + 3
            y: 5

            text: pageSessions.currentSessionName

            onClicked: root.state = "stateSessions"
        }

        SlicedButton
        {
            id: buttonPageUsers
            x: buttonPageSessions.x + buttonPageSessions.widthPartial + 3
            y: 5

            text: pageUsers.currentUserLogin

            onClicked: root.state = "stateUsers"
        }
    }

    Item
    {
        id: areaMain
        x: 0
        y: areaTop.height
        width: root.width
        height: root.height - (areaTop.height * 2)

        PagePower
        {
            id: pagePower
            width: areaMain.width
            height: areaMain.height

            Keys.onTabPressed: { root.state = "stateSessions" }
            Keys.onBacktabPressed: { root.state = "stateUsers" }

            Behavior on x { NumberAnimation { duration: 150 } }
        }

        PageSessions
        {
            id: pageSessions
            width: areaMain.width
            height: areaMain.height

            Keys.onTabPressed: { root.state = "stateUsers" }
            Keys.onBacktabPressed:
            {
                if (buttonPagePower.enabled)
                    root.state = "statePower"
                else
                    root.state = "stateSessions"
            }

            Behavior on x { NumberAnimation { duration: 150 } }

            onSelectedIndexChanged: pageUsers.selectedSessionIndex = selectedIndex

            onSessionSelected: root.state = "stateUsers"
        }

        PageUsers
        {
            id: pageUsers
            width: areaMain.width
            height: areaMain.height

            Keys.onTabPressed:
            {
                if (buttonPagePower.enabled)
                    root.state = "statePower"
                else
                    root.state = "stateSessions"
            }
            Keys.onBacktabPressed: { root.state = "stateSessions" }

            Behavior on x { NumberAnimation { duration: 150 } }

            onLockNav: areaTop.enabled = false
            onUnlockNav: areaTop.enabled = true
        }
    }

    Item
    {
        id: areaBottom
        x: 0
        y: areaTop.height + areaMain.height
        width: root.width
        height: 35

        SlicedButton
        {
            id: buttonCapsLock
            x: 5
            y: 5

            hasLeftSlice: false
            text: "Caps Lock"
            selected: keyboard.capsLock

            onClicked: keyboard.capsLock = !keyboard.capsLock
        }

        SlicedButton
        {
            id: buttonNumLock
            x: buttonCapsLock.x + buttonCapsLock.widthPartial + 3
            y: 5

            text: "Num Lock"
            selected: keyboard.numLock

            onClicked: keyboard.numLock = !keyboard.numLock
        }

        SlicedButton
        {
            id: buttonKeyboardLayout
            x: buttonNumLock.x + buttonNumLock.widthPartial + 3
            y: 5

            text: keyboard.layouts[keyboard.currentLayout].longName
        }

        Item
        {
            id: dateTimeArea
            x: areaBottom.width - width
            width: buttonWeekday.widthPartial + buttonDate.widthPartial + buttonTime.widthPartial + 21

            SlicedButton
            {
                id: buttonWeekday
                x: 5
                y: 5

                function updateTime()
                {
                    text = new Date().toLocaleString(Qt.locale(),
                        "dddd")
                }
            }

            SlicedButton
            {
                id: buttonDate
                x: buttonWeekday.x + buttonWeekday.widthPartial + 3
                y: 5

                function updateTime()
                {
                    text = new Date().toLocaleString(Qt.locale(),
                        "dd.MM.yyyy")
                }
            }

            SlicedButton
            {
                id: buttonTime
                x: buttonDate.x + buttonDate.widthPartial + 3
                y: 5

                hasRightSlice: false

                function updateTime()
                {
                    text = new Date().toLocaleString(Qt.locale(),
                        "hh:mm:ss")
                }
            }
        }

        Timer
        {
            interval: 1000
            repeat: true
            running: true
            onTriggered:
            {
                buttonTime.updateTime()
                buttonDate.updateTime()
                buttonWeekday.updateTime()
            }
        }

        Component.onCompleted:
        {
            buttonTime.updateTime()
            buttonDate.updateTime()
            buttonWeekday.updateTime()
        }
    }
}

