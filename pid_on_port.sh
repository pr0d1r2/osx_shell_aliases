# Show PIDs on given TCP ports in macOS
#
# Example usage:
#   on_port 3000 4000
# Returns:
#   8472
#   6969
function pid_on_port() {
  parallel "lsof -nP -iTCP:{} | grep LISTEN | awk '{ print \$2 }'" ::: $@ | sort -u
}
