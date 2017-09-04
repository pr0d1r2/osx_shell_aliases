function ensure_command_package() {
  case $1 in
    aws)
      echo awscli || return $?
      ;;
    gpg)
      echo gnupg || return $?
      ;;
    postgres)
      echo postgresql || return $?
      ;;
    magick)
      echo imagemagick || return $?
      ;;
    socksify)
      echo dante || return $?
      ;;
    *)
      echo "$1" || return $?
      ;;
  esac
}
