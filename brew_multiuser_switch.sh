function brew_multiuser_switch() {
  sudo echo || return $?
  parallel \
    "sudo chown -R $(whoami) {}" \
    ::: \
    /usr/local/Cellar/sqlite/ \
    /usr/local/var/homebrew \
    /usr/local/Homebrew \
    /usr/local/share
}
