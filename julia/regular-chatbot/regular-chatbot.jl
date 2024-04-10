is_valid_command(msg) = occursin(r"^chatbot"i, msg)

remove_emoji(msg) = replace(msg, r"emoji\d+" => "")

function check_phone_number(number)
    if occursin(r"^\(\+\d{2}\) (\d{3}-){2}\d{3}$", number)
        return "Thanks! You can now download me to your phone."
    else
        return "Oops, it seems like I can't reach out to $number"
    end
end

function getURL(msg)
    return [m.match for m in eachmatch(r"\b(\w+\.\w+)\b", msg)]
end

function nice_to_meet_you(str)
    m = match(r"^(\w+), (\w+)", str)
    first, last = m.captures[2], m.captures[1]
    return "Nice to meet you, $first $last"
end
