function osx_pendrive_high_sierra() {
  local osx_pendrive_high_sierra_RESPONSE
  local osx_pendrive_high_sierra_PATH
  echo "Do you really want to make '$1' a High Sierra Install Pendrive? [y/N]"
  read -r osx_pendrive_high_sierra_RESPONSE
  case $osx_pendrive_high_sierra_RESPONSE in
    y | Y | yes | YES)
      ;;
    *)
      return 200
      ;;
  esac
  if [ -d /Volumes/Storage/Applications/Install\ macOS\ Sierra.app ]; then
    osx_pendrive_high_sierra_PATH="/Volumes/Storage/Applications/Install macOS High Sierra.app"
  else
    osx_pendrive_high_sierra_PATH="/Applications/Install macOS High Sierra.app"
  fi
  sudo \
    "$osx_pendrive_high_sierra_PATH/Contents/Resources/createinstallmedia" \
    --volume "$1" \
    --applicationpath \
    "$osx_pendrive_high_sierra_PATH" \
    return $?
}
