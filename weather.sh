#!/bin/bash

FILE="$HOME/scripts/cred.txt"

res=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?q=Bengaluru&units=metric&appid=$(<$FILE)")
temp=$(echo $res | jq '.main.temp')
humidity=$(echo $res | jq '.main.humidity')
icon=$(echo $res | jq --raw-output '"\(.weather[0].icon)"')

get_icon() {
    case $1 in
        01d) icon=" " ;;
        01n) icon=" " ;;
        02d) icon=" " ;;
        02n) icon="  " ;;
        03*) icon="  " ;;
        04*) icon=" " ;;
        09*) icon="" ;;
        10*) icon="" ;;
        11*) icon="" ;;
        13*) icon="" ;;
        50*) icon="" ;;
        *) icon="" ;;
    esac
    echo $icon
}

echo $(get_icon "$icon") $temp $humidity | awk '{print $1 " %{F#8ABEB7}|%{F-} " $2 "" " %{F#8ABEB7}|%{F-} " $3 "% "}'
