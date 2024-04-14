#! /bin/sh

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar by the love of god
echo "---" 

polybar main -c $HOME/.config/polybar/config.ini &

echo "Bar launched..."
