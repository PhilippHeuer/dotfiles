def --wrapped tmx [...args] {
    let run = (^tmx ...$args | complete)

    if $run.exit_code != 0 {
      error make {
        msg: $run.stderr,
        label: {
          text: "execution failed",
          span: (metadata $args).span
        }
      }
    }

    try {
        $run.stdout | from json
    } catch {|e|
        $run.stdout
    }
}

def --wrapped fuzzmux [...args] {
    let run = (^fuzzmux ...$args | complete)

    if $run.exit_code != 0 {
      error make {
        msg: $run.stderr,
        label: {
          text: "execution failed",
          span: (metadata $args).span
        }
      }
    }

    try {
        $run.stdout | from json
    } catch {|e|
        $run.stdout
    }
}
