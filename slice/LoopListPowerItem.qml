import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0
import QtQuick.Controls 2.0

Item
{
    id: itemRoot
    opacity: distance
    property int duration: 100

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
    }

    ColorOverlay
    {
        id: powerItemIconOverlay
        anchors.fill: powerItemIcon
        source: powerItemIcon
        color: "#dddddd"
    }

    Label
    {
        id: descriptionLabel
        text: itemRoot.title
        color: "#fff"

        font
        {
            family: config.font
            pointSize: 28
            bold: true
        }

        x: 54
        y: 5
    }

    MouseArea
    {
        width: descriptionLabel.x + descriptionLabel.width
        height: 48
        hoverEnabled: true

        onClicked: itemRoot.clicked()
        onEntered: itemRoot.entered()
    }
}