## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for nguyen@machine
set_bspwm_config() {
  bspc config border_width 0
  bspc config top_padding 2
  bspc config bottom_padding 30
  bspc config normal_border_color "#3b3b3b"
  bspc config active_border_color "#3b3b3b"
  bspc config focused_border_color "#8197bf"
  bspc config presel_feedback_color "#8197bf"
  bspc config left_padding 2
  bspc config right_padding 2
  bspc config window_gap 6
}

# Reload terminal colors
set_alacritty_config() {
  cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# Jellybeans Theme

# Default colors
[colors.primary]
background = "#151515"
foreground = "#e8e8d3"

# Cursor colors
[colors.cursor]
cursor = "#e8e8d3"
text = "#151515"

# Normal colors
[colors.normal]
black = "#1c1c1c"
blue = "#8197bf"
cyan = "#8fbfdc"
green = "#99ad6a"
magenta = "#c6b6ee"
red = "#cf6a4c"
white = "#e8e8d3"
yellow = "#fad07a"

# Bright colors
[colors.bright]
black = "#666666"
blue = "#96cbfe"
cyan = "#c6c5fe"
green = "#a8ff60"
magenta = "#ff73fd"
red = "#ff6a6a"
white = "#ffffff"
yellow = "#ffffa6"
EOF
}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## (Jellybeans) Color scheme


# The basic colors
foreground              #e8e8d3
background              #151515
selection_foreground    #151515
selection_background    #8197bf

# Cursor colors
cursor                  #e8e8d3
cursor_text_color       #151515

# URL underline color when hovering with mouse
url_color               #8fbfdc

# Kitty window border colors
active_border_color     #e8e8d3
inactive_border_color   #666666
bell_border_color       #fad07a

# Tab bar colors
active_tab_foreground   #151515
active_tab_background   #e8e8d3
inactive_tab_foreground #e8e8d3
inactive_tab_background #1c1c1c
tab_bar_background      #151515

# The 16 terminal colors

# black
color0 #1c1c1c
color8 #666666

# red
color1 #cf6a4c
color9 #ff6a6a

# green
color2  #99ad6a
color10 #a8ff60

# yellow
color3  #fad07a
color11 #ffffa6

# blue
color4  #8197bf
color12 #96cbfe

# magenta
color5  #c6b6ee
color13 #ff73fd

# cyan
color6  #8fbfdc
color14 #c6c5fe

# white
color7  #e8e8d3
color15 #ffffff
EOF

killall -USR1 kitty
}

# Set stalonetray config
set_stalonetray_config() {
  sed -i "$HOME"/.config/bspwm/stalonetrayrc \
    -e "s/background .*/background \"#151515\"/" \
    -e "s/vertical .*/vertical true/" \
    -e "s/geometry .*/geometry 1x1-36+1000/" \
    -e "s/grow_gravity .*/grow_gravity SE/" \
    -e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
    -e "s/transparency = .*/transparency = 0/g" \
    -e "s/frame_color = .*/frame_color = \"#151515\"/g" \
    -e "s/separator_color = .*/separator_color = \"#8fbfdc\"/g" \
    -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
    -e "s/foreground='.*'/foreground='#99ad6a'/g" \
    -e "s/origin = .*/origin = bottom-right/g" \
    -e "s/offset = .*/offset = 8x36/g" \
    -e "s/icon_position = .*/icon_position = left/g" \
    -e "s/max_icon_size = .*/max_icon_size = 50/g" \
    -e "s/corner_radius = .*/corner_radius = 0/g"

  
  sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
  cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
    [urgency_low]
    timeout = 3
    background = "#151515"
    foreground = "#e8e8d3"

    [urgency_normal]
    timeout = 6
    background = "#151515"
    foreground = "#e8e8d3"

    [urgency_critical]
    timeout = 0
    background = "#151515"
    foreground = "#e8e8d3"
_EOF_
}

# Set eww colors
set_eww_colors() {
  cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Jellybeans theme
\$bg: #151515;
\$bg-alt: #1c1c1c;
\$fg: #e8e8d3;
\$black: #1c1c1c;
\$lightblack: #666666;
\$red: #cf6a4c;
\$blue: #8197bf;
\$cyan: #8fbfdc;
\$magenta: #c6b6ee;
\$green: #99ad6a;
\$yellow: #fad07a;
\$archicon: #8fbfdc;
EOF
}

# Set jgmenu colors for Jellybeans
set_jgmenu_colors() {
  sed -i "$HOME"/.config/bspwm/jgmenurc \
    -e 's/color_menu_bg = .*/color_menu_bg = #151515/' \
    -e 's/color_norm_fg = .*/color_norm_fg = #e8e8d3/' \
    -e 's/color_sel_bg = .*/color_sel_bg = #1c1c1c/' \
    -e 's/color_sel_fg = .*/color_sel_fg = #e8e8d3/' \
    -e 's/color_sep_fg = .*/color_sep_fg = #666666/'
}

# Set Rofi launcher config
set_launcher_config () {
  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Jellybeans

* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: #151515;
    background-alt: #1c1c1cE0;
    foreground: #e8e8d3;
    selected: #8197bf;
    active: #99ad6a;
    urgent: #cf6a4c;
    img-background: url("~/.config/bspwm/rices/jellybeans/rofi.webp", width);
    main-bg: #151515E0;
    main-fg: #e8e8d3;
    main-fg-alt: #1c1c1cE0;
    select-bg: #8197bf;
    select-fg: #151515;
}
EOF
sed -i "$HOME/.config/bspwm/src/rofi-themes/Window.rasi" \
    -e '17s|\(font:\s*\).*|\1"Terminess Nerd Font Mono Bold 10";|' \
    -e 's|\(font-weight:\s*\).*|\1bold;|' \
    -e 's|\(background:\s*\).*|\1#151515;|' \
    -e 's|\(background-alt:\s*\).*|\1#1c1c1cE0;|' \
    -e 's|\(foreground:\s*\).*|\1#e8e8d3;|' \
    -e 's|\(selected:\s*\).*|\1#8197bf;|' \
    -e 's|\(highlight:\s*\).*|\1#99ad6a;|' \
    -e 's|\(urgent:\s*\).*|\1#cf6a4c;|' \
    -e 's|\(window-format:\s*\).*|\1" {c}  󰇙  {t}";|' \
    -e '25s|\(on:\s*\).*|\1#99ad6a;|' \
    -e '26s|\(off:\s*\).*|\1#cf6a4c;|' \
    -e '60s|\(background-color:\s*\).*|\1@selected;|' \
    -e '61s|\(text-color:\s*\).*|\1@background-alt;|' \
    -e '67s|\(background-color:\s*\).*|\1@selected;|' \
    -e '68s|\(text-color:\s*\).*|\1@background-alt;|' \
    -e '72s|\(border-color:\s*\).*|\1@selected;|' \
    -e 's|\(background-image:.*rices/\)[^/]*|\1aing|'
}

# Set color cava
set_cava() {
  sed -i "$HOME/.config/cava/config" \
    -e "s/foreground = .*/foreground = 'blue'/g"
}

# Appearance
set_appearance() {
  XFILE="$BDIR/xsettingsd"
  GTK2FILE="$HOME/.gtkrc-2.0"
  GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

  # apply gtk theme, icons, cursor & fonts
  if [[ `pidof xsettingsd` ]]; then
    sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Andromeda\"|g" ${XFILE}
    sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Nordzy-dark\"|g" ${XFILE}
    sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"Breeze_Snow\"|g" ${XFILE}
  else
    sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"JetBrainsMono 10\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Andromeda\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Nordzy-dark\"/g" ${GTK2FILE}
    sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"Breeze_Snow\"/g" ${GTK2FILE}
    
    sed -i -e "s/gtk-font-name=.*/gtk-font-name=JetBrainsMono 10/g" ${GTK3FILE}
    sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Andromeda/g" ${GTK3FILE}
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