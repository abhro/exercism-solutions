today(birds_per_day) = last(birds_per_day)

function increment_todays_count(birds_per_day)
    birds_per_day = copy(birds_per_day)
    birds_per_day[end] += 1
    return birds_per_day
end

has_day_without_birds(birds_per_day) = zero(eltype(birds_per_day)) in birds_per_day

count_for_first_days(birds_per_day, num_days) = sum(birds_per_day[begin:(begin + num_days - 1)])

busy_days(birds_per_day) = count(≥(5), birds_per_day)

average_per_day(week1, week2) = (week1 + week2) / 2
