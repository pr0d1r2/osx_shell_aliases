function stop_brew_service() {
  brew services list | grep "$1 " | grep -Eq "(started|error)" || return 0
  brew services stop "$1"
  return $?
}
