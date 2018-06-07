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

### Base options

* `font` - overall font. Defaults to `Roboto`.
* `background` - path to background image. If not set, falls back to `color_bg`. Not set by default.
* `bg_mode` - background image fill mode. Can be either `aspect`, `fill`, `tile` or `none`. Defaults to `aspect`.
* `parallax_bg_shift` - shifting of parallax background on tab change in pixels. `0` disables parallax motion. Negative values will scroll background in opposite direction. Default is `20`.

### Color scheme

There are many color options. In fact, too many. So now they are grouped by layers in [color scheme](https://github.com/RadRussianRus/sddm-slice/wiki/Color-scheme). Most of them are optional, only mandatory options are from [layer 1](https://github.com/RadRussianRus/sddm-slice/wiki/Layer-1):

* `color_bg` - background color. Defaults to `#222222`.
* `color_main` - main color. Defaults to `#dddddd`.
* `color_dimmed` - dimmed main color. Defaults to `#888888`.
* `color_contrast` - color that contrasting to both main and dimmed. Defaults to `#1f1f1f`.

Info about other layers can be found on wiki: [layer 2](https://github.com/RadRussianRus/sddm-slice/wiki/Layer-2), [layer 3](https://github.com/RadRussianRus/sddm-slice/wiki/Layer-3).

## License

Icons: [Material Design Icons](https://github.com/Templarian/MaterialDesign)

[![CC-BY-SA](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)