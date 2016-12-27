function camera_reset() {
  echo "Fixing 'There is no connected camera'"
  echorun sudo killall VDCAssistant
  echorun sudo killall AppleCameraAssistant
}
