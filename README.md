# Scripts I use for polybar and other stuff

- Clone this repo in `$HOME`

```sh
- SSH: git clone git@github.com:SushiJ/scripts.git
- HTTPS: git clone https://github.com/SushiJ/scripts.git
```

## Polybar

#### Weather script

[OpenWeatherApi](https://openweathermap.org) to fetch the data. [Metric system]

You'll have to set your **[API_KEY](https://openweathermap.org/api)** in the `$HOME/scripts/cred.txt`

- copy the following snippet in `$HOME/.config/polybar/config.ini`

```ini
[module/weather]
type = custom/script

exec = "$HOME/scripts/weather.sh"
; Call every 15 minutes
interval = 900
```

- make changes in `$HOME/scripts/weather.sh`

```sh
https://api.openweathermap.org/data/2.5/weather?q=[CITY]&units=[UNITS]
```

#### Apt upgradable packages script

- copy the following snippet in `$HOME/.config/polybar/config.ini`

```ini
[module/apt]
type = custom/script

exec = ~/scripts/update-apt.sh
; call every 3 hours
interval = 162000
```

[polybar](https://github.com/polybar/polybar/wiki/Module:-script) info on running custom scripts.

Make sure to address the modules in modules section. [Example](https://github.com/SushiJ/.dotfiles/blob/main/polybar/.config/polybar/config.ini#L79)
