#!/bin/bash

echo "=== Audio Debug Report ==="
echo

echo "1. Available Sound Cards:"
aplay -l | grep "card"
echo

echo "2. Jack Detection Status:"
for card in /proc/asound/card*; do
    card_num="${card##*card}"
    echo "Card $card_num:"
    amixer -c "$card_num" cget 'iface=CARD,name=Headphone Jack' 2>/dev/null || echo "  No headphone jack control found"
    amixer -c "$card_num" cget 'iface=CARD,name=Mic Jack' 2>/dev/null || echo "  No mic jack control found"
done
echo

echo "3. PulseAudio Port Availability:"
pacmd list-cards | awk '
/active profile:/,/ports:/
/ports:/ {show=1; next}
/show=1 && /^$/ {show=0}
show && /analog-output/ {print "  " $0}
'
echo

echo "4. Current Audio Output:"
pactl list sinks short
echo
pactl list sinks | grep -A 10 "Active Port"

echo
echo "=== End of Report ==="   
