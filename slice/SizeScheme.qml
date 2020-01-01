import QtQuick 2.7

Item
{
    /* * * * * * * * * * * * * * * * * *
     *
     *  Functions
     *
     * * * * * * * * * * * * * * * * * */
    function not_null(str) {
        return !(str === null || str === undefined);
    }
    
    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 0 options
     *  Defaults / Fallbacks
     *
     * * * * * * * * * * * * * * * * * */
    
    property int defaultSkewSlices:   26
    property int defaultPaddingSlices: 0
    property int defaultSpacingSlices: 3
    property int defaultOffsetSlices:  5
    

    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 2 options
     *  Common
     *
     * * * * * * * * * * * * * * * * * */
    // Offset
    property int offsetSlices:
    {
        if (not_null(config.offset_slices)) return config.offset_slices
        else                                return defaultOffsetSlices
    }

    property int offsetSlicesTop:
    {
        if (not_null(config.offset_slices_top)) return config.offset_slices_top
        else                                    return offsetSlices
    }

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

    property int offsetSlicesBottomRight:
    {
        if (not_null(config.offset_slices_bottom_right)) return config.offset_slices_bottom_right
        else                                             return offsetSlices
    }

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

    property int offsetSlicesBottomLeft:
    {
        if (not_null(config.offset_slices_bottom_left)) return config.offset_slices_bottom_left
        else                                            return offsetSlices
    }

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

    property int offsetSlicesLoginButtons:
    {
        if (not_null(config.offset_slices_login_buttons)) return config.offset_slices_login_buttons
        else                                              return offsetSlices
    }

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
    
    // Spacing
    property int spacingSlices:
    {
        if (not_null(config.spacing_slices)) return config.spacing_slices
        else                                 return defaultSpacingSlices
    }

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
    property int skewSlices:
    {
        if (not_null(config.skew_slices)) return config.skew_slices
        else                              return defaultSkewSlices
    }
    
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
    
    // Padding
    property int paddingSlices:
    {
        if (not_null(config.padding_slices)) return config.padding_slices
        else                                 return defaultPaddingSlices
    }

    property int paddingHorizontalSlices:
    {
        if (not_null(config.padding_horizontal_slices)) return config.padding_horizontal_slices
        else                                            return paddingSlices
    }

    property int paddingVerticalSlices:
    {
        if (not_null(config.padding_vertical_slices)) return config.padding_vertical_slices
        else                                          return paddingSlices
    }

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

    /* * * * * * * * * * * * * * * * * *
     *
     *  Layer 3 options
     *  Control types
     *
     * * * * * * * * * * * * * * * * * */

    property int paddingLeftSlicesTop:
    {
        if (not_null(config.padding_left_slices_top))            return config.padding_left_slices_top
        else if (not_null(config.padding_horizontal_slices_top)) return config.padding_horizontal_slices_top
        else if (not_null(config.padding_slices_top))            return config.padding_slices_top
        else                                                     return paddingLeftSlices
    }

    property int paddingLeftSlicesBottomRight:
    {
        if (not_null(config.padding_left_slices_bottom_right))            return config.padding_left_slices_bottom_right
        else if (not_null(config.padding_horizontal_slices_bottom_right)) return config.padding_horizontal_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))            return config.padding_slices_bottom_right
        else                                                              return paddingLeftSlices
    }

    property int paddingLeftSlicesBottomLeft:
    {
        if (not_null(config.padding_left_slices_bottom_left))            return config.padding_left_slices_bottom_left
        else if (not_null(config.padding_horizontal_slices_bottom_left)) return config.padding_horizontal_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))            return config.padding_slices_bottom_left
        else                                                             return paddingLeftSlices
    }

    property int paddingLeftSlicesLoginButtons:
    {
        if (not_null(config.padding_left_slices_login_buttons))            return config.padding_left_slices_login_buttons
        else if (not_null(config.padding_horizontal_slices_login_buttons)) return config.padding_horizontal_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))            return config.padding_slices_login_buttons
        else                                                               return paddingLeftSlices
    }
    
    property int paddingRightSlicesTop:
    {
        if (not_null(config.padding_right_slices_top))           return config.padding_right_slices_top
        else if (not_null(config.padding_horizontal_slices_top)) return config.padding_horizontal_slices_top
        else if (not_null(config.padding_slices_top))            return config.padding_slices_top
        else                                                     return paddingRightSlices
    }

    property int paddingRightSlicesBottomRight:
    {
        if (not_null(config.padding_right_slices_bottom_right))           return config.padding_right_slices_bottom_right
        else if (not_null(config.padding_horizontal_slices_bottom_right)) return config.padding_horizontal_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))            return config.padding_slices_bottom_right
        else                                                              return paddingRightSlices
    }

    property int paddingRightSlicesBottomLeft:
    {
        if (not_null(config.padding_right_slices_bottom_left))           return config.padding_right_slices_bottom_left
        else if (not_null(config.padding_horizontal_slices_bottom_left)) return config.padding_horizontal_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))            return config.padding_slices_bottom_left
        else                                                             return paddingRightSlices
    }

    property int paddingRightSlicesLoginButtons:
    {
        if (not_null(config.padding_right_slices_login_buttons))           return config.padding_right_slices_login_buttons
        else if (not_null(config.padding_horizontal_slices_login_buttons)) return config.padding_horizontal_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))            return config.padding_slices_login_buttons
        else                                                               return paddingRightSlices
    }

    property int paddingBottomSlicesTop:
    {
        if (not_null(config.padding_bottom_slices_top))        return config.padding_bottom_slices_top
        else if (not_null(config.padding_vertical_slices_top)) return config.padding_vertical_slices_top
        else if (not_null(config.padding_slices_top))          return config.padding_slices_top
        else                                                   return paddingBottomSlices
    }

    property int paddingBottomSlicesBottomRight:
    {
        if (not_null(config.padding_bottom_slices_bottom_right))        return config.padding_bottom_slices_bottom_right
        else if (not_null(config.padding_vertical_slices_bottom_right)) return config.padding_vertical_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))          return config.padding_slices_bottom_right
        else                                                            return paddingBottomSlices
    }

    property int paddingBottomSlicesBottomLeft:
    {
        if (not_null(config.padding_bottom_slices_bottom_left))        return config.padding_bottom_slices_bottom_left
        else if (not_null(config.padding_vertical_slices_bottom_left)) return config.padding_vertical_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))          return config.padding_slices_bottom_left
        else                                                           return paddingBottomSlices
    }

    property int paddingBottomSlicesLoginButtons:
    {
        if (not_null(config.padding_bottom_slices_login_buttons))        return config.padding_bottom_slices_login_buttons
        else if (not_null(config.padding_vertical_slices_login_buttons)) return config.padding_vertical_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))          return config.padding_slices_login_buttons
        else                                                             return paddingBottomSlices
    }
    
    property int paddingTopSlicesTop:
    {
        if (not_null(config.padding_top_slices_top))           return config.padding_top_slices_top
        else if (not_null(config.padding_vertical_slices_top)) return config.padding_vertical_slices_top
        else if (not_null(config.padding_slices_top))          return config.padding_slices_top
        else                                                   return paddingTopSlices
    }

    property int paddingTopSlicesBottomRight:
    {
        if (not_null(config.padding_top_slices_bottom_right))           return config.padding_top_slices_bottom_right
        else if (not_null(config.padding_vertical_slices_bottom_right)) return config.padding_vertical_slices_bottom_right
        else if (not_null(config.padding_slices_bottom_right))          return config.padding_slices_bottom_right
        else                                                            return paddingTopSlices
    }

    property int paddingTopSlicesBottomLeft:
    {
        if (not_null(config.padding_top_slices_bottom_left))           return config.padding_top_slices_bottom_left
        else if (not_null(config.padding_vertical_slices_bottom_left)) return config.padding_vertical_slices_bottom_left
        else if (not_null(config.padding_slices_bottom_left))          return config.padding_slices_bottom_left
        else                                                           return paddingTopSlices
    }

    property int paddingTopSlicesLoginButtons:
    {
        if (not_null(config.padding_top_slices_login_buttons))           return config.padding_top_slices_login_buttons
        else if (not_null(config.padding_vertical_slices_login_buttons)) return config.padding_vertical_slices_login_buttons
        else if (not_null(config.padding_slices_login_buttons))          return config.padding_slices_login_buttons
        else                                                             return paddingTopSlices
    }
}
