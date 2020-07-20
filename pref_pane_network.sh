function pref_pane_network() {
  open -b com.apple.systempreferences /System/Library/PreferencePanes/Network.prefPane
  return $?
}
