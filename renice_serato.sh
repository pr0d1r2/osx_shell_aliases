function renice_serato() {
  sudo echo && ps -x | grep -i serato | cut -b1-5 | parallel "sudo renice -18 {}"
  return $?
}
