$env.config.hooks.display_output = {
    metadata access {|meta| match $meta.content_type? {
        "application/x-nuscript" | "application/x-nuon" | "text/x-nushell" => { nu-highlight },
        "application/json" => { ^bat -Ppf --language=json },
        "application/xml" => { ^bat -Ppf --language=xml },
        "application/yaml" => { ^bat -Ppf --language=yaml },
        "text/csv" => { ^bat -Ppf --language=csv },
        "text/tab-separated-values" => { ^bat -Ppf --language=tsv },
        "text/x-toml" => { ^bat -Ppf --language=toml },
        "text/markdown" => { ^bat -Ppf --language=markdown },
        _ => {},
    }}
    | if (term size).columns >= 100 { table -e } else { table }
}
