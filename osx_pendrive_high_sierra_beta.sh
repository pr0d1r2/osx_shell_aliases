function osx_pendrive_high_sierra_beta() {
  local osx_pendrive_high_sierra_beta_RESPONSE
  local osx_pendrive_high_sierra_beta_PATH
  echo "Do you really want to make '$1' a High Sierra Beta Install Pendrive? [y/N]"
  read -r osx_pendrive_high_sierra_beta_RESPONSE
  case $osx_pendrive_high_sierra_beta_RESPONSE in
    y | Y | yes | YES)
      ;;
    *)
      return 200
      ;;
  esac
  if [ -d /Volumes/Storage/Applications/Install\ macOS\ Sierra.app ]; then
    osx_pendrive_high_sierra_beta_PATH="/Volumes/Storage/Applications/Install macOS High Sierra Beta.app"
  else
    osx_pendrive_high_sierra_beta_PATH="/Applications/Install macOS High Sierra Beta.app"
  fi
  sudo \
    "$osx_pendrive_high_sierra_beta_PATH/Contents/Resources/createinstallmedia" \
    --volume "$1" \
    --applicationpath \
    "$osx_pendrive_high_sierra_beta_PATH" \
    return $?
}
