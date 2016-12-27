function nproc() {
  sysctl -n hw.ncpu || return $?
}
