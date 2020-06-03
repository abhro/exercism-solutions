const header_pattern = r"^\[(ERROR|WARNING|INFO)\]: *"

message(msg) = strip(replace(msg, header_pattern => ""))

log_level(msg) = match(header_pattern, msg).captures |> only |> lowercase

reformat(msg) = string(message(msg), " (", log_level(msg), ")")
