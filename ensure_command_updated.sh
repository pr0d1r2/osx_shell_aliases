function ensure_command_updated() {
  case $1 in
    aws | gpg | postgres | magick)
      brew upgrade `ensure_command_package $1` 2>/dev/null || \
        brew install `ensure_command_package $1` 2>/dev/null || \
          brew install `ensure_command_package $1` || return $?
      ;;
    *)
      local ensure_command_updated_PACKAGE=`brew search $1 | cut -f 1 -d ' ' | grep "^$1$"`
      case $ensure_command_updated_PACKAGE in
        "")
          local ensure_command_updated_PACKAGE=`brew cask search $1 | cut -f 1 -d ' ' | grep "^$1$"`
          case $ensure_command_updated_PACKAGE in
            "")
              ;;
            *)
              brew cask upgrade $ensure_command_updated_PACKAGE 2>/dev/null \
                brew cask install $ensure_command_updated_PACKAGE 2>/dev/null || \
                  brew cask install $ensure_command_updated_PACKAGE || return $?
              ;;
          esac
          ;;
        *)
          brew upgrade $ensure_command_updated_PACKAGE 2>/dev/null || \
            brew install $ensure_command_updated_PACKAGE 2>/dev/null || \
              brew install $ensure_command_updated_PACKAGE || return $?
          ;;
      esac
      ;;
  esac
  case $1 in
    *@*)
      brew link $1 --force || return $?
      ;;
  esac
}
