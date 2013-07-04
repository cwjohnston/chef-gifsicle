#!/usr/bin/env bats

@test "installed gifsicle binary at /usr/local/bin/gifsicle" {
    [ -e '/usr/local/bin/gifsicle' ]
}
