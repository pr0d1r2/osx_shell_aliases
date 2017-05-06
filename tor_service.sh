function tor_service() {
  local tor_service_CMD
  ensure_command tor || return $?
  ensure_command torsocks || return $?
  brew services start tor || return $?
}
