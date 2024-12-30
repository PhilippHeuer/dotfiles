def --wrapped primecodegen [...args] {
    let run = (^primecodegen ...$args | complete)

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
