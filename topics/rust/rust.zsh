# Rust helper - switch versions via mise
use-rust() {
  mise use rust@${1:-latest}
}
