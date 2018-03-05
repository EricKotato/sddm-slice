# Slice (SDDM Theme)

Simple dark SDDM theme.

## Installing

1. Install QML modules: 
  * Qt Graphical Effects
  * Qt Quick Controls
2. Install Roboto font (optional, you can change to other font, see below)
3. `git clone https://github.com/RadRussianRus/sddm-slice.git`
4. `cp -r sddm-slice/slice /usr/share/sddm/themes/slice`
5. Open `/etc/sddm.conf` and put `Current=slice` in `[Theme]` section

## Configuration

Create file `theme.conf.user` in theme folder. See `slice/theme.conf` for reference.

### Available options

* `font` - changes overall font. Defaults to `Roboto`.

## License

Icons: [Material Design Icons](https://github.com/Templarian/MaterialDesign)

[![CC-BY-SA](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)