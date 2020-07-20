function rsync_osx_home_dir() {
  rsync $@ \
    --exclude .Trashes \
    --exclude Library/Mail \
    --exclude Library/Caches \
    --exclude Library/Containers/com.docker.docker \
    --exclude Library/Developer \
    --exclude Library/Logs \
    --exclude "Library/Mobile Documents" \
    --exclude .rbenv \
    --exclude .vagrant.d \
    --exclude "Library/Application Support" \

  return $?
}
