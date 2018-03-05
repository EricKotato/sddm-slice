import QtQuick 2.7
import QtQuick.Controls 1.4


Item
{
    id: buttonRoot
    height: 25

    property int fontSize: 13
    property string text: ""

    property bool hasLeftSlice: true
    property bool hasRightSlice: true

    property bool selected: false
    readonly property int skew: 15

    readonly property int paddingLeft: hasLeftSlice ? skew : 5
    property int paddingTop: 3
    readonly property int paddingRight: hasRightSlice ? skew : 5

    readonly property int widthFull: buttonText.width + paddingLeft + paddingRight
    readonly property int widthPartial: buttonText.width + paddingLeft

    signal clicked()

    Behavior on x
    {
        PropertyAnimation { duration: 100 }
    }

    onSelectedChanged:
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
                bgColor: selected ? config.color_button_bg_selected : config.color_button_bg_idle
            }

            PropertyChanges
            {
                target: buttonBgCenter;
                color: selected ? config.color_button_bg_selected : config.color_button_bg_idle
            }

            PropertyChanges
            {
                target: buttonBgSliceRight;
                bgColor: selected ? config.color_button_bg_selected : config.color_button_bg_idle
            }
        },
        State
        {
            name: "hover"
            PropertyChanges
            {
                target: buttonBgSliceLeft;
                bgColor: selected ? config.color_button_bg_selected_hover : config.color_button_bg_hover
            }

            PropertyChanges
            {
                target: buttonBgCenter;
                color: selected ? config.color_button_bg_selected_hover : config.color_button_bg_hover
            }

            PropertyChanges
            {
                target: buttonBgSliceRight;
                bgColor: selected ? config.color_button_bg_selected_hover : config.color_button_bg_hover
            }
        }
    ]

    Canvas
    {
        id: buttonBgSliceLeft

        width: paddingLeft
        height: parent.height
        property string bgColor: config.color_button_bg_idle

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
        color: config.color_button_bg_idle
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
        property string bgColor: config.color_button_bg_idle

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


    Label
    {
        id: buttonText
        x: paddingLeft
        y: paddingTop
        color: config.color_button_text

        font
        {
            family: config.font
            bold: true
            pointSize: fontSize
            capitalization: Font.AllUppercase
        }

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