function osx_pendrive_sierra() {
  local osx_pendrive_sierra_RESPONSE
  echo "Do you really want to make '$1' and Sierra Install Pendrive? [y/N]"
  read osx_pendrive_sierra_RESPONSE
  case $osx_pendrive_sierra_RESPONSE in
    y | Y | yes | YES)
      ;;
    *)
      return 8472
      ;;
  esac
  sudo \
    /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia \
    --volume "$1" \
    --applicationpath \
    /Applications/Install\ macOS\ Sierra.app \
    return $?
}
