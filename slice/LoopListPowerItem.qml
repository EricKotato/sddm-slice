import QtQuick 2.7
import Qt5Compat.GraphicalEffects

Item
{
    id: itemRoot
    opacity: distance
    property int duration: 100
    width: parent.width
    height: descriptionLabel.height + textBoxPaddingBottom + textBoxPaddingTop

    property bool hover: false

    property int textBoxPaddingTop: sizes.paddingTopItemPower
    property int textBoxPaddingLeft: sizes.paddingLeftItemPower
    property int textBoxPaddingBottom: sizes.paddingBottomItemPower
    property int textBoxPaddingRight: sizes.paddingRightItemPower

    property int imagePadding: sizes.imagePaddingItemPower
    property int textBoxMargin: sizes.spacingItemPower

    signal clicked()
    signal entered()

    transform: Scale
    {
        origin.x: itemRoot.height + textBoxMargin
        origin.y: itemRoot.height / 2
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
    readonly property int imageWidth: itemRoot.height - (imagePadding * 2)


    Rectangle
    {
        width: itemRoot.height
        height: itemRoot.height
        color: ( hover ? colors.iconBgHover : colors.iconBg )
    }

    Image
    {
        id: powerItemIcon
        source: icon
        sourceSize.width: imageWidth
        sourceSize.height: imageWidth
        x: imagePadding
        y: imagePadding
        opacity: 0
    }

    ColorOverlay
    {
        id: powerItemIconOverlay
        anchors.fill: powerItemIcon
        source: powerItemIcon
        color: ( hover ? colors.iconHover : colors.icon )
        opacity: parent.opacity
    }

    Rectangle
    {
        id: textBackground
        x: itemRoot.height + textBoxMargin
        width: parent.width - x
        height: itemRoot.height
        color: ( hover ? colors.textBgHover : colors.textBg )
    }

    Text
    {
        id: descriptionLabel
        text: itemRoot.title
        color: ( hover ? colors.textHover : colors.text )
        width: parent.width - x - textBoxPaddingRight

        font: fonts.listItemMed
        elide: Text.ElideRight

        x: textBackground.x + textBoxPaddingLeft
        y: textBoxPaddingTop
    }

    MouseArea
    {
        width: itemRoot.width
        height: itemRoot.height
        hoverEnabled: true

        onClicked: itemRoot.clicked()
        onEntered: itemRoot.entered()
    }
}
