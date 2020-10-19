function cpu_info() {
  sysctl -n machdep.cpu.brand_string || return $?
}
