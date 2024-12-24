#!/bin/bash

calendar=(
  icon=􀐫
  icon.font="$FONT:Black:12.0"
  icon.padding_right=$PADDINGS
  label.align=right
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
