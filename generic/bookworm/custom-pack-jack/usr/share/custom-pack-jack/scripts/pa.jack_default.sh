#!/bin/sh

# Load PulseAudio JACK modules
# NOTE: this is not necessary if D-Bus is used (and cannot hurt if it is)
pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source channels=2

# Connect PulseAudio to JACK
pacmd set-default-sink jack_out
pacmd set-default-source jack_in

