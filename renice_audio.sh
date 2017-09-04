function renice_audio() {
  renice_named \
    coreaudiod \
    com.apple.audio.SandboxHelper \
    com.apple.audio.DriverHelper
  return $?
}
