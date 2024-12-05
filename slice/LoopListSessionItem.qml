import QtQuick 2.7
import Qt5Compat.GraphicalEffects
import SddmComponents 2.0

Item
{
    id: itemRoot
    opacity: computedDistance
    scale: computedDistance

    property real distance: 1.0
    readonly property real computedDistance: Math.sin(Math.PI / 2 * distance)
    property string sessionName: ""
    property bool hover: false

    property int textBoxPaddingLeft: sizes.paddingLeftItemSession
    property int textBoxPaddingRight: sizes.paddingRightItemSession
    property int textBoxPaddingTop: sizes.paddingTopItemSession
    property int textBoxPaddingBottom: sizes.paddingBottomItemSession

    Rectangle
    {
        x: sessionNameLabel.x - textBoxPaddingLeft
        y: sessionNameLabel.y - textBoxPaddingTop
        width: sessionNameLabel.width + textBoxPaddingLeft + textBoxPaddingRight
        height: sessionNameLabel.height + textBoxPaddingBottom + textBoxPaddingTop
        color: ( hover ? colors.textBgHover : colors.textBg )
    }

    Text
    {
        id: sessionNameLabel
        anchors.centerIn: parent
        text: sessionName
        color: ( hover ? colors.textHover : colors.text )

        font: fonts.listItemMed

        x: parent.x + textBoxPaddingLeft
        y: textBoxPaddingTop
    }
}
