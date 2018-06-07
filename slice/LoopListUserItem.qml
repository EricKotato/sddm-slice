import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0

Item
{
    id: itemRoot
    opacity: distance
    width: parent.width
    
    property bool hover: false
    property bool hoverEnabled: true

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
        sourceSize.width: 60
        sourceSize.height: 60
        x: 4
        y: 4
    }

    Rectangle
    {
        width: 68
        height: 68
        color: ( hoverEnabled && hover ? colors.iconBgHover : colors.iconBg )
    }


    Text
    {
        text: userName
        color: ( hoverEnabled && hover ? colors.textHover : colors.text )
        
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
        color: ( hoverEnabled && hover ? (userName == "" ? colors.textHover : colors.textDimmedHover ) : (userName == "" ? colors.text : colors.textDimmed ) )
        y: userName == "" ? 6 : 36
        font
        {
            family: config.font
            pointSize: userName == "" ? 36 : 20
            bold: userName == ""
        }
        x: 80
    }

    Rectangle
    {
        x: 70
        y: 0
        width: parent.width - 70
        height: 68
        color: ( hoverEnabled && hover ? colors.textBgHover : colors.textBg )
    }
}