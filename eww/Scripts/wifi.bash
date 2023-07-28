get_ssid() {
    icons=("󰤨" "󰤭")

    myssid=$(iwgetid -r)
    ssid_len=${#myssid}

    if [ $ssid_len != 0 ]; then
        echo ${icons[0]}
    fi
    if [ $ssid_len -eq 0 ]; then
        echo ${icons[1]}
    fi

}

get_ssid