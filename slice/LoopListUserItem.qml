import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0

Item
{
    id: itemRoot
    opacity: distance

    transform: Scale
    {
        origin.x: 80
        xScale: distance
        yScale: distance
    }

    property real distance: 1.0
    property string userName: ""
    property string userLogin: ""
    property string userAvatar: "icons/no_avatar.svg"

    Image
    {
        id: profilePicture
        source: userAvatar
        sourceSize.width: 64
        sourceSize.height: 64
    }

    Text
    {
        text: userName
        color: config.color_text
        
        font
        {
            family: config.font
            pointSize: 28
            bold: true
        }

        x: 80
        y: 0
    }

    Text
    {
        text: userLogin
        color: config.color_text
        y: userName == "" ? 5 : 36
        font
        {
            family: config.font
            pointSize: userName == "" ? 36 : 20
            bold: userName == ""
        }
        x: 80
    }
}