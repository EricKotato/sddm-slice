import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0

Rectangle
{
    id: root
    color: colors.background
    property variant geometry: screenModel.geometry(screenModel.primary)

    state: "stateUsers"
    states:
    [
        State
        {
            name: "statePower"
            
            PropertyChanges { target: background; x: (config.parallax_bg_shift < 0 ? geometry.x - Math.abs(config.parallax_bg_shift*2) : geometry.x ) }

            PropertyChanges { target: pagePower;    enabled: true ; focus: true ; x: 0 }
            PropertyChanges { target: pageSessions; enabled: false; focus: false; x: areaMain.width }
            PropertyChanges { target: pageUsers;    enabled: false; focus: false; x: areaMain.width * 2 }

            PropertyChanges { target: buttonPagePower;    highlighted: true  }
            PropertyChanges { target: buttonPageSessions; highlighted: false }
            PropertyChanges { target: buttonPageUsers;    highlighted: false }

        },
        State
        {
            name: "stateSessions"

            PropertyChanges { target: background; x: geometry.x - Math.abs(config.parallax_bg_shift) }

            PropertyChanges { target: pagePower;    enabled: false; focus: false; x: -areaMain.width }
            PropertyChanges { target: pageSessions; enabled: true ; focus: true ; x: 0 }
            PropertyChanges { target: pageUsers;    enabled: false; focus: false; x: areaMain.width }

            PropertyChanges { target: buttonPagePower;    highlighted: false }
            PropertyChanges { target: buttonPageSessions; highlighted: true  }
            PropertyChanges { target: buttonPageUsers;    highlighted: false }
        },
        State
        {
            name: "stateUsers"

            PropertyChanges { target: background; x: (config.parallax_bg_shift > 0 ? geometry.x - Math.abs(config.parallax_bg_shift*2) : geometry.x )  }

            PropertyChanges { target: pagePower;    enabled: false; focus: false; x: -areaMain.width * 2 }
            PropertyChanges { target: pageSessions; enabled: false; focus: false; x: -areaMain.width }
            PropertyChanges { target: pageUsers;    enabled: true ; focus: true ; x: 0 }

            PropertyChanges { target: buttonPagePower;    highlighted: false }
            PropertyChanges { target: buttonPageSessions; highlighted: false }
            PropertyChanges { target: buttonPageUsers;    highlighted: true  }
        }
    ]

    TextConstants { id: localeText }

    function bgFillMode() {

        switch(config.bg_mode)
        {
            case "aspect":
                return Image.PreserveAspectCrop;

            case "fill":
                return Image.Stretch;

            case "tile":
                return Image.Tile;

            default:
                return Image.Pad;
        }
    }

    Background
    {
        id: background
        x: (config.parallax_bg_shift > 0 ? geometry.x - Math.abs(config.parallax_bg_shift*2) : geometry.x )
        y: geometry.y
        width: geometry.width + Math.abs(config.parallax_bg_shift*2)
        height: geometry.height
        source: config.background
        fillMode: bgFillMode()
        visible: status != Image.Error

        Behavior on x { NumberAnimation { duration: 150 } }
    }

    ColorScheme { id: colors }

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
            x: buttonPagePower.x + buttonPagePower.widthPartial + buttonPageSessions.widthPartial + 6
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
            highlighted: keyboard.capsLock

            onClicked: keyboard.capsLock = !keyboard.capsLock
        }

        SlicedButton
        {
            id: buttonNumLock
            x: buttonCapsLock.x + buttonCapsLock.widthPartial + 3
            y: 5

            text: "Num Lock"
            highlighted: keyboard.numLock

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

    MouseArea
    {
        id: scrollMouseArea
        anchors.fill: parent
        propagateComposedEvents: true
        enabled: root.state != "stateUsers" || !pageUsers.hasLoginShown
        onWheel:
        {
            switch (root.state)
            {
                case "statePower":
                    if (wheel.pixelDelta.y < 0)
                        pagePower.scroll_up()
                    else
                        pagePower.scroll_down()
                    break

                case "stateSessions":
                    if (wheel.pixelDelta.y < 0)
                        pageSessions.scroll_up()
                    else
                        pageSessions.scroll_down()
                    break

                case "stateUsers":
                    if (!pageUsers.hasLoginShown)
                    {
                        if (wheel.pixelDelta.y < 0)
                            pageUsers.scroll_up()
                        else
                            pageUsers.scroll_down()
                    }
                    break
            }
        }
    }
}

