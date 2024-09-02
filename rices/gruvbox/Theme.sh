#!/usr/bin/env bash
#  ██████╗ ██████╗ ███████╗███╗   ██╗██████╗  █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██████╔╝██████╔╝█████╗  ██╔██╗ ██║██║  ██║███████║    ██████╔╝██║██║     █████╗
#  ██╔══██╗██╔══██╗██╔══╝  ██║╚██╗██║██║  ██║██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ██████╔╝██║  ██║███████╗██║ ╚████║██████╔╝██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Terminate existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Current Rice
read -r RICE < "$HOME"/.config/bspwm/.rice

# Vars config for Brenda Rice
# Bspwm border		# Fade windows true|false	# Shadows true|false	# Corner radius
BORDER_WIDTH="0"	P_FADE="true"				P_SHADOWS="true"		P_CORNER_R="6"

# (Gruvbox Dark) colorscheme
#bg="#282828"  fg="#ebdbb2"

#black="#282828"   red="#cc241d"   green="#98971a"   yellow="#d79921"
#blackb="#665c54"  redb="#fb4934"  greenb="#b8bb26"  yellowb="#fabd2f"

#blue="#458588"   magenta="#b16286"   cyan="#689d6a"   white="#a89984"
#ablueb="#83a598"  magentab="#d3869b"  cyanb="#8ec07c"  whiteb="#ebdbb2"

# (Gruvbox Dark Hard) colorscheme
bg="#1d2021"  fg="#ebdbb2"

black="#1d2021"   red="#fb4934"   green="#b8bb26"   yellow="#fabd2f"
blackb="#504945"  redb="#f38c6c"  greenb="#b8bb26"  yellowb="#fabd2f"

blue="#83a598"   magenta="#d3869b"   cyan="#8ec07c"   white="#d5c4a1"
blueb="#7c6f64"  magentab="#e4a5af"  cyanb="#a3b85b"  whiteb="#ebdbb2"


# Set bspwm configuration
set_bspwm_config() {
	bspc config border_width ${BORDER_WIDTH}
	bspc config top_padding 40
	bspc config bottom_padding 2
	bspc config left_padding 3
	bspc config right_padding 3
	bspc config normal_border_color "${white}"
	bspc config active_border_color "${white}"
	bspc config focused_border_color "${green}"
	bspc config presel_feedback_color "${yellow}"
}

# Terminal colors
set_term_config() {
	cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# Default colors
[colors.primary]
background = "${bg}"
foreground = "${fg}"

# Cursor colors
[colors.cursor]
cursor = "${fg}"
text = "${bg}"

# Normal colors
[colors.normal]
black   = "${black}"
red     = "${red}"
green   = "${green}"
yellow  = "${yellow}"
blue    = "${blue}"
magenta = "${magenta}"
cyan    = "${cyan}"
white   = "${white}"

# Bright colors
[colors.bright]
black   = "${blackb}"
red     = "${redb}"
green   = "${greenb}"
yellow  = "${yellowb}"
blue    = "${blueb}"
magenta = "${magentab}"
cyan    = "${cyanb}"
white   = "${whiteb}"
EOF

  # Set kitty colorscheme
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
# The basic colors
foreground              ${fg}
background              ${bg}
selection_foreground    ${bg}
selection_background    ${cyan}

# Cursor colors
cursor                  ${fg}
cursor_text_color       ${bg}

# URL underline color when hovering with mouse
url_color               ${blue}

# Kitty window border colors
active_border_color     ${magenta}
inactive_border_color   ${black}
bell_border_color       ${yellow}

# Tab bar colors
active_tab_foreground   ${bg}
active_tab_background   ${magenta}
inactive_tab_foreground ${fg}
inactive_tab_background ${black}
tab_bar_background      ${bg}

# The 16 terminal colors

# black
color0 ${black}
color8 ${blackb}

# red
color1 ${red}
color9 ${redb}

# green
color2  ${green}
color10 ${greenb}

# yellow
color3  ${yellow}
color11 ${yellowb}

# blue
color4  ${blue}
color12 ${blueb}

# magenta
color5  ${magenta}
color13 ${magentab}

# cyan
color6  ${cyan}
color14 ${cyanb}

# white
color7  ${white}
color15 ${whiteb}
EOF

pidof -x kitty && killall -USR1 kitty
}


# Set dunst config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"${bg}\"/g" \
		-e "s/separator_color = .*/separator_color = \"${fg}\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='${blue}'/g"

	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "${bg}"
		foreground = "${green}"

		[urgency_normal]
		timeout = 5
		background = "${bg}"
		foreground = "${fg}"

		[urgency_critical]
		timeout = 0
		background = "${bg}"
		foreground = "${red}"
	_EOF_
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/picom.conf \
		-e "s/normal = .*/normal =  { fade = ${P_FADE}; shadow = ${P_SHADOWS}; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#272e33\"/g" \
		-e "s/corner-radius = .*/corner-radius = ${P_CORNER_R}/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'kitty'\"/\"100:class_g = 'kitty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/eww/colors.scss <<EOF
\$bg: ${bg};
\$bg-alt: #32302f;
\$fg: ${fg};
\$black: ${black};
\$red: ${red};
\$green: ${green};
\$yellow: ${yellow};
\$blue: ${blue};
\$magenta: ${magenta};
\$cyan: ${cyan};
\$archicon: #0f94d2;
EOF
}

set_launchers() {
	# Jgmenu
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e "s/color_menu_bg = .*/color_menu_bg = ${bg}/" \
		-e "s/color_norm_fg = .*/color_norm_fg = ${fg}/" \
		-e "s/color_sel_bg = .*/color_sel_bg = ${black}/" \
		-e "s/color_sel_fg = .*/color_sel_fg = ${fg}/" \
		-e "s/color_sep_fg = .*/color_sep_fg = ${green}/"

	# Rofi launchers
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Brenda

* {
    font: "JetBrainsMono NF Bold 9";
    background: ${bg};
    background-alt: ${bg}E0;
    foreground: ${fg};
    selected: ${blue};
    active: ${green};
    urgent: ${red};

    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
}
EOF
}

# Launch theme
launch_theme() {
  
  # Launch polybar
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q brenda -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	done

  # Set random wallpaper for actual rice
	feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls

	# Launch dunst notification daemon
	dunst -config "${HOME}"/.config/bspwm/dunstrc &
}

# Appearance
set_appearance() {
  XFILE="$BDIR/xsettingsd"
  GTK2FILE="$HOME/.gtkrc-2.0"
  GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

  # apply gtk theme, icons, cursor & fonts
  if [[ `pidof xsettingsd` ]]; then
    sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Klaus\"|g" ${XFILE}
    sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Papirus-Dark\"|g" ${XFILE}
    sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"xcursor-breeze-snow\"|g" ${XFILE}
  else
    sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"JetBrainsMono 10\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Klaus\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Papirus-Dark\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"xcursor-breeze-snow\"/g" ${GTK2FILE}
    
    sed -i -e "s/gtk-font-name=.*/gtk-font-name=JetBrainsMono 10/g" ${GTK3FILE}
    sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Klaus/g" ${GTK3FILE}
    sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Papirus-Dark/g" ${GTK3FILE}
    sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=xcursor-breeze-snow/g" ${GTK3FILE}
  fi
  
  # inherit cursor theme
  if [[ -f "$HOME"/.icons/default/index.theme ]]; then
    sed -i -e "s/Inherits=.*/Inherits=xcursor-breeze-snow/g" "$HOME"/.icons/default/index.theme
  fi  
}

### Apply Configurations

set_bspwm_config
set_term_config
set_dunst_config
launch_theme
set_eww_colors
set_launchers
set_appearance
