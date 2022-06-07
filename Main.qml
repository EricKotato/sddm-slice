import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0

import "slice"

Rectangle
{
    id: root
    color: colors.background
    property variant geometry: screenModel.geometry(screenModel.primary)
    //property bool virtualkeyboard: bool(config.virtualkeyboard)

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

    function bool(str) {
        if (str === null || str === undefined)
            return false;

        str = str.toLowerCase();

        if (str === "false" || str === "no")
            return false;
        else if (str === "true" || str === "yes")
            return true;

        return Boolean(Number(str).valueOf()).valueOf();
    }

    function not_null(str) {
        return !(str === null || str === undefined);
    }

    TextConstants { id: localeText }
    Debug { id: debug }

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

    SizeScheme { id: sizes }
    ColorScheme { id: colors }
    FontScheme { id: fonts }

    Item
    {
        id: areaTop
        x: 0
        y: 0
        width: root.width
        height: Math.max(buttonPagePower.height, buttonPageSessions.height, buttonPageUsers.height) + sizes.offsetVerticalSlicesTop + 5

        SlicedButton
        {
            id: buttonPagePower
            x: sizes.offsetHorizontalSlicesTop
            y: sizes.offsetVerticalSlicesTop

            skewRight: sizes.skewSlicesTop
            skewLeft: 0

            text: debug.hostName ? debug.hostName : "Hostname"

            enabled: debug.canPowerOff || debug.canReboot || debug.canSuspend || debug.canHibernate || debug.canHybridSleep

            onClicked: if (enabled) root.state = "statePower"

            font: fonts.slicesTop

            paddingLeft: sizes.paddingLeftSlicesTop
            paddingRight: sizes.paddingRightSlicesTop
            paddingTop: sizes.paddingTopSlicesTop
            paddingBottom: sizes.paddingBottomSlicesTop
        }

        SlicedButton
        {
            id: buttonPageSessions
            x: buttonPagePower.x + buttonPagePower.widthPartial + sizes.spacingSlicesTop
            y: sizes.offsetVerticalSlicesTop

            skewLeft: sizes.skewSlicesTop
            skewRight: sizes.skewSlicesTop

            text: pageSessions.currentSessionName

            onClicked: root.state = "stateSessions"

            font: fonts.slicesTop

            paddingLeft: sizes.paddingLeftSlicesTop
            paddingRight: sizes.paddingRightSlicesTop
            paddingTop: sizes.paddingTopSlicesTop
            paddingBottom: sizes.paddingBottomSlicesTop
        }

        SlicedButton
        {
            id: buttonPageUsers
            x: buttonPagePower.x + buttonPagePower.widthPartial + buttonPageSessions.widthPartial + ( sizes.spacingSlicesTop * 2 )
            y: sizes.offsetVerticalSlicesTop

            skewLeft: sizes.skewSlicesTop
            skewRight: sizes.skewSlicesTop

            text: pageUsers.currentUserLogin

            onClicked: root.state = "stateUsers"

            font: fonts.slicesTop

            paddingLeft: sizes.paddingLeftSlicesTop
            paddingRight: sizes.paddingRightSlicesTop
            paddingTop: sizes.paddingTopSlicesTop
            paddingBottom: sizes.paddingBottomSlicesTop
        }
    }

    Item
    {
        id: areaMain
        x: 0
        y: areaTop.height
        width: root.width
        height: root.height - areaTop.height - areaBottom.height

        PagePower
        {
            id: pagePower
            width: areaMain.width
            height: areaMain.height

            Behavior on x { NumberAnimation { duration: 150 } }
        }

        PageSessions
        {
            id: pageSessions
            width: areaMain.width
            height: areaMain.height

            Behavior on x { NumberAnimation { duration: 150 } }

            onSelectedIndexChanged: pageUsers.selectedSessionIndex = selectedIndex

            onSessionSelected: root.state = "stateUsers"
        }

        PageUsers
        {
            id: pageUsers
            width: areaMain.width
            height: areaMain.height
            y: inputPanel.visible && inputPanel.y != areaMain.height + areaBottom.height ? -150 : 0

            Behavior on x { NumberAnimation { duration: 150 } }
            Behavior on y { NumberAnimation { duration: 150 } }

            onLockNav: areaTop.enabled = false
            onUnlockNav: areaTop.enabled = true
        }

        Loader {
            id: inputPanel
            source: "slice/VirtualKeyboard.qml"
            width: areaMain.width
            y: areaMain.height - 350 - areaBottom.height
            Behavior on y { NumberAnimation { duration: 150 } }
            //visible: virtualkeyboard
            visible: false
        }
    }

    Item
    {
        id: areaBottom
        x: 0
        y: root.height - height
        width: root.width
        height: Math.max(
                    buttonCapsLock.height,
                    buttonNumLock.height,
                    buttonKeyboardLayout.height,
                    buttonWeekday.height,
                    buttonDate.height,
                    buttonTime.height
                ) + 10

        SlicedButton
        {
            id: buttonCapsLock
            x: sizes.offsetHorizontalSlicesBottomLeft
            y: areaBottom.height - height - sizes.offsetVerticalSlicesBottomLeft


            skewLeft: 0
            skewRight: sizes.skewSlicesBottomLeft

            text: "Caps Lock"
            highlighted: keyboard.capsLock

            onClicked: keyboard.capsLock = !keyboard.capsLock

            font: fonts.slicesBottomLeft

            paddingLeft: sizes.paddingLeftSlicesBottomLeft
            paddingRight: sizes.paddingRightSlicesBottomLeft
            paddingTop: sizes.paddingTopSlicesBottomLeft
            paddingBottom: sizes.paddingBottomSlicesBottomLeft
        }

        SlicedButton
        {
            id: buttonNumLock
            x: buttonCapsLock.x + buttonCapsLock.widthPartial + sizes.spacingSlicesBottomLeft
            y: areaBottom.height - height - sizes.offsetVerticalSlicesBottomLeft

            skewLeft: sizes.skewSlicesBottomLeft
            skewRight: sizes.skewSlicesBottomLeft

            text: "Num Lock"
            highlighted: keyboard.numLock

            onClicked: keyboard.numLock = !keyboard.numLock

            font: fonts.slicesBottomLeft

            paddingLeft: sizes.paddingLeftSlicesBottomLeft
            paddingRight: sizes.paddingRightSlicesBottomLeft
            paddingTop: sizes.paddingTopSlicesBottomLeft
            paddingBottom: sizes.paddingBottomSlicesBottomLeft
        }

        SlicedButton
        {
            id: buttonKeyboardLayout
            x: buttonNumLock.x + buttonNumLock.widthPartial + sizes.spacingSlicesBottomLeft
            y: areaBottom.height - height - sizes.offsetVerticalSlicesBottomLeft

            skewLeft: sizes.skewSlicesBottomLeft
            skewRight: sizes.skewSlicesBottomLeft

            text: keyboard.layouts[keyboard.currentLayout].longName
            onClicked: {
                var newId = keyboard.currentLayout+1;
                if (newId >= keyboard.layouts.length)
                    newId = 0;
                keyboard.currentLayout = newId;
            }

            font: fonts.slicesBottomLeft

            paddingLeft: sizes.paddingLeftSlicesBottomLeft
            paddingRight: sizes.paddingRightSlicesBottomLeft
            paddingTop: sizes.paddingTopSlicesBottomLeft
            paddingBottom: sizes.paddingBottomSlicesBottomLeft
        }

        Item
        {
            id: dateTimeArea
            x: areaBottom.width - width - sizes.offsetHorizontalSlicesBottomRight
            width:
                buttonWeekday.widthPartial +
                buttonDate.widthPartial +
                buttonTime.widthFull +
                ( sizes.spacingSlicesBottomRight * 2 )

            SlicedButton
            {
                id: buttonWeekday
                enabled: false
                x: 0
                y: areaBottom.height - height - sizes.offsetVerticalSlicesBottomRight

                skewLeft: sizes.skewSlicesBottomRight
                skewRight: sizes.skewSlicesBottomRight

                function updateTime()
                {
                    text = new Date().toLocaleString(Qt.locale(),
                        "dddd")
                }

                font: fonts.slicesBottomRight

                paddingLeft: sizes.paddingLeftSlicesBottomRight
                paddingRight: sizes.paddingRightSlicesBottomRight
                paddingTop: sizes.paddingTopSlicesBottomRight
                paddingBottom: sizes.paddingBottomSlicesBottomRight
            }

            SlicedButton
            {
                id: buttonDate
                enabled: false
                x: buttonWeekday.x + buttonWeekday.widthPartial + sizes.spacingSlicesBottomRight
                y: areaBottom.height - height - sizes.offsetVerticalSlicesBottomRight

                skewLeft: sizes.skewSlicesBottomRight
                skewRight: sizes.skewSlicesBottomRight

                function updateTime()
                {
                    text = new Date().toLocaleString(Qt.locale(),
                        "dd.MM.yyyy")
                }

                font: fonts.slicesBottomRight

                paddingLeft: sizes.paddingLeftSlicesBottomRight
                paddingRight: sizes.paddingRightSlicesBottomRight
                paddingTop: sizes.paddingTopSlicesBottomRight
                paddingBottom: sizes.paddingBottomSlicesBottomRight
            }

            SlicedButton
            {
                id: buttonTime
                enabled: false
                x: buttonDate.x + buttonDate.widthPartial + sizes.spacingSlicesBottomRight
                y: areaBottom.height - height - sizes.offsetVerticalSlicesBottomRight

                skewLeft: sizes.skewSlicesBottomRight
                skewRight: 0

                function updateTime()
                {
                    text = new Date().toLocaleString(Qt.locale(),
                        "hh:mm:ss")
                }

                font: fonts.slicesBottomRight

                paddingLeft: sizes.paddingLeftSlicesBottomRight
                paddingRight: sizes.paddingRightSlicesBottomRight
                paddingTop: sizes.paddingTopSlicesBottomRight
                paddingBottom: sizes.paddingBottomSlicesBottomRight
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
                    if (wheel.angleDelta.y < 0)
                        pagePower.scroll_up()
                    else
                        pagePower.scroll_down()
                    break

                case "stateSessions":
                    if (wheel.angleDelta.y < 0)
                        pageSessions.scroll_up()
                    else
                        pageSessions.scroll_down()
                    break

                case "stateUsers":
                    if (!pageUsers.hasLoginShown)
                    {
                        if (wheel.angleDelta.y < 0)
                            pageUsers.scroll_up()
                        else
                            pageUsers.scroll_down()
                    }
                    break
            }
        }
    }

    function nextScreen() {
        switch(root.state)
        {
            case "statePower":
                root.state = "stateSessions";
                break;

            case "stateSessions":
                root.state = "stateUsers";
                break;

            case "stateUsers":
                root.state = (buttonPagePower.enabled) ? "statePower" : "stateSessions";
                break;
        }
    }

    function previousScreen() {
        switch(root.state)
        {
            case "statePower":
                root.state = "stateUsers";
                break;

            case "stateSessions":
                root.state = (buttonPagePower.enabled) ? "statePower" : "stateUsers";
                break;

            case "stateUsers":
                root.state = "stateSessions";
                break;
        }
    }

    Keys.onTabPressed: nextScreen()
    Keys.onBacktabPressed: previousScreen()
    Keys.onLeftPressed: previousScreen()
    Keys.onRightPressed: nextScreen()
}
