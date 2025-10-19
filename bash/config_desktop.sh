#!/usr/bin/bash
#
# #region Outline
# - Purpose: Configure desktop
# - Usage: `$ bash config_desktop.sh`
# - Notes
#
#   - キーワードの見つけ方：
#     1.  （必要に応じて）`$ cd ~test/gnome`
#     1.  `$ gsettings list-recursively > before.txt`
#     1.  手動で設定を変更する
#     1.  `$ gsettings list-recursively > after.txt`
#     1.  `$ vim -d before.txt after.txt`
#
#   - `$ gsettings list-recursively`
#     と実行すると設定一覧が表示される
#     [ref](http://fedorakenken.doorblog.jp/archives/51929536.html)
#
#   - 実行結果から `***` を含む行だけを表示したいときは，次のようにすればよい
#     [ref](https://www.atmarkit.co.jp/ait/articles/1604/07/news018.html)
#     `$ gsettings list-recursively | grep ***`
#
#   - 設定の変更が保存されるファイル
#     - `~/.config/dconf/user`
#
#   - The origin of filename
#     - [CHAPTER 9. CONFIGURING DESKTOP WITH GSETTINGS AND DCONF](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/configuration-overview-gsettings-dconf)
#
# #endregion Outline
#
# #region Defining variables
readonly COMPUTER_NAME=home

if [[ $(uname -n) == ${COMPUTER_NAME} ]]; then
  extension=home
else
  extension=office
fi
# #endregion Defining variables
#
# #region org.gnome.desktop.background
# - Notes
#   - `picture-uri`
#     - URI to use for the background image.
#       Note that the backend only supports local (file://) URIs.
#       `$ gsettings describe org.gnome.desktop.background picture-uri`
#
# filename="file:///home/yasutaka/Dropbox/dotfiles/typst/wallpaper-${extension}.png"
filename="file:///home/yasutaka/Dropbox/dotfiles/typst/wallpaper.png"
gsettings set org.gnome.desktop.background picture-uri ${filename}
# #endregion org.gnome.desktop.background
#
# #region org.gnome.desktop.interface
# - Notes
#   - `clock-show-date`
#     - If true, display date in the clock, in addition to time.
#       \bashinline{gsettings describe org.gnome.desktop.interface clock-show-date}
#   - `clock-show-seconds`
#     - If true, display seconds in the clock.
#       \bashinline{gsettings describe org.gnome.desktop.interface clock-show-seconds}
#   - `clock-show-weekday`
#     - If true, display weekday in the clock, in addition to time.
#       \bashinline{gsettings describe org.gnome.desktop.interface clock-show-weekday}
#   - `color-scheme`
#     - The preferred color scheme for the user interface.
#       Valid values are “default”, “prefer-dark”, “prefer-light”.
#       \bashinline{gsettings describe org.gnome.desktop.interface color-scheme}
#   - `gtk-theme`
#     - Basename of the default theme used by gtk+.
#       \bashinline{gsettings describe org.gnome.desktop.interface gtk-theme}
#
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
# #endregion org.gnome.desktop.interface
#
# #region org.gnome.desktop.session
# - Notes
#   - `idle-delay`
#     - The number of seconds of inactivity before the session is considered idle.
#       `$ gsettings describe org.gnome.desktop.session idle-delay`
#
gsettings set org.gnome.desktop.session idle-delay 600
# #endregion org.gnome.desktop.session
#
# #region org.gnome.mutter
# - Notes
#   - `experimental-features`
#     - Fractional Scaling を有効にする設定
#
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
# #endregion org.gnome.mutter
#
# #region org.gnome.nautilus.preferences
# - Notes
#   - `default-folder-viewer`
#     - icon or list
#
gsettings set org.gnome.nautilus.preferences default-folder-viewer "'list-view'"
# #endregion org.gnome.nautilus.preferences
#
# #region org.gnome.settings-daemon.plugins.power
# - Notes
#   - `sleep-inactive-ac-timeout`
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 1800
# #endregion org.gnome.settings-daemon.plugins.power
#
# #region org.gnome.shell
# - Notes
#   - `favorite-apps`
#     - The applications corresponding to these identifiers will be displayed in the favorites area.
#       \bashinline{gsettings describe org.gnome.shell favorite-apps}
#
# | entry???                    | description   |
# | --------------------------- | ------------- |
# | org.gnome.Terminal.desktop  | Terminal      |
# | code.desktop                | Visual Studio Code |
# | org.gnome.Nautilus.desktop  | Files         |
# | google-chrome.desktop       | Google Chrome |
# | rhythmbox.desktop           | Rhythmbox     |
# | org.gnome.Settings.desktop  | Settings      |
# | org.gnome.Screenshot.desktop    | Screenshot    |
#
gsettings set org.gnome.shell favorite-apps \
"[ \
  'org.gnome.Terminal.desktop', \
  'code.desktop', \
  'org.gnome.Nautilus.desktop', \
  'google-chrome.desktop', \
  'org.gnome.Settings.desktop', \
  'rhythmbox.desktop', \
  'org.gnome.Screenshot.desktop' \
]"
# #endregion org.gnome.shell
#
# #region org.gnome.shell.extensions.dash-to-dock
# - Notes
#   - Dash, Dockjって何？調べよ．
#   - `dash-max-icon-size`
#     - icon size
#     - \href{https://www.2daygeek.com/how-to-customize-the-gnome-3-desktop/}{参照先}
#   - `dock-fixed`
#     - Auto hide dock
#   - `dock-position`
#     - \href{https://askubuntu.com/questions/966927/how-do-i-move-ubuntu-dock-to-bottom-on-ubuntu-17-10-and-later/966935#966935}{参照先}
#   - `extend-height`
#     - \href{https://gihyo.jp/admin/serial/01/ubuntu-recipe/0541}{参照先}
#   - `multi-monitor`
#     - ???
#
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 16
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
# #endregion org.gnome.shell.extensions.dash-to-dock
#
# #region org.gnome.shell.extensions.ding
# - Notes
#   - `show-home`
#
gsettings set org.gnome.shell.extensions.ding show-home false
# #endregion org.gnome.shell.extensions.ding
#
# #region org.gnome.system.locale
# - 年月日などの表示形式
#   -> 上手くいかなかった
#   -> 再起動しても反映されなかった
#   -> とりあえず手動で変更せよ
#
gsettings set org.gnome.system.locale region 'en_US.UTF-8'
# #endregion org.gnome.system.locale
#
# #region org.gnome.Terminal.Legacy.Keybindings
# - Notes
#   - [ref](https://unix.stackexchange.com/questions/297654/configuring-gnome-shell-key-bindings-from-the-command-line)
#   - The origin of "schema", "path"
#     - `$ gsettings set SCHEMA [:PATH] KEY VALUE`
#     - `$ man gsettings`
#
schema=org.gnome.Terminal.Legacy.Keybindings
path=/org/gnome/terminal/legacy/keybindings/

gsettings set ${schema}:${path} close-tab '<Ctrl>w'
gsettings set ${schema}:${path} close-window '<Ctrl>q'
gsettings set ${schema}:${path} copy '<Ctrl>c'
gsettings set ${schema}:${path} paste '<Ctrl>v'
# #endregion org.gnome.Terminal.Legacy.Keybindings
#
# #region Sound and Media
# - Notes
#   - The origin of "Sound and Media"
#     - Settings > Keyboard Shortcuts > Sound and Media
#   - `gsettings` で設定することができなかったので，`dconf` を用いた
#     - \urlref{https://tutorialmore.com/questions-83182.htm}{sound - Ubuntuは一部のメディアキーに対して正しいキーコードを提供しません}
#   - The origin of "key"
#     - ` man dconf` の `dconf write KEY VALUE` より
#
key=/org/gnome/settings-daemon/plugins/media-keys

dconf write ${key}/volume-up "['<Ctrl>Up']"
dconf write ${key}/volume-down "['<Ctrl>Down']"
# #endregion Sound and Media
#
# #region Custom Shortcuts
# - Notes
#   - タイトルはSettings \myarrow\ Keyboard Shortcuts \myarrow\ Custom Shortcutsより．
#   - \href{https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal}{参照先}
#   - オーディオのスイッチ
#     \urlref{https://unix.stackexchange.com/questions/62818/how-can-i-switch-between-different-audio-output-hardware-using-the-shell}{How can I switch between different audio output hardware using the shell?}
#
key=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
# dconf write ${key}/custom0/name "'Switch diplay'"
# dconf write ${key}/custom0/command "'pacmd set-card-profile 0 output:hdmi-stereo'"
# dconf write ${key}/custom0/binding "'<Ctrl>Left'"
#
# dconf write ${key}/custom1/name "'Switch PC'"
# dconf write ${key}/custom1/command "'pacmd set-card-profile 0 output:analog-stereo'"
# dconf write ${key}/custom1/binding "'<Ctrl>Right'"
# #endregion Custom Shortcuts
#
# #region org.gnome.Terminal.Legacy.Profile
#
# #region Profile IDの取得
# - The origin of "profile id"
#   - Terminal > Preferences > Profiles の内の一つを選択 > Textタブ > 右下の文字列 "Profile ID: ..."
#   - 以下でProfile IDを取得
#     - \href{https://zv-louis.hatenablog.com/entry/2018/05/28/120000}{参照先}
#
temp1=$(gsettings get org.gnome.Terminal.ProfilesList list)
temp2=${temp1:2}
profile_id=${temp2:0:-2}
# profile_id=$(dconf list /org/gnome/terminal/legacy/profiles:/)
# #endregion Profile IDの取得
#
# #region Defining variables
# - font
#   - \verb|"Ricty Diminished Bold 12"|
#     - 見やすいがVimで\verb|hi Foo cterm=bold|の意味がなくなるので\verb|Bold|をやめる
#   - \verb|"Ricty Diminished 12"|
#     - \verb|Bold|にしないと線が細くて見にくいのでやめる
#   - \verb|"Ubuntu Mono 12"|
#
schema=org.gnome.Terminal.Legacy.Profile
path=/org/gnome/terminal/legacy/profiles

# myfont="Ricty Diminished Bold 12"
# myfont="Ricty Diminished 12"
myfont="Ubuntu Mono 12"
# #endregion Defining variables
#
# #region Setting
# - `font`
#   - \href{https://zv-louis.hatenablog.com/entry/2018/05/28/120000}{参照先}
#   - \href{https://www.netarium.jp/ubuntu-18-04-%E7%AB%AF%E6%9C%AB%E3%81%AE%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88%E3%81%AE%E8%A8%AD%E5%AE%9A/}{[Ubuntu 18.04] 端末のフォントの設定}
#   - \verb|dconf write /org/gnome/terminal/legacy/profiles.../font "'Ricty ...'"|
#     でもフォントは変更できる
# - \bashinline*{default-size-columns}, \bashinline*{default-size-rows}
#   - default window sizeの指定
# - \bashinline*{audible-bell}
#   - 音が出ないようにするため
#
gsettings set "${schema}:${path}:/:${profile_id}/" font "${myfont}"
# key=/org/gnome/terminal/legacy/profiles
# dconf write ${key}:/${profile_id}/font "'Ricty Diminished 12'"
gsettings set "${schema}:${path}:/:${profile_id}/" default-size-columns "68"
gsettings set "${schema}:${path}:/:${profile_id}/" default-size-rows "135"
gsettings set "${schema}:${path}:/:$profile_id/" audible-bell false
# #endregion Setting
#
# #endregion org.gnome.Terminal.Legacy.Profile
#
# #region Sound
# - Notes
#   - The origin of "sound"
#     - Settings > Sound
#   - terminalから音量を変える方法
#     - \href{https://unix.stackexchange.com/questions/32206/set-volume-from-terminal}{参照先}）
#       `$ amixer sset 'Master' 50%`
# #endregion Sound