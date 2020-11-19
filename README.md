# Slice (SDDM Theme)

Simple dark SDDM theme with many customization options.

[![Theme preview (YouTube)](https://user-images.githubusercontent.com/2903496/45325970-142dd700-b55b-11e8-8396-dc6aba6282e5.png)](https://youtu.be/X6lXkBwo--s)

## Install from KDE system settings

If you're using KDE, you can install theme from `System Settings > Startup and Shutdown > Login Screen (SDDM)`. You can download this repo as zip and install with `Install From File...`, or you can find it in `Get New Login Screens...` window.

## Manual install

1. Install `Qt Graphical Effects` QML module
2. Install Roboto font (optional, you can change to other font, [see below](#font-scheme))
3. `git clone https://github.com/RadRussianRus/sddm-slice.git`
4. `cp -r sddm-slice /usr/share/sddm/themes/sddm-slice`
5. Open `/etc/sddm.conf` and put `Current=sddm-slice` in `[Theme]` section

## Configuration

Create file `theme.conf.user` in theme folder. See `theme.conf` for reference. Also sample configs can be found [in wiki](https://github.com/RadRussianRus/sddm-slice/wiki#sample-configs).

### Base options

* `background` - path to background image. If not set, falls back to `color_bg`. Not set by default.
* `bg_mode` - background image fill mode. Can be either `aspect`, `fill`, `tile` or `none`. Defaults to `aspect`.
* `parallax_bg_shift` - shifting of parallax background on tab change in pixels. `0` disables parallax motion. Negative values will scroll background in opposite direction. Default is `20`.
* `manual` - enables manual login mode and disables user selection. You can use "0/1", "true/false" and "yes/no" on this option. Disabled by default.

### Color scheme

There are many color options. In fact, too many. So now they are grouped by layers in [color scheme](https://github.com/RadRussianRus/sddm-slice/wiki/Color-Scheme). Most of them are optional, only mandatory options are from [layer 1](https://github.com/RadRussianRus/sddm-slice/wiki/Color-Scheme-Layer-1):

* `color_bg` - background color. Defaults to `#222222`.
* `color_main` - main color. Defaults to `#dddddd`.
* `color_dimmed` - dimmed main color. Defaults to `#888888`.
* `color_contrast` - color that contrasting to both main and dimmed. Defaults to `#1f1f1f`.

Info about other layers can be found on wiki: [layer 2](https://github.com/RadRussianRus/sddm-slice/wiki/Color-Scheme-Layer-2), [layer 3](https://github.com/RadRussianRus/sddm-slice/wiki/Color-Scheme-Layer-3).

### Font scheme

There are also many font options, so there is now [font scheme](https://github.com/RadRussianRus/sddm-slice/wiki/Font-Scheme) too. Most of them are optional, only mandatory option is from [layer 1](https://github.com/RadRussianRus/sddm-slice/wiki/Font-Scheme-Layer-1):

* `font` - overall font. Defaults to `Roboto`.

Info about other layers can be found on wiki: [layer 2](https://github.com/RadRussianRus/sddm-slice/wiki/Font-Scheme-Layer-2), [layer 3](https://github.com/RadRussianRus/sddm-slice/wiki/Font-Scheme-Layer-3).

### Debug mode options

There are some things that can't be tested well in greeter (e.g. shutdown options or login error). So there is a debug mode.

#### Boolean options

> You can use "0/1", "true/false" and "yes/no" on boolean options. All debug options are disabled by default.

* `debug` - activates debug mode.
* `debug_can_power_off` - sets `sddm.canPowerOff` (shows "Shutdown").
* `debug_can_reboot` - sets `sddm.canReboot` (shows "Reboot").
* `debug_can_suspend` - sets `sddm.canSuspend` (shows "Suspend").
* `debug_can_hibernate` - sets `sddm.canHibernate` (shows "Hibernate").
* `debug_can_hybrid_sleep` - sets `sddm.canHybridSleep` (shows "Hybrid Sleep").
* `debug_login_error` - forces login error.

#### Number options

* `debug_login_timeout` - time between pressing "Login" and login error in seconds. Not effective if `debug_login_error` is disabled.

#### String options

* `debug_hostname` - sets `sddm.hostName`.

## License

Icons: [Material Design Icons](https://github.com/Templarian/MaterialDesign)

[![CC-BY-SA](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)
