import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0

Item
{
    id: itemRoot
    opacity: distance
    scale: distance

    property real distance: 1.0
    property string sessionName: ""

    Text
    {
        id: sessionNameLabel
        anchors.centerIn: parent
        text: sessionName
        color: config.color_text

        font
        {
            family: config.font
            pointSize: 28
            bold: true
        }

        x: parent.x + 10
        y: 5
    }

    Rectangle
    {
        x: sessionNameLabel.x - 10
        y: sessionNameLabel.y - 5
        width: sessionNameLabel.width + 20
        height: sessionNameLabel.height + 10
        color: config.color_text_bg
    }
}