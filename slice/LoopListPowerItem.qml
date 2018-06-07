import QtQuick 2.7
import QtGraphicalEffects 1.0

Item
{
    id: itemRoot
    opacity: distance
    property int duration: 100
    width: parent.width
    property bool hover: false

    signal clicked()
    signal entered()

    transform: Scale
    {
        origin.x: 54
        origin.y: 29
        xScale: distance
        yScale: distance
    }

    Behavior on distance
    {
        PropertyAnimation { duration: itemRoot.duration }
    }

    property real distance: 1.0
    property string icon: "icons/no_avatar.svg"
    property string title: ""

    Image
    {
        id: powerItemIcon
        source: icon
        sourceSize.width: 48
        sourceSize.height: 48
        x: 2
        y: 2
    }

    ColorOverlay
    {
        id: powerItemIconOverlay
        anchors.fill: powerItemIcon
        source: powerItemIcon
        color: ( hover ? colors.iconHover : colors.icon )
    }

    Rectangle
    {
        width: 52
        height: 52
        color: ( hover ? colors.iconBgHover : colors.iconBg )
    }

    Text
    {
        id: descriptionLabel
        text: itemRoot.title
        color: ( hover ? colors.textHover : colors.text )

        font
        {
            family: config.font
            pointSize: 28
            bold: true
        }

        x: 64
        y: 5
    }

    Rectangle
    {
        x: 54
        width: parent.width - 54
        height: 52
        color: ( hover ? colors.textBgHover : colors.textBg )
    }

    MouseArea
    {
        width: descriptionLabel.x + descriptionLabel.width
        height: 52
        hoverEnabled: true

        onClicked: itemRoot.clicked()
        onEntered: itemRoot.entered()
    }
}