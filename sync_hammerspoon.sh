function sync_hammerspoon() {
  if [ -d ~/projects/dothammerspoon ]; then
    echorun cd ~/projects/dothammerspoon || return $?
    echorun git pull --recurse-submodules || return $?
    echorun git submodule update --recursive --remote || return $?
    git status | grep -q 'Your branch is up-to-date'
    if [ $? -gt 0 ]; then
      echorun git commit -a -m "Update configuration" || return $?
      echorun git push || return $?
    fi
    cd - || return $?
  fi
  if [ ! -d ~/.hammerspoon ]; then
    echorun git clone git@github.com:pr0d1r2/dothammerspoon.git ~/.hammerspoon --recurse-submodules || return $?
  else
    echorun cd ~/.hammerspoon || return $?
    echorun git pull --recurse-submodules || return $?
    echorun git submodule update --recursive --remote || return $?
    cd - || return $?
  fi
}
