function ensure_command() {
  local ensure_command_NAME
  for ensure_command_NAME in "$@"
  do
    which "$(echo "$ensure_command_NAME" | cut -f 1 -d @)" &>/dev/null && return 0
    case $ensure_command_NAME in
      aws | gpg | postgres | magick | socksify)
        echorun brew install "$(ensure_command_package "$ensure_command_NAME")" || return $?
        ;;
      *)
        local ensure_command_PACKAGE
        ensure_command_PACKAGE=$(brew search "$ensure_command_NAME" | grep "^$ensure_command_NAME$")
        case $ensure_command_PACKAGE in
          "")
            local ensure_command_PACKAGE
            ensure_command_PACKAGE=$(brew cask search "$ensure_command_NAME" | grep "^$ensure_command_NAME$")
            case $ensure_command_PACKAGE in
              "")
                ;;
              *)
                echorun brew cask install "$ensure_command_PACKAGE" || return $?
                ;;
            esac
            ;;
          *)
            echorun brew install "$ensure_command_PACKAGE" || return $?
            ;;
        esac
        ;;
    esac
    case $ensure_command_NAME in
      *@*)
        brew link "$ensure_command_NAME" --force || return $?
        ;;
    esac
  done
}
