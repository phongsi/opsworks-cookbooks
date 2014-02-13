@test 'lockrun is installed' {
  /usr/local/bin/lockrun --lockfile=/tmp/true.lock -- true
}
