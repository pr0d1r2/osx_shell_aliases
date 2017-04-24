function ensure_command() {
  which $1 &>/dev/null
  if [ $? -eq 0 ]; then
    return 0
  fi
  case $1 in
    aws)
      echorun brew install awscli || return $?
      ;;
    postgres)
      echorun brew install postgresql || return $?
      ;;
    *)
      local ensure_command_brew_params_PACKAGE=`brew search $1 | grep "^$1$"`
      case $ensure_command_brew_params_PACKAGE in
        "")
          local ensure_command_brew_params_PACKAGE=`brew cask search $1 | grep "^$1$"`
          case $ensure_command_brew_params_PACKAGE in
            "")
              ;;
            *)
              echorun brew cask install $ensure_command_brew_params_PACKAGE || return $?
              ;;
          esac
          ;;
        *)
          echorun brew install $ensure_command_brew_params_PACKAGE || return $?
          ;;
      esac
      ;;
  esac
}
