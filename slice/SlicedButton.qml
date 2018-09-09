import QtQuick 2.7

Item
{
    id: buttonRoot
    height: 25

    property font font: Qt.font({
        family: config.font,
        bold: true,
        pointSize: 13,
        capitalization: Font.AllUppercase
    });

    property string text: ""

    property bool hasLeftSlice: true
    property bool hasRightSlice: true

    property bool highlighted: false
    readonly property int skew: 15

    readonly property int paddingLeft: hasLeftSlice ? skew : 5
    property int paddingTop: 3
    readonly property int paddingRight: hasRightSlice ? skew : 5

    readonly property int widthFull: buttonText.width + paddingLeft + paddingRight
    readonly property int widthPartial: buttonText.width + paddingLeft

    property color bgIdle: colors.buttonBg
    property color bgHover: colors.buttonBgHover

    property color bgIdleHighlighted: colors.buttonBgHighlighted
    property color bgHoverHighlighted: colors.buttonBgHoverHighlighted

    property color textIdle: colors.buttonText
    property color textHover: colors.buttonTextHover

    property color textIdleHighlighted: colors.buttonTextHighlighted
    property color textHoverHighlighted: colors.buttonTextHoverHighlighted


    signal clicked()

    Behavior on x
    {
        PropertyAnimation { duration: 100 }
    }

    onHighlightedChanged:
    {
        buttonBgSliceLeft.requestPaint()
        buttonBgSliceRight.requestPaint()
    }

    onTextChanged:
    {
        buttonText.text = buttonRoot.text
    }

    state: "idle"
    states:
    [
        State
        {
            name: "idle"
            PropertyChanges
            {
                target: buttonBgSliceLeft;
                bgColor: highlighted ? bgIdleHighlighted : bgIdle
            }

            PropertyChanges
            {
                target: buttonBgCenter;
                color: highlighted ? bgIdleHighlighted : bgIdle
            }

            PropertyChanges
            {
                target: buttonBgSliceRight;
                bgColor: highlighted ? bgIdleHighlighted : bgIdle
            }

            PropertyChanges
            {
                target: buttonText;
                color: highlighted ? textIdleHighlighted : textIdle
            }
        },
        State
        {
            name: "hover"
            PropertyChanges
            {
                target: buttonBgSliceLeft;
                bgColor: highlighted ? bgHoverHighlighted : bgHover
            }

            PropertyChanges
            {
                target: buttonBgCenter;
                color: highlighted ? bgHoverHighlighted : bgHover
            }

            PropertyChanges
            {
                target: buttonBgSliceRight;
                bgColor: highlighted ? bgHoverHighlighted : bgHover
            }

            PropertyChanges
            {
                target: buttonText;
                color: highlighted ? textHoverHighlighted : textHover
            }
        }
    ]

    Canvas
    {
        id: buttonBgSliceLeft

        width: paddingLeft
        height: parent.height
        property string bgColor: colors.buttonBg

        onPaint:
        {

            var context = getContext("2d")
            context.clearRect(0, 0, width, height);
            context.fillStyle = bgColor

            context.beginPath()

            if (buttonRoot.hasLeftSlice)
                context.moveTo(paddingLeft, 0)
            else
            {
                context.moveTo(0, 0)
                context.lineTo(paddingLeft, 0)
            }

            context.lineTo(paddingLeft, height)
            context.lineTo(0, height)
            
            context.closePath()
            context.fill()
        }


        Behavior on x
        {
            PropertyAnimation { duration: 100 }
        }
    }

    Rectangle
    {
        id: buttonBgCenter
        color: colors.buttonBg
        x: paddingLeft
        width: buttonText.width
        height: parent.height

        Behavior on width
        {
            PropertyAnimation
            {
                duration: 100
                onStopped:
                {
                    buttonRoot.showTextAnimation.start()
                }
            }
        }


        Behavior on x
        {
            PropertyAnimation { duration: 100 }
        }
    }

    Canvas
    {
        id: buttonBgSliceRight

        x: widthPartial

        width: paddingRight
        height: parent.height
        property string bgColor: colors.buttonBg

        onPaint:
        {
            var context = getContext("2d")
            context.clearRect(0, 0, paddingRight, height);
            context.fillStyle = bgColor

            context.beginPath()

            context.moveTo(0, 0)
            context.lineTo(paddingRight, 0)

            if (!buttonRoot.hasRightSlice)
                context.lineTo(paddingRight, height)
            
            context.lineTo(0, height)
            
            context.closePath()
            context.fill()
        }

        Behavior on x
        {
            PropertyAnimation { duration: 100 }
        }
    }


    Text
    {
        id: buttonText
        x: paddingLeft
        y: paddingTop
        color: colors.buttonText

        font: buttonRoot.font

        text: ""

    }

    MouseArea
    {
        width: widthFull
        height: parent.height

        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onEntered: 
        {
            buttonRoot.state = "hover"
            buttonBgSliceLeft.requestPaint()
            buttonBgSliceRight.requestPaint()
        }

        onExited:
        {
            buttonRoot.state = "idle"
            buttonBgSliceLeft.requestPaint()
            buttonBgSliceRight.requestPaint()
        }

        onClicked: buttonRoot.clicked()
    }
}