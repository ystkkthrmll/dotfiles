#!/usr/bin/bash
#
# #region Outline
# - Purpose: Configuration
#
# - Notes
#
#   - キーワード見つけ方：
#     1.  （必要に応じて）\bashinline{cd ~test/gnome}
#     1.  ~\bashinline{gsettings list-recursively > before.txt}
#     1.  設定を変更する．
#     1.  ~\bashinline{gsettings list-recursively > after.txt}
#     1.  ~\bashinline{vim -d before.txt after.txt}
#
#   - `$ gsettings list-recursively`
#     と実行すると設定一覧が表示される
#     [ref](http://fedorakenken.doorblog.jp/archives/51929536.html)
#
#   - 実行結果から `***` を含む行だけを表示したいときは，次のようにすればよい
#       （\href{https://www.atmarkit.co.jp/ait/articles/1604/07/news018.html}{参照先}）：
#     `$ gsettings list-recursively | grep ***`
#
#   - 設定の変更が保存されるファイル
#     - `~/.config/dconf/user`
#
#   - The origin of filename
#     - \href{https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/configuration-overview-gsettings-dconf}{CHAPTER 9. CONFIGURING DESKTOP WITH GSETTINGS AND DCONF}
#     - "configure"
#       - to arrange something in a particular way, especially computer equipment;
#         to make equipment or software work in the way that the user prefers
#         \mycite[keyword=configure]{oxford-learners-dictionaries}% OK (2020-02-19T23:24:15)
#       - to arrange something, especially computer equipment, so that it works with other equipment
#         \mycite[keyword=configure]{longman}% OK (2020-02-19T23:25:58)
#       - to arrange something or change the controls on a computer or other device
#         so that it can be used in a particular way
#         \mycite[keyword=configure]{cambridge-dictionary}% OK (2020-02-19T23:29:06)
#     - 環境設定する\mycite[keyword=configure]{weblio}% OK (2020-02-19T23:30:48)
#     - コンフィギュレーションとは，設定，構成，配置，構造，形状，形態などの意味を持つ英単語．
#       「コンフィグ」（config）はその省略形．
#       \doublequotes{conf}あるいは\doublequotes{cfg}などの略号で表されることもある．
#       コンピュータの分野では，機器やソフトウェアの動作や構成などについて利用者が指定・変更できる設定項目，
#       環境設定という意味で用いられる．
#       一定の形式で設定内容を記述したファイルとして保存・管理されることが多く，
#       そのようなファイルを「コンフィギュレーションファイル」「コンフィグファイル」などという．
#       類義語には\doublequotes{settings}（セッティング），\doublequotes{preferences}（プリファレンス）などがあり，
#       厳密な意味の違いや使い分けはなく，ほぼ同義として用いられる．
#       文脈によっては\doublequotes{options}（オプション），\doublequotes{properties}（プロパティ）なども
#       同じような意味で用いられる\mycite[keyword=コンフィギュレーション]{e-words}．% OK (2020-02-19T23:37:46)
#   - "desktop"
#     - a screen on a computer that shows the icons of programs and files that can be used
#       \mycite[keyword=desktop]{oxford-learners-dictionaries}%  ()
#     - デスクトップとは，机の上，作業面，卓上（の），などの意味を持つ英単語．
#       グラフィックス表示（GUI）で操作するOSで，起動時に表示される，
#       基本となる操作画面のことをデスクトップという
#       \mycite[keyword=desktop]{e-words}．
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
filename="file:///home/yasutaka/Dropbox/config-files/misc/output-files/shell/wallpaper-${extension}.png"
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
#   - \bashinline*{idle-delay}
#     - The number of seconds of inactivity before the session is considered idle.
#       \bashinline{gsettings describe org.gnome.desktop.session idle-delay}
#
gsettings set org.gnome.desktop.session idle-delay 600
# #endregion org.gnome.desktop.session
#
# #region org.gnome.mutter
# - `experimental-features`
#   - Fractional Scaling を有効にする設定
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
#
#
#
#
#
#










% \subsection{\texttt{org.gnome.shell}}^^A [[[
% \begin{myitemize}
% \1 \bashinline*{favorite-apps}
%   \2 The applications corresponding to these identifiers will be displayed in the favorites area.
%   \bashinline{gsettings describe org.gnome.shell favorite-apps}
% \end{myitemize}
%
% \RenewDocumentCommand \temporarycommand { m m } { \texttt{'#1'} & #2 \\ }
% \begin{mytabular}{ll} \hline
% \temporarycommand{entry???}{description???} \hline
% \temporarycommand{org.gnome.Terminal.desktop}{Terminal}
% \temporarycommand{code.desktop}{Visual Studio Code}
% \temporarycommand{org.gnome.Nautilus.desktop}{Files}
% \temporarycommand{google-chrome.desktop}{Google Chrome}
% \temporarycommand{rhythmbox.desktop}{Rhythmbox}
% \temporarycommand{org.gnome.Settings.desktop}{Settings}
% \temporarycommand{org.gnome.Screenshot.desktop}{Screenshot} \hline
% \end{mytabular}
%
% \begin{bashcode}
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
% \end{bashcode}
% ^^A ]]] End of subsection `org.gnome.shell'.
%
% \subsection{\texttt{org.gnome.shell.extensions.dash-to-dock}}^^A [[[
% \begin{myitemize}
% \1 \doublequotes{Dash, Dock}って何？調べよ．
% \1 \bashinline*{dash-max-icon-size}
%   \2 icon size
%   \2 \href{https://www.2daygeek.com/how-to-customize-the-gnome-3-desktop/}{参照先}
% \1 \bashinline*{dock-fixed}
%   \2 Auto hide dock
% \1 \bashinline*{dock-position}
%   \2 \href{https://askubuntu.com/questions/966927/how-do-i-move-ubuntu-dock-to-bottom-on-ubuntu-17-10-and-later/966935#966935}{参照先}
% \1 \bashinline*{extend-height}
%   \2 \href{https://gihyo.jp/admin/serial/01/ubuntu-recipe/0541}{参照先}
% \1 \bashinline*{multi-monitor}
%   \2 ???
% \end{myitemize}
%
% \begin{bashcode}
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 16
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
% \end{bashcode}
% ^^A ]]] End of subsection `org.gnome.shell.extensions.dash-to-dock'.
%
% \subsection{\texttt{org.gnome.shell.extensions.ding}}^^A [[[
% \begin{myitemize}
% \1 \bashinline*{show-home}
%   \2 
% \end{myitemize}
%
% \begin{bashcode}
gsettings set org.gnome.shell.extensions.ding show-home false
% \end{bashcode}
% ^^A ]]] End of subsection `org.gnome.shell.extensions.ding'.
%
% \subsection{\texttt{org.gnome.system.locale}}^^A [[[
% \begin{myitemize}
% \1 年月日などの表示形式．\textcolor{red}{上手くいかなかった}
% \myarrow\ 再起動しても反映されなかった．
% とりあえず手動で変更せよ．
% \end{myitemize}
%
% \begin{bashcode}
gsettings set org.gnome.system.locale region 'en_US.UTF-8'
% \end{bashcode}
% ^^A ]]] End of subsection `org.gnome.system.locale'.
%
% \subsection{\texttt{org.gnome.Terminal.Legacy.Keybindings}}^^A [[[
%
% \subsubsection{*** Shortcuts}^^A [[[
% \begin{myitemize}
% \1 \href{https://unix.stackexchange.com/questions/297654/configuring-gnome-shell-key-bindings-from-the-command-line}{参照先}
% \1 The origin of `\verb|schema|', `\verb|path|'
%   \2 \bashinline*{gsettings set SCHEMA [:PATH] KEY VALUE} \man{gsettings}
% \1
% \end{myitemize}
%
% \begin{bashcode}
schema=org.gnome.Terminal.Legacy.Keybindings
path=/org/gnome/terminal/legacy/keybindings/
gsettings set ${schema}:${path} close-tab '<Ctrl>w'
gsettings set ${schema}:${path} close-window '<Ctrl>q'
gsettings set ${schema}:${path} copy '<Ctrl>c'
gsettings set ${schema}:${path} paste '<Ctrl>v'
% \end{bashcode}
% ^^A ]]] End of subsubsection `***'.
%
% \subsubsection{Sound and Media}^^A [[[
% \begin{myitemize}
% \1 タイトルはSettings \myarrow\ Keyboard Shortcuts \myarrow\ Sound and Mediaより
% \1 \verb|gsettings|で設定することができなかったので，\verb|dconf|を用いた
% \urlref{https://tutorialmore.com/questions-83182.htm}{sound - Ubuntuは一部のメディアキーに対して正しいキーコードを提供しません}
% \1 \verb|key|の由来は\verb|man dconf|の\verb|dconf write KEY VALUE|より
% \end{myitemize}
%
% \begin{bashcode}
key=/org/gnome/settings-daemon/plugins/media-keys
dconf write ${key}/volume-up "['<Ctrl>Up']"
dconf write ${key}/volume-down "['<Ctrl>Down']"
% \end{bashcode}
% ^^A ]]] End of subsubsection `Sound and Media'.
%
% \subsubsection{Custom Shortcuts}^^A [[[
% \begin{myitemize}
% \1 タイトルはSettings \myarrow\ Keyboard Shortcuts \myarrow\ Custom Shortcutsより．
% \1 \href{https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal}{参照先}
% \1 オーディオのスイッチ
% \urlref{https://unix.stackexchange.com/questions/62818/how-can-i-switch-between-different-audio-output-hardware-using-the-shell}{How can I switch between different audio output hardware using the shell?}
% \1 
% \end{myitemize}
%
% \begin{bashcode}
key=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
% dconf write ${key}/custom0/name "'Switch diplay'"
% dconf write ${key}/custom0/command "'pacmd set-card-profile 0 output:hdmi-stereo'"
% dconf write ${key}/custom0/binding "'<Ctrl>Left'"
%
% dconf write ${key}/custom1/name "'Switch PC'"
% dconf write ${key}/custom1/command "'pacmd set-card-profile 0 output:analog-stereo'"
% dconf write ${key}/custom1/binding "'<Ctrl>Right'"
% \end{bashcode}
% ^^A ]]] End of subsubsection `Custom Shortcuts'.
%
% ^^A ]]] End of subsection `org.gnome.Terminal.Legacy.Keybindings'.
%
% \subsection{\texttt{org.gnome.Terminal.Legacy.Profile}}^^A [[[
%
% \subsubsection{Profile IDの取得}^^A [[[
% \begin{myitemize}
% \1 The origin of `profile id'
%   \2 Terminal \myarrow\ Preferences \myarrow\ Profilesの内の一つを選択\myarrow
%   Textタブ\myarrow\ 右下の文字列\doublequotes{Profile ID: ...}
% \1 以下でProfile IDを取得
%   \2 \href{https://zv-louis.hatenablog.com/entry/2018/05/28/120000}{参照先}
% \end{myitemize}
%
% \begin{bashcode}
temp1=$(gsettings get org.gnome.Terminal.ProfilesList list)
temp2=${temp1:2}
profile_id=${temp2:0:-2}
% profile_id=$(dconf list /org/gnome/terminal/legacy/profiles:/)
% \end{bashcode}
% ^^A ]]] End of subsubsection `Profile IDの取得'.
%
% \subsubsection{Defining variables}^^A [[[
% \begin{myitemize}[enumerate]
% \1 font
%   \2 \verb|"Ricty Diminished Bold 12"|
%     \3 見やすいがVimで\verb|hi Foo cterm=bold|の意味がなくなるので\verb|Bold|をやめる
%   \2 \verb|"Ricty Diminished 12"|
%     \3 \verb|Bold|にしないと線が細くて見にくいのでやめる
%   \2 \verb|"Ubuntu Mono 12"|
% \end{myitemize}
%
% \begin{bashcode}
schema=org.gnome.Terminal.Legacy.Profile
path=/org/gnome/terminal/legacy/profiles
%
# myfont="Ricty Diminished Bold 12"
# myfont="Ricty Diminished 12"
myfont="Ubuntu Mono 12"
% \end{bashcode}
% ^^A ]]] End of subsubsection `Defining variables'.
%
% \subsubsection{Setting}^^A [[[
% \begin{myitemize}
% \1 \bashinline*{font}
%   \2 \href{https://zv-louis.hatenablog.com/entry/2018/05/28/120000}{参照先}
%   \2 \href{https://www.netarium.jp/ubuntu-18-04-%E7%AB%AF%E6%9C%AB%E3%81%AE%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88%E3%81%AE%E8%A8%AD%E5%AE%9A/}{[Ubuntu 18.04] 端末のフォントの設定}
%   \2 \verb|dconf write /org/gnome/terminal/legacy/profiles.../font "'Ricty ...'"|
%   でもフォントは変更できる
% \1 \bashinline*{default-size-columns}, \bashinline*{default-size-rows}
%   \2 default window sizeの指定
% \1 \bashinline*{audible-bell}
%   \2 音が出ないようにするため
% \end{myitemize}
%
% \begin{bashcode}
gsettings set "${schema}:${path}:/:${profile_id}/" font "${myfont}"
% key=/org/gnome/terminal/legacy/profiles
% dconf write ${key}:/${profile_id}/font "'Ricty Diminished 12'"
gsettings set "${schema}:${path}:/:${profile_id}/" default-size-columns "68"
gsettings set "${schema}:${path}:/:${profile_id}/" default-size-rows "135"
gsettings set "${schema}:${path}:/:$profile_id/" audible-bell false
% \end{bashcode}
% ^^A ]]] End of subsubsection `Setting'.
%
% ^^A ]]] End of subsection `org.gnome.Terminal.Legacy.Profile'.
%
% \subsection{Sound}^^A [[[
% タイトルはSettings \myarrow\ Soundより．
%
% terminalから音量を変える方法
% （\href{https://unix.stackexchange.com/questions/32206/set-volume-from-terminal}{参照先}）：
% \verb|> amixer sset 'Master' 50%|
%
% ^^A ]]] End of subsection `Sound'.
