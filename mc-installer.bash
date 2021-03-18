#!/bin/bash
# Everything below will be sent to log.out
    PASSWD="$(zenity --password --title=Authentication 2>/dev/null)"

# Verify if yad is installed
YAD_VERSION=$(yad --version | head -c 1)
if [[ ! $YAD_VERSION -ge 0 ]]; then
    echo $PASSWD | sudo apt-get install yad
fi

# User decides if he want to install
if yad --question --title="Minecraft installer" --text "Are you sure you want to install Minecraft?" --ok-label="Yeeess :D" --cancel-label="No :("

then
    # Create a file log.out to execute the download
    exec 3>&1 4>&2
    trap 'exec 1>&3' 0 1 2 3
    exec 1>log

    # Create a file log.out to execute the download
    exec 3>&1 4>&2
    trap 'exec 2>&4 1>&3' 0 1 2 3
    exec 2>err

    echo "> Fetching..."

    exec 5> >(yad --text-info \
        --no-buttons \
        --width=600 --height=200 \
        --title="Minecraft uninstaller"
    )

    MSG=$(echo $PASSWD | sudo -kS cat log)

    echo $MSG >&5
    echo "> Downloading..." >&5
    echo $PASSWD | exec sudo -kS snap install mc-installer && 
    echo "> Minecraft-installer is now downloaded!! :D" >&5 ||
    echo "> Something went wrong :(" >&5

fi

