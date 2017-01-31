function sync_hammerspoon() {
  if [ ! -d ~/.hammerspoon ]; then
    echorun git clone git@github.com:pr0d1r2/dothammerspoon.git ~/.hammerspoon --recurse-submodules || return $?
  else
    echorun cd ~/.hammerspoon || return $?
    echorun git pull --recurse-submodules || return $?
    echorun git submodule update --recursive --remote || return $?
    cd - || return $?
  fi
}
