import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0
import QtQuick.Controls 2.0

Item
{
    id: itemRoot
    opacity: distance
    scale: distance

    property real distance: 1.0
    property string sessionName: ""

    Label
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

        x: parent.x
        y: 0
    }
}