function renice_tidal() {
  sudo echo && ps -x | grep -i tidal | cut -b1-5 | parallel "sudo renice -18 {}"
  return $?
}
