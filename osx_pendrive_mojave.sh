function osx_pendrive_mojave() {
  local osx_pendrive_mojave_RESPONSE
  local osx_pendrive_mojave_PATH
  echo "Do you really want to make '$1' a Mojave Install Pendrive? [y/N]"
  read -r osx_pendrive_mojave_RESPONSE
  case $osx_pendrive_mojave_RESPONSE in
    y | Y | yes | YES)
      ;;
    *)
      return 200
      ;;
  esac
  if [ -d /Volumes/Storage/Applications/Install\ macOS\ Sierra.app ]; then
    osx_pendrive_mojave_PATH="/Volumes/Storage/Applications/Install macOS Mojave.app"
  else
    osx_pendrive_mojave_PATH="/Applications/Install macOS Mojave.app"
  fi
  sudo \
    "$osx_pendrive_mojave_PATH/Contents/Resources/createinstallmedia" \
    --volume "$1" \
    --applicationpath \
    "$osx_pendrive_mojave_PATH" \
    return $?
}
