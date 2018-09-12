function ensure_command_package() {
  case $1 in
    aws) echo awscli;;
    7z) echo p7zip;;
    gpg) echo gnupg;;
    postgres) echo postgresql;;
    Magick-config) echo imagemagick;;
    Magick-config@6) echo imagemagick@6;;
    socksify) echo dante;;
    xml2-config) echo libxml2;;
    redis-cli) echo redis;;
    *) echo "$1";;
  esac
  return $?
}
