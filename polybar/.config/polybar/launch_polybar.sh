if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload d2fn &
  done
else
  polybar --reload d2fn &
fi
