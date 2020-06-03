using Dates: Date, DateTime, @dateformat_str, format, hour, now

schedule_appointment(appointment::String) = DateTime(appointment, dateformat"m/d/y H:M:S")

has_passed(appointment::DateTime) = appointment < now()

is_afternoon_appointment(appointment::DateTime) = 12 ≤ hour(appointment) < 18

function describe(appointment::DateTime)
    date = format(appointment, "E, U d, Y")
    time = format(appointment, "HH:MM")
    return "You have an appointment on $date at $time"
end

anniversary_date() = Date(year(today()), 9, 15)
