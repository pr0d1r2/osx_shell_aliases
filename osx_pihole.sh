function osx_pihole() {
  docker pull pihole/pihole || return $?
  docker run \
    -d \
    --name pihole \
    -e ServerIP="$(ipconfig getifaddr en0)" \
    -e WEBPASSWORD="$OSX_PIHOLE_WEBPASSWORD" \
    -e DNS1=8.8.8.8 \
    -p 80:80 \
    -p 53:53/tcp \
    -p 53:53/udp \
    -p 443:443 \
    pihole/pihole:latest || return $?
  networksetup -setdnsservers Wi-Fi 127.0.0.1 || return $?
}
