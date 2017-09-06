function osx_pendrive_el_captain() {
  local osx_pendrive_el_captain_RESPONSE
  local osx_pendrive_el_captain_PATH
  echo "Do you really want to make '$1' and El Captain Install Pendrive? [y/N]"
  read -r osx_pendrive_el_captain_RESPONSE
  case $osx_pendrive_el_captain_RESPONSE in
    y | Y | yes | YES)
      ;;
    *)
      return 200
      ;;
  esac
  if [ -d /Volumes/Storage/Applications/Install\ OS\ X\ El\ Capitan.app ]; then
    osx_pendrive_el_captain_PATH="/Volumes/Storage/Applications/Install OS X El Capitan.app"
  else
    osx_pendrive_el_captain_PATH="/Applications/Install OS X El Capitan.app"
  fi
  sudo \
    "$osx_pendrive_el_captain_PATH/Contents/Resources/createinstallmedia" \
    --volume "$1" \
    --applicationpath \
    "$osx_pendrive_el_captain_PATH" \
    return $?
}
