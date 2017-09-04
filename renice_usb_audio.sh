function renice_usb_audio() {
  renice_named CTHelper
  return $?
}
