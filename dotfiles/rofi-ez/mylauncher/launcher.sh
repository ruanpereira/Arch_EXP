#!/usr/bin/env bash

## Forked from:
## Aditya Shakya
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Ez.OS Style
#

dir="$HOME/.config/rofi/mylauncher"
theme='style-ezos'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
