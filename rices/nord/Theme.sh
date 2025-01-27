#!/usr/bin/env bash
## ┏━┓╻┏┓╻┏━╸   ┏━┓╻┏━╸┏━╸
## ┣━┫┃┃┗┫┃╺┓   ┣┳┛┃┃  ┣╸ 
## ╹ ╹╹╹ ╹┗━┛   ╹┗╸╹┗━╸┗━╸ by adilhyz
## This file will configure the options
## and launch the bars corresponding to each theme.

## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for aing
set_bspwm_config() {
  bspc config border_width 0
  bspc config top_padding 2
  bspc config bottom_padding 30
  bspc config normal_border_color "#4C566A"
  bspc config active_border_color "#4C566A"
  bspc config focused_border_color "#88C0D0"
  bspc config presel_feedback_color "#88C0D0"
  bspc config left_padding 2
  bspc config right_padding 2
  bspc config window_gap 6
}

# Reload terminal colors
set_alacritty_config() {
  cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Aing) Aing Rice - Nord Theme

# Default colors
[colors.primary]
background = "#2E3440"
foreground = "#D8DEE9"

# Cursor colors
[colors.cursor]
cursor = "#D8DEE9"
text = "#2E3440"

# Normal colors
[colors.normal]
black = "#3B4252"
blue = "#81A1C1"
cyan = "#88C0D0"
green = "#A3BE8C"
magenta = "#B48EAD"
red = "#BF616A"
white = "#E5E9F0"
yellow = "#EBCB8B"

# Bright colors
[colors.bright]
black = "#4C566A"
blue = "#81A1C1"
cyan = "#8FBCBB"
green = "#A3BE8C"
magenta = "#B48EAD"
red = "#BF616A"
white = "#ECEFF4"
yellow = "#EBCB8B"
EOF
}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## (Nord) Color scheme for Aing Rice


# The basic colors
foreground              #D8DEE9
background              #2E3440
selection_foreground    #2E3440
selection_background    #88C0D0

# Cursor colors
cursor                  #D8DEE9
cursor_text_color       #2E3440

# URL underline color when hovering with mouse
url_color               #5E81AC

# Kitty window border colors
active_border_color     #D8DEE9
inactive_border_color   #4C566A
bell_border_color       #B48EAD

# Tab bar colors
active_tab_foreground   #2E3440
active_tab_background   #D8DEE9
inactive_tab_foreground #D8DEE9
inactive_tab_background #3B4252
tab_bar_background      #2E3440

# The 16 terminal colors

# black
color0 #3B4252
color8 #4C566A

# red
color1 #BF616A
color9 #BF616A

# green
color2  #A3BE8C
color10 #A3BE8C

# yellow
color3  #EBCB8B
color11 #EBCB8B

# blue
color4  #5E81AC
color12 #81A1C1

# magenta
color5  #B48EAD
color13 #B48EAD

# cyan
color6  #88C0D0
color14 #8FBCBB

# white
color7  #E5E9F0
color15 #ECEFF4
EOF

killall -USR1 kitty
}



# Set stalonetray config
set_stalonetray_config() {
  sed -i "$HOME"/.config/bspwm/stalonetrayrc \
    -e "s/background .*/background \"#2E3440\"/" \
    -e "s/vertical .*/vertical true/" \
    -e "s/geometry .*/geometry 1x1-36+1000/" \
    -e "s/grow_gravity .*/grow_gravity SE/" \
    -e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
    -e "s/transparency = .*/transparency = 0/g" \
    -e "s/frame_color = .*/frame_color = \"#2E3440\"/g" \
    -e "s/separator_color = .*/separator_color = \"#5E81AC\"/g" \
    -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
    -e "s/foreground='.*'/foreground='#A3BE8C'/g" \
    -e "s/origin = .*/origin = bottom-right/g" \
    -e "s/offset = .*/offset = 8x36/g" \
    -e "s/icon_position = .*/icon_position = left/g" \
    -e "s/max_icon_size = .*/max_icon_size = 50/g" \
    -e "s/corner_radius = .*/corner_radius = 0/g"

  
  sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
  cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
    [urgency_low]
    timeout = 3
    background = "#2E3440"
    foreground = "#D8DEE9"

    [urgency_normal]
    timeout = 6
    background = "#2E3440"
    foreground = "#D8DEE9"

    [urgency_critical]
    timeout = 0
    background = "#2E3440"
    foreground = "#D8DEE9"
_EOF_
}

# Set eww colors
set_eww_colors() {
  cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Aing rice
\$bg: #2E3440;
\$bg-alt: #3B4252;
\$fg: #D8DEE9;
\$black: #3B4252;
\$lightblack: #4C566A;
\$red: #BF616A;
\$blue: #5E81AC;
\$cyan: #88C0D0;
\$magenta: #B48EAD;
\$green: #A3BE8C;
\$yellow: #EBCB8B;
\$archicon: #81A1C1;
EOF
}

# Set jgmenu colors for Aing
set_jgmenu_colors() {
  sed -i "$HOME"/.config/bspwm/jgmenurc \
    -e 's/color_menu_bg = .*/color_menu_bg = #2E3440/' \
    -e 's/color_norm_fg = .*/color_norm_fg = #D8DEE9/' \
    -e 's/color_sel_bg = .*/color_sel_bg = #3B4252/' \
    -e 's/color_sel_fg = .*/color_sel_fg = #D8DEE9/' \
    -e 's/color_sep_fg = .*/color_sep_fg = #4C566A/'
}

# Set Rofi launcher config
set_launcher_config () {
  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Aing

* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: #2E3440;
    background-alt: #3B4252E0;
    foreground: #D8DEE9;
    selected: #88C0D0;
    active: #A3BE8C;
    urgent: #BF616A;
    img-background: url("~/.config/bspwm/rices/nord/rofi.webp", width);
    main-bg: #2E3440E0;
    main-fg: #D8DEE9;
    main-fg-alt: #3B4252E0;
    select-bg: #88C0D0;
    select-fg: #2E3440;
}
EOF
sed -i "$HOME/.config/bspwm/src/rofi-themes/Window.rasi" \
    -e '17s|\(font:\s*\).*|\1"Terminess Nerd Font Mono Bold 10";|' \
    -e 's|\(font-weight:\s*\).*|\1bold;|' \
    -e 's|\(background:\s*\).*|\1#2E3440;|' \
    -e 's|\(background-alt:\s*\).*|\1#3B4252E0;|' \
    -e 's|\(foreground:\s*\).*|\1#D8DEE9;|' \
    -e 's|\(selected:\s*\).*|\1#88C0D0;|' \
    -e 's|\(highlight:\s*\).*|\1#A3BE8C;|' \
    -e 's|\(urgent:\s*\).*|\1#BF616A;|' \
    -e 's|\(window-format:\s*\).*|\1" {c}  󰇙  {t}";|' \
    -e '25s|\(on:\s*\).*|\1#A3BE8C;|' \
    -e '26s|\(off:\s*\).*|\1#BF616A;|' \
    -e '60s|\(background-color:\s*\).*|\1@selected;|' \
    -e '61s|\(text-color:\s*\).*|\1@background-alt;|' \
    -e '67s|\(background-color:\s*\).*|\1@selected;|' \
    -e '68s|\(text-color:\s*\).*|\1@background-alt;|' \
    -e '72s|\(border-color:\s*\).*|\1@selected;|' \
    -e 's|\(background-image:.*rices/\)[^/]*|\1aing|'
}

# Set color cava #bak-e "78s/gradient_color_1 = .*/gradient_color_1 = '#5E81AC'/g"
set_cava() {
  sed -i "$HOME/.config/cava/config" \
    -e "s/foreground = .*/foreground = 'cyan'/g"
}

# Appearance
set_appearance() {
  XFILE="$BDIR/xsettingsd"
  GTK2FILE="$HOME/.gtkrc-2.0"
  GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

  # apply gtk theme, icons, cursor & fonts
  if [[ `pidof xsettingsd` ]]; then
    sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Pop-nord-dark\"|g" ${XFILE}
    sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Nordzy-dark\"|g" ${XFILE}
    sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"Breeze_Snow\"|g" ${XFILE}
  else
    sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"JetBrainsMono 10\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Pop-nord-dark\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Nordzy-dark\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"Breeze_Snow\"/g" ${GTK2FILE}
    
    sed -i -e "s/gtk-font-name=.*/gtk-font-name=JetBrainsMono 10/g" ${GTK3FILE}
    sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Pop-nord-dark/g" ${GTK3FILE}
    sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Nordzy-dark/g" ${GTK3FILE}
    sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Breeze_Snow/g" ${GTK3FILE}
  fi
  
  # inherit cursor theme
  if [[ -f "$HOME"/.icons/default/index.theme ]]; then
    sed -i -e "s/Inherits=.*/Inherits=Breeze_Snow/g" "$HOME"/.icons/default/index.theme
  fi  
}

# Launch the bar and or eww widgets
launch_bars() {

  for mon in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$mon polybar -q aing-bar -c ${rice_dir}/config.ini &
  done

}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_alacritty_config
set_kitty_config
set_stalonetray_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
set_cava
set_appearance

