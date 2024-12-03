import QtQuick 2.7

Item
{
    /* * * * * * * * * * * * * * * * * *
    *
    *  Functions
    *
    * * * * * * * * * * * * * * * * * */
    function not_null(str) {
        if (str === false || str === 0 || str === "") return true
        return !(str === null || str === undefined);
    }


    /* * * * * * * * * * * * * * * * * *
    *
    *  Layer 1 options
    *  Base values, Required
    *
    * * * * * * * * * * * * * * * * * */

    property int userAreaWidth: config.user_area_width
    property int powerAreaWidth: config.power_area_width
    // Offset
    property int offsetSlices: config.offset_slices

    // Padding
    property int paddingSlices: config.padding_slices

    // Spacing
    property int spacingSlices: config.spacing_slices

    // Skew
    property int skewSlices: config.skew_slices

    // Image padding
    property int imagePadding: config.image_padding

    // LoopList item spacing
    property int spacingItem: config.spacing_item

    // LoopList item padding
    property int paddingItem: config.padding_item


    /* * * * * * * * * * * * * * * * * *
    *
    *  Layer 2 options
    *  Section specific values
    *
    * * * * * * * * * * * * * * * * * */
    // Offset
    property int offsetSlicesTop:
    {
        if (not_null(config.offset_slices_top)) return config.offset_slices_top
        else                                    return offsetSlices
    }

    property int offsetSlicesBottomRight:
    {
        if (not_null(config.offset_slices_bottom_right)) return config.offset_slices_bottom_right
        else                                             return offsetSlices
    }

    property int offsetSlicesBottomLeft:
    {
        if (not_null(config.offset_slices_bottom_left)) return config.offset_slices_bottom_left
        else                                            return offsetSlices
    }

    property int offsetSlicesLoginButtons:
    {
        if (not_null(config.offset_slices_login_buttons)) return config.offset_slices_login_buttons
        else                                              return offsetSlices
    }


    // Padding - this is direction specific here, and section specific in level 3
    property int paddingLeftSlices:
    {
        if (not_null(config.padding_left_slices))            return config.padding_left_slices
        else if (not_null(config.padding_horizontal_slices)) return config.padding_horizontal_slices
        else                                                 return paddingSlices
    }

    property int paddingRightSlices:
    {
        if (not_null(config.padding_right_slices))           return config.padding_right_slices
        else if (not_null(config.padding_horizontal_slices)) return config.padding_horizontal_slices
        else                                                 return paddingSlices
    }
    property int paddingTopSlices:
    {
        if (not_null(config.padding_top_slices))           return config.padding_top_slices
        else if (not_null(config.padding_vertical_slices)) return config.padding_vertical_slices
        else                                               return paddingSlices
    }

    property int paddingBottomSlices:
    {
        if (not_null(config.padding_bottom_slices))        return config.padding_bottom_slices
        else if (not_null(config.padding_vertical_slices)) return config.padding_vertical_slices
        else                                               return paddingSlices
    }

    // Spacing
    property int spacingSlicesTop:
    {
        if (not_null(config.spacing_slices_top)) return config.spacing_slices_top
        else                                     return spacingSlices
    }

    property int spacingSlicesBottomRight:
    {
        if (not_null(config.spacing_slices_bottom_right)) return config.spacing_slices_bottom_right
        else                                              return spacingSlices
    }

    property int spacingSlicesBottomLeft:
    {
        if (not_null(config.spacing_slices_bottom_left)) return config.spacing_slices_bottom_left
        else                                             return spacingSlices
    }

    property int spacingSlicesLoginButtons:
    {
        if (not_null(config.spacing_slices_login_buttons)) return config.spacing_slices_login_buttons
        else                                               return spacingSlices
    }

    // Skew
    property int skewSlicesTop:
    {
        if (not_null(config.skew_slices_top)) return config.skew_slices_top
        else                                  return skewSlices
    }

    property int skewSlicesBottomLeft:
    {
        if (not_null(config.skew_slices_bottom_left)) return config.skew_slices_bottom_left
        else                                          return skewSlices
    }

    property int skewSlicesBottomRight:
    {
        if (not_null(config.skew_slices_bottom_right)) return config.skew_slices_bottom_right
        else                                           return skewSlices
    }

    property int skewSlicesLoginButtons:
    {
        if (not_null(config.skew_slices_login_buttons)) return config.skew_slices_login_buttons
        else                                            return skewSlices
    }


    //// LoopList item image padding
    property int imagePaddingItemPower:
    {
        if (not_null(config.image_padding_item_power)) return config.image_padding_item_power
        else                                           return imagePadding
    }
    property int imagePaddingItemUser:
    {
        if (not_null(config.image_padding_item_user)) return config.image_padding_item_user
        else                                          return imagePadding
    }

    //// LoopList item spacing
    property int spacingItemPower:
    {
        if (not_null(config.spacing_item_power)) return config.spacing_item_power
        else                                     return spacingItem
    }

    property int spacingItemUser:
    {
        if (not_null(config.spacing_item_user)) return config.spacing_item_user
        else                                    return spacingItem
    }

    //// LoopList item padding
    property int paddingLeftItem:
    {
        if (not_null(config.padding_left_item))            return config.padding_left_item
        else if (not_null(config.padding_horizontal_item)) return config.padding_horizontal_item
        else                                               return paddingItem
    }

    property int paddingRightItem:
    {
        if (not_null(config.padding_right_item))           return config.padding_right_item
        else if (not_null(config.padding_horizontal_item)) return config.padding_horizontal_item
        else                                               return paddingItem
    }

    property int paddingTopItem:
    {
        if (not_null(config.padding_top_item))           return config.padding_top_item
        else if (not_null(config.padding_vertical_item)) return config.padding_vertical_item
        else                                             return paddingItem
    }

    property int paddingBottomItem:
    {
        if (not_null(config.padding_bottom_item))        return config.padding_bottom_item
        else if (not_null(config.padding_vertical_item)) return config.padding_vertical_item
        else                                             return paddingItem
    }



    //// LoopList item section offsets
    property int offsetSubHeadItemUser:
    {
        if (not_null(config.offset_sub_head_item_user)) return config.offset_sub_head_item_user
        else                                            return 0
    }

    property int offsetLowerCaseItemUser:
    {
        if (not_null(config.offset_lower_case_item_user)) return config.offset_lower_case_item_user
        else                                              return 0
    }



    /* * * * * * * * * * * * * * * * * *
    *
    *  Layer 3 options
    *  Direction specific values
    *
    * * * * * * * * * * * * * * * * * */
    // Offset
    //// Top
    property int offsetHorizontalSlicesTop:
    {
        if (not_null(config.offset_horizontal_slices_top)) return config.offset_horizontal_slices_top
        else                                               return offsetSlicesTop
    }

    property int offsetVerticalSlicesTop:
    {
        if (not_null(config.offset_vertical_slices_top)) return config.offset_vertical_slices_top
        else                                             return offsetSlicesTop
    }

    //// Bottom Right
    property int offsetHorizontalSlicesBottomRight:
    {
        if (not_null(config.offset_horizontal_slices_bottom_right)) return config.offset_horizontal_slices_bottom_right
        else                                                        return offsetSlicesBottomRight
    }

    property int offsetVerticalSlicesBottomRight:
    {
        if (not_null(config.offset_vertical_slices_bottom_right)) return config.offset_vertical_slices_bottom_right
        else                                                      return offsetSlicesBottomRight
    }

    //// Bottom Left
    property int offsetHorizontalSlicesBottomLeft:
    {
        if (not_null(config.offset_horizontal_slices_bottom_left)) return config.offset_horizontal_slices_bottom_left
        else                                                       return offsetSlicesBottomLeft
    }

    property int offsetVerticalSlicesBottomLeft:
    {
        if (not_null(config.offset_vertical_slices_bottom_left)) return config.offset_vertical_slices_bottom_left
        else                                                     return offsetSlicesBottomLeft
    }

    //// Login Buttons
    property int offsetHorizontalSlicesLoginButtons:
    {
        if (not_null(config.offset_horizontal_slices_login_buttons)) return config.offset_horizontal_slices_login_buttons
        else                                                         return offsetSlicesLoginButtons
    }

    property int offsetVerticalSlicesLoginButtons:
    {
        if (not_null(config.offset_vertical_slices_login_buttons)) return config.offset_vertical_slices_login_buttons
        else                                                       return offsetSlicesLoginButtons
    }

    // Padding
    //// Top
    property int paddingLeftSlicesTop:
    {
        if (not_null(config.padding_left_slices_top))            return config.padding_left_slices_top
        else if (not_null(config.padding_horizontal_slices_top)) return config.padding_horizontal_slices_top
        else if (not_null(config.padding_slices_top))            return config.padding_slices_top
        else                                                     return paddingLeftSlices
    }

    property int paddingRightSlicesTop:
    {
        if (not_null(config.padding_right_slices_top))           return config.padding_right_slices_top
        else if (not_null(config.padding_horizontal_slices_top)) return config.padding_horizontal_slices_top
        else if (not_null(config.padding_slices_top))            return config.padding_slices_top
        else                                                     return paddingRightSlices
    }

    property int paddingBottomSlicesTop:
    {
        if (not_null(config.padding_bottom_slices_top))        return config.padding_bottom_slices_top
        else if (not_null(config.padding_vertical_slices_top)) return config.padding_vertical_slices_top
        else if (not_null(config.padding_slices_top))          return config.padding_slices_top
        else                                                   return paddingBottomSlices
    }

    property int paddingTopSlicesTop:
    {
        if (not_null(config.padding_top_slices_top))           return config.padding_top_slices_top
        else if (not_null(config.padding_vertical_slices_top)) return config.padding_vertical_slices_top
        else if (not_null(config.padding_slices_top))          return config.padding_slices_top
        else                                                   return paddingTopSlices
    }

    //// Bottom Right
    property int paddingLeftSlicesBottomRight:
    {
        if (not_null(config.padding_left_slices_bottom_right))            return config.padding_left_slices_bottom_right
        else if (not_null(config.padding_horizontal_slices_bottom_right)) return config.padding_horizontal_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))            return config.padding_slices_bottom_right
        else                                                              return paddingLeftSlices
    }

    property int paddingBottomSlicesBottomRight:
    {
        if (not_null(config.padding_bottom_slices_bottom_right))        return config.padding_bottom_slices_bottom_right
        else if (not_null(config.padding_vertical_slices_bottom_right)) return config.padding_vertical_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))          return config.padding_slices_bottom_right
        else                                                            return paddingBottomSlices
    }

    property int paddingRightSlicesBottomRight:
    {
        if (not_null(config.padding_right_slices_bottom_right))           return config.padding_right_slices_bottom_right
        else if (not_null(config.padding_horizontal_slices_bottom_right)) return config.padding_horizontal_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))            return config.padding_slices_bottom_right
        else                                                              return paddingRightSlices
    }

    property int paddingTopSlicesBottomRight:
    {
        if (not_null(config.padding_top_slices_bottom_right))           return config.padding_top_slices_bottom_right
        else if (not_null(config.padding_vertical_slices_bottom_right)) return config.padding_vertical_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))          return config.padding_slices_bottom_right
        else                                                            return paddingTopSlices
    }

    //// Bottom Left
    property int paddingLeftSlicesBottomLeft:
    {
        if (not_null(config.padding_left_slices_bottom_left))            return config.padding_left_slices_bottom_left
        else if (not_null(config.padding_horizontal_slices_bottom_left)) return config.padding_horizontal_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))            return config.padding_slices_bottom_left
        else                                                             return paddingLeftSlices
    }

    property int paddingRightSlicesBottomLeft:
    {
        if (not_null(config.padding_right_slices_bottom_left))           return config.padding_right_slices_bottom_left
        else if (not_null(config.padding_horizontal_slices_bottom_left)) return config.padding_horizontal_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))            return config.padding_slices_bottom_left
        else                                                             return paddingRightSlices
    }

    property int paddingBottomSlicesBottomLeft:
    {
        if (not_null(config.padding_bottom_slices_bottom_left))        return config.padding_bottom_slices_bottom_left
        else if (not_null(config.padding_vertical_slices_bottom_left)) return config.padding_vertical_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))          return config.padding_slices_bottom_left
        else                                                           return paddingBottomSlices
    }

    property int paddingTopSlicesBottomLeft:
    {
        if (not_null(config.padding_top_slices_bottom_left))           return config.padding_top_slices_bottom_left
        else if (not_null(config.padding_vertical_slices_bottom_left)) return config.padding_vertical_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))          return config.padding_slices_bottom_left
        else                                                           return paddingTopSlices
    }

    //// LoginButtons
    property int paddingLeftSlicesLoginButtons:
    {
        if (not_null(config.padding_left_slices_login_buttons))            return config.padding_left_slices_login_buttons
        else if (not_null(config.padding_horizontal_slices_login_buttons)) return config.padding_horizontal_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))            return config.padding_slices_login_buttons
        else                                                               return paddingLeftSlices
    }

    property int paddingRightSlicesLoginButtons:
    {
        if (not_null(config.padding_right_slices_login_buttons))           return config.padding_right_slices_login_buttons
        else if (not_null(config.padding_horizontal_slices_login_buttons)) return config.padding_horizontal_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))            return config.padding_slices_login_buttons
        else                                                               return paddingRightSlices
    }

    property int paddingTopSlicesLoginButtons:
    {
        if (not_null(config.padding_top_slices_login_buttons))           return config.padding_top_slices_login_buttons
        else if (not_null(config.padding_vertical_slices_login_buttons)) return config.padding_vertical_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))          return config.padding_slices_login_buttons
        else                                                             return paddingTopSlices
    }

    property int paddingBottomSlicesLoginButtons:
    {
        if (not_null(config.padding_bottom_slices_login_buttons))        return config.padding_bottom_slices_login_buttons
        else if (not_null(config.padding_vertical_slices_login_buttons)) return config.padding_vertical_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))          return config.padding_slices_login_buttons
        else                                                             return paddingBottomSlices
    }

    //// LoopList item padding
    // Power LoopList items
    property int paddingTopItemPower:
    {
        if (not_null(config.padding_top_item_power))           return config.padding_top_item_power
        else if (not_null(config.padding_vertical_item_power)) return config.padding_vertical_item_power
        else if (not_null(config.padding_item_power))          return config.padding_item_power
        else                                                   return paddingTopItem
    }

    property int paddingLeftItemPower:
    {
        if (not_null(config.padding_left_item_power))            return config.padding_left_item_power
        else if (not_null(config.padding_horizontal_item_power)) return config.padding_horizontal_item_power
        else if (not_null(config.padding_item_power))            return config.padding_item_power
        else                                                     return paddingLeftItem
    }

    property int paddingBottomItemPower:
    {
        if (not_null(config.padding_bottom_item_power))        return config.padding_bottom_item_power
        else if (not_null(config.padding_vertical_item_power)) return config.padding_vertical_item_power
        else if (not_null(config.padding_item_power))          return config.padding_item_power
        else                                                   return paddingBottomItem
    }

    property int paddingRightItemPower:
    {
        if (not_null(config.padding_right_item_power))           return config.padding_right_item_power
        else if (not_null(config.padding_horizontal_item_power)) return config.padding_horizontal_item_power
        else if (not_null(config.padding_item_power))            return config.padding_item_power
        else                                                     return paddingRightItem
    }

    //// Session LoopList items
    property int paddingLeftItemSession:
    {
        if (not_null(config.padding_left_item_session))            return config.padding_left_item_session
        else if (not_null(config.padding_horizontal_item_session)) return config.padding_horizontal_item_session
        else if (not_null(config.padding_item_session))            return config.padding_item_session
        else                                                       return paddingLeftItem
    }

    property int paddingBottomItemSession:
    {
        if (not_null(config.padding_bottom_item_session))        return config.padding_bottom_item_session
        else if (not_null(config.padding_vertical_item_session)) return config.padding_vertical_item_session
        else if (not_null(config.padding_item_session))          return config.padding_item_session
        else                                                     return paddingBottomItem
    }

    property int paddingRightItemSession:
    {
        if (not_null(config.padding_right_item_session))           return config.padding_right_item_session
        else if (not_null(config.padding_horizontal_item_session)) return config.padding_horizontal_item_session
        else if (not_null(config.padding_item_session))            return config.padding_item_session
        else                                                       return paddingRightItem
    }

    property int paddingTopItemSession:
    {
        if (not_null(config.padding_top_item_session))           return config.padding_top_item_session
        else if (not_null(config.padding_vertical_item_session)) return config.padding_vertical_item_session
        else if (not_null(config.padding_item_session))          return config.padding_item_session
        else                                                     return paddingTopItem
    }

    //// User LoopList items
    property int paddingLeftItemUser:
    {
        if (not_null(config.padding_left_item_user))            return config.padding_left_item_user
        else if (not_null(config.padding_horizontal_item_user)) return config.padding_horizontal_item_user
        else if (not_null(config.padding_item_user))            return config.padding_item_user
        else                                                    return paddingLeftItem
    }

    property int paddingRightItemUser:
    {
        if (not_null(config.padding_right_item_user))           return config.padding_right_item_user
        else if (not_null(config.padding_horizontal_item_user)) return config.padding_horizontal_item_user
        else if (not_null(config.padding_item_user))            return config.padding_item_user
        else                                                    return paddingRightItem
    }

    property int paddingBottomItemUser:
    {
        if (not_null(config.padding_bottom_item_user))        return config.padding_bottom_item_user
        else if (not_null(config.padding_vertical_item_user)) return config.padding_vertical_item_user
        else if (not_null(config.padding_item_user))          return config.padding_item_user
        else                                                  return paddingBottomItem
    }

    property int paddingTopItemUser:
    {
        if (not_null(config.padding_top_item_user))           return config.padding_top_item_user
        else if (not_null(config.padding_vertical_item_user)) return config.padding_vertical_item_user
        else if (not_null(config.padding_item_user))          return config.padding_item_user
        else                                                  return paddingTopItem
    }
}
