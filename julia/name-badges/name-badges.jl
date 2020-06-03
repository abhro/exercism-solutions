print_name_badge(::Missing, name, department) = string(name, " - ", uppercase(department))
print_name_badge(id, name, department) = string("[$id] - ", name, " - ", uppercase(department))
print_name_badge(id, name, ::Nothing) = string("[$id] - ", name, " - OWNER")
print_name_badge(::Missing, name, ::Nothing) = string(name, " - OWNER")

salaries_no_id(ids, salaries) = sum(salaries[ismissing.(ids)])
