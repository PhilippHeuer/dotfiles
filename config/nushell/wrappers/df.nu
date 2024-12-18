def --wrapped df [...args] {
    let run = (^df ...$args | complete)

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
        $run.stdout | ^column -t | from ssv
    } catch {|e|
        $run.stdout
    }
}
