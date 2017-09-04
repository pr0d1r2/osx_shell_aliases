function renice_usb() {
  renice_named \
    usbd \
    usbmuxd
  return $?
}
