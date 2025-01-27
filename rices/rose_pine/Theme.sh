## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for nguyen@machine
set_bspwm_config() {
  bspc config border_width 0
  bspc config top_padding 2
  bspc config bottom_padding 30
  bspc config normal_border_color "#393552"
  bspc config active_border_color "#393552"
  bspc config focused_border_color "#c4a7e7"
  bspc config presel_feedback_color "#c4a7e7"
  bspc config left_padding 2
  bspc config right_padding 2
  bspc config window_gap 6
}

# Reload terminal colors
set_alacritty_config() {
  cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# Rosé Pine Theme

# Default colors
[colors.primary]
background = "#191724"
foreground = "#e0def4"

# Cursor colors
[colors.cursor]
cursor = "#e0def4"
text = "#191724"

# Normal colors
[colors.normal]
black = "#26233a"
blue = "#9ccfd8"
cyan = "#ebbcba"
green = "#31748f"
magenta = "#c4a7e7"
red = "#eb6f92"
white = "#e0def4"
yellow = "#f6c177"

# Bright colors
[colors.bright]
black = "#6e6a86"
blue = "#9ccfd8"
cyan = "#ebbcba"
green = "#31748f"
magenta = "#c4a7e7"
red = "#eb6f92"
white = "#e0def4"
yellow = "#f6c177"
EOF
}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## (Rosé Pine) Color scheme


# The basic colors
foreground              #e0def4
background              #191724
selection_foreground    #191724
selection_background    #c4a7e7

# Cursor colors
cursor                  #e0def4
cursor_text_color       #191724

# URL underline color when hovering with mouse
url_color               #9ccfd8

# Kitty window border colors
active_border_color     #e0def4
inactive_border_color   #6e6a86
bell_border_color       #f6c177

# Tab bar colors
active_tab_foreground   #191724
active_tab_background   #e0def4
inactive_tab_foreground #e0def4
inactive_tab_background #26233a
tab_bar_background      #191724

# The 16 terminal colors

# black
color0 #26233a
color8 #6e6a86

# red
color1 #eb6f92
color9 #eb6f92

# green
color2  #31748f
color10 #31748f

# yellow
color3  #f6c177
color11 #f6c177

# blue
color4  #9ccfd8
color12 #9ccfd8

# magenta
color5  #c4a7e7
color13 #c4a7e7

# cyan
color6  #ebbcba
color14 #ebbcba

# white
color7  #e0def4
color15 #e0def4
EOF

killall -USR1 kitty
}



# Set stalonetray config
set_stalonetray_config() {
  sed -i "$HOME"/.config/bspwm/stalonetrayrc \
    -e "s/background .*/background \"#191724\"/" \
    -e "s/vertical .*/vertical true/" \
    -e "s/geometry .*/geometry 1x1-36+1000/" \
    -e "s/grow_gravity .*/grow_gravity SE/" \
    -e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
    -e "s/transparency = .*/transparency = 0/g" \
    -e "s/frame_color = .*/frame_color = \"#191724\"/g" \
    -e "s/separator_color = .*/separator_color = \"#9ccfd8\"/g" \
    -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
    -e "s/foreground='.*'/foreground='#31748f'/g" \
    -e "s/origin = .*/origin = bottom-right/g" \
    -e "s/offset = .*/offset = 8x36/g" \
    -e "s/icon_position = .*/icon_position = left/g" \
    -e "s/max_icon_size = .*/max_icon_size = 50/g" \
    -e "s/corner_radius = .*/corner_radius = 0/g"

  
  sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
  cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
    [urgency_low]
    timeout = 3
    background = "#191724"
    foreground = "#e0def4"

    [urgency_normal]
    timeout = 6
    background = "#191724"
    foreground = "#e0def4"

    [urgency_critical]
    timeout = 0
    background = "#191724"
    foreground = "#e0def4"
_EOF_
}

# Set eww colors
set_eww_colors() {
  cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Aing rice
\$bg: #191724;
\$bg-alt: #26233a;
\$fg: #e0def4;
\$black: #26233a;
\$lightblack: #6e6a86;
\$red: #eb6f92;
\$blue: #9ccfd8;
\$cyan: #ebbcba;
\$magenta: #c4a7e7;
\$green: #31748f;
\$yellow: #f6c177;
\$archicon: #9ccfd8;
EOF
}

# Set jgmenu colors for Aing
set_jgmenu_colors() {
  sed -i "$HOME"/.config/bspwm/jgmenurc \
    -e 's/color_menu_bg = .*/color_menu_bg = #191724/' \
    -e 's/color_norm_fg = .*/color_norm_fg = #e0def4/' \
    -e 's/color_sel_bg = .*/color_sel_bg = #26233a/' \
    -e 's/color_sel_fg = .*/color_sel_fg = #e0def4/' \
    -e 's/color_sep_fg = .*/color_sep_fg = #6e6a86/'
}

# Set Rofi launcher config
set_launcher_config () {
  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Aing

* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: #191724;
    background-alt: #26233aE0;
    foreground: #e0def4;
    selected: #c4a7e7;
    active: #31748f;
    urgent: #eb6f92;
    img-background: url("~/.config/bspwm/rices/rose_pine/rofi.webp", width);
    main-bg: #191724E0;
    main-fg: #e0def4;
    main-fg-alt: #26233aE0;
    select-bg: #c4a7e7;
    select-fg: #191724;
}
EOF
sed -i "$HOME/.config/bspwm/src/rofi-themes/Window.rasi" \
    -e '17s|\(font:\s*\).*|\1"Terminess Nerd Font Mono Bold 10";|' \
    -e 's|\(font-weight:\s*\).*|\1bold;|' \
    -e 's|\(background:\s*\).*|\1#191724;|' \
    -e 's|\(background-alt:\s*\).*|\1#26233aE0;|' \
    -e 's|\(foreground:\s*\).*|\1#e0def4;|' \
    -e 's|\(selected:\s*\).*|\1#c4a7e7;|' \
    -e 's|\(highlight:\s*\).*|\1#31748f;|' \
    -e 's|\(urgent:\s*\).*|\1#eb6f92;|' \
    -e 's|\(window-format:\s*\).*|\1" {c}  󰇙  {t}";|' \
    -e '25s|\(on:\s*\).*|\1#31748f;|' \
    -e '26s|\(off:\s*\).*|\1#eb6f92;|' \
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
    -e "s/foreground = .*/foreground = 'magenta'/g"
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

