import QtQuick 2.7
import Qt5Compat.GraphicalEffects
import SddmComponents 2.0

Item
{
    id: itemRoot
    opacity: computedDistance
    width: parent.width
    height: loginIsMain ? userLoginText.height + 14 : userNameText.height + userLoginText.height - 4

    property bool hover: false
    property bool hoverEnabled: true

    transform: Scale
    {
        origin.x: itemRoot.height + 12
        xScale: computedDistance
        yScale: computedDistance
    }

    property real distance: 1.0
    readonly property real computedDistance: Math.sin(Math.PI / 2 * distance)
    property string userName: ""
    property string userLogin: ""
    property string userAvatar: "icons/no_avatar.svg"

    property int imagePadding: sizes.imagePaddingItemUser
    property int textBoxMargin: sizes.spacingItemUser
    property int subHeadOffset: sizes.offsetSubHeadItemUser
    property int lowerCaseOffset: sizes.offsetLowerCaseItemUser
    property int textBoxPaddingTop: sizes.paddingTopItemUser
    property int textBoxPaddingLeft: sizes.paddingLeftItemUser
    property int textBoxPaddingBottom: sizes.paddingBottomItemUser
    property int textBoxPaddingRight: sizes.paddingRightItemUser

    property int minHeight: 64 + (imagePadding * 2)
    readonly property int imageSize: itemRoot.height - (imagePadding * 2)
    readonly property bool loginIsMain: userName == ""

    Rectangle
    {
        id: iconBackground
        width: itemRoot.height
        height: itemRoot.height
        color: ( hoverEnabled && hover ? colors.iconBgHover : colors.iconBg )
    }

    Image
    {
        id: profilePicture
        source: userAvatar
        sourceSize.width: imageSize
        sourceSize.height: imageSize
        x: iconBackground.x + imagePadding
        y: imagePadding

    }

    Rectangle
    {
        id: textBackground
        x: iconBackground.x + iconBackground.width + textBoxMargin
        y: 0
        width: parent.width - x
        height: itemRoot.height
        color: ( hoverEnabled && hover ? colors.textBgHover : colors.textBg )
    }

    Text
    {
        id: userNameText
        text: userName
        color: ( hoverEnabled && hover ? colors.textHover : colors.text )

        font: fonts.listItemMed

        elide: Text.ElideRight

        x: textBackground.x + textBoxPaddingLeft
        y: textBackground.y + textBoxPaddingTop

        width: textBackground.width - textBoxPaddingLeft - textBoxPaddingRight
    }

    Text
    {
        id: userLoginText
        text: userLogin
        color: ( hoverEnabled && hover ? (loginIsMain ? colors.textHover : colors.textDimmedHover ) : (loginIsMain ? colors.text : colors.textDimmed ) )
        font: loginIsMain ? fonts.listItemBig : fonts.listItemSub

        y: userNameText.y + (loginIsMain ? lowerCaseOffset : (userNameText.height + subHeadOffset))
        x: userNameText.x

        elide: Text.ElideRight

        width: userNameText.width
    }
}
