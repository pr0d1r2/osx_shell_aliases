function rsync_osx_home_dir() {
  rsync $@ \
    --exclude ".Trashes" \
    --exclude "Library/Application Support" \
    --exclude "Library/IdentityServices" \
    --exclude "Library/Messages" \
    --exclude "Library/HomeKit" \
    --exclude "Library/Sharing" \
    --exclude "Library/Mail" \
    --exclude "Library/Safari" \
    --exclude "Library/Suggestions" \
    --exclude "Library/Suggestions" \
    --exclude "Library/Containers" \
    --exclude "Library/PersonalizationPortrait" \
    --exclude "Library/Metadata" \
    --exclude "Library/Cookies" \
    --exclude "Library/Caches" \
    --exclude "Library/Developer" \
    --exclude "Library/Logs" \
    --exclude "Library/Mobile Documents" \
    --exclude "Library/Group Containers/group.com.docker" \
    --exclude "Library/Containers/com.docker.docker" \
    --exclude ".rbenv" \
    --exclude ".vagrant.d" \

  return $?
}
