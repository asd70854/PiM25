#!/bin/bash

OTA="$(grep -Po 'OTA: \K.*' /home/pi/Local/env.txt)"

sleep 5
[ -f /home/pi/PiM25/PiM25.py ] && {
    /usr/bin/sudo git -C /home/pi/PiM25 fetch origin
    /usr/bin/sudo git -C /home/pi/PiM25 reset --hard origin/sinica
    /usr/bin/sudo nohup python -u /home/pi/PiM25/PiM25.py &
} || {
    /usr/bin/sudo git clone OTA /home/pi/PiM25
    /usr/bin/sudo nohup python -u /home/pi/PiM25/PiM25.py &
}

