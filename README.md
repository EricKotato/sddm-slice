# Slice (SDDM Theme)

Simple dark SDDM theme.

[![Theme preview (YouTube)](http://img.youtube.com/vi/y2zzlDdJTUU/0.jpg)](https://youtu.be/y2zzlDdJTUU)

## Installing

1. Install `Qt Graphical Effects` QML module
2. Install Roboto font (optional, you can change to other font, see below)
3. `git clone https://github.com/RadRussianRus/sddm-slice.git`
4. `cp -r sddm-slice/slice /usr/share/sddm/themes/slice`
5. Open `/etc/sddm.conf` and put `Current=slice` in `[Theme]` section

## Configuration

Create file `theme.conf.user` in theme folder. See `slice/theme.conf` for reference.

### Available options

* `font` - overall font. Defaults to `Roboto`.
* `color_bg` - main background color. Defaults to `#222222`.
* `color_button_bg_idle` - button background color (in idle state). Defaults to `#888888`.
* `color_button_bg_hover` - button background color (in hover state). Defaults to `#aaaaaa`.
* `color_button_bg_selected` - selected button background color (in idle state). Defaults to `#dddddd`.
* `color_button_bg_selected_hover` - selected button background color (in hover state). Defaults to `#cccccc`.
* `color_button_text` - button text color (in any state). Defaults to `#1f1f1f`.
* `color_text` - main text and foreground elements color (such as progress bar and power icons). Defaults to `#dddddd`.
* `color_placeholder_text` - placeholder text color (in password field). Defaults to `#888888`.
* `color_selection_bg` - selected text background color. Defaults to `#555555`.
* `color_selection_text` - selected text color. Defaults to `#dddddd`.
* `color_text_bg` - text elements background color. Defaults to `#22ffffff`.
* `color_icon_bg` - image elements background color. Defaults to `#11ffffff`.
* `color_error_bg` - error message background color. Defaults to `#11ffffff`.
* `color_error_text` - error message text color. Defaults to `#dddddd`.

## License

Icons: [Material Design Icons](https://github.com/Templarian/MaterialDesign)

[![CC-BY-SA](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)