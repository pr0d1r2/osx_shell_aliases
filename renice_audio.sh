function renice_audio() {
  renice_named \
    coreaudiod \
    com.apple.audio.SandboxHelper \
    com.apple.audio.DriverHelper && \
  renice_serato && \
  renice_tidal
  return $?
}
