#!/bin/bash
# Verify if yad is installed
YAD_VERSION= echo $(yad --version | egrep -o '[0-9]')
if [[ $YAD_VERSION -gt 1 ]]; then
    sudo apt-get install yad
fi


# User decides if he want to uninstall
if zenity --question --title="Minecraft installer" --text "Are you sure you want to uninstall Minecraft?" --ok-label="Not sure but I'll uninstall it anyway" --cancel-label="No"; then

    PASSWD="$(yad --title="Password" \
    --text="Please, enter your password" \
    --image="dialog-password" \
    --entry --hide-text 2>/dev/null)"

    exec 5> >(panel=$(yad --text-info \
        --no-buttons \
        --width=600 --height=200 \
        --title="Minecraft uninstaller")
        )

    case $panel in
        sth)
            ^c
        ;;
    esac

    echo "Uninstalling Minecraft..." >&5

    echo $PASSWD | sudo -kS snap remove mc-installer &&

    echo "Minecraft was removed from your computer ;)" >&5 ||

    echo "Something went wrong :( try again" >&5
fi

