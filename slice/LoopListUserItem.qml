import QtQuick 2.7
import QtGraphicalEffects 1.0
import SddmComponents 2.0
import QtQuick.Controls 2.0

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

    ColorOverlay
    {
        id: profilePictureOverlay
        anchors.fill: profilePicture
        source: profilePicture
        color: "#dddddd"
    }

    Label
    {
        text: userName
        color: "#fff"
        
        font
        {
            family: "Roboto"
            pointSize: 28
            bold: true
        }

        x: 80
        y: 0
    }

    Label
    {
        text: userLogin
        color: "#fff"
        y: userName == "" ? 5 : 36
        font
        {
            family: "Roboto"
            pointSize: userName == "" ? 36 : 20
            bold: userName == ""
        }
        x: 80
    }
}