function osx_pendrive_el_captain() {
  local osx_pendrive_el_captain_RESPONSE
  echo "Do you really want to make '$1' and El Captain Install Pendrive? [y/N]"
  read -r osx_pendrive_el_captain_RESPONSE
  case $osx_pendrive_el_captain_RESPONSE in
    y | Y | yes | YES)
      ;;
    *)
      return 200
      ;;
  esac
  sudo \
    /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia \
    --volume "$1" \
    --applicationpath \
    /Applications/Install\ OS\ X\ El\ Capitan.app \
    return $?
}
