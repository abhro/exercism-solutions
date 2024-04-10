# Define the `expected_bake_time` constant`
const expected_bake_time = 60

# Define the `preparation_time(layers)` function.
preparation_time(layers) = 2layers

# Define the `remaining_time(time_in_oven)` function.
remaining_time(time_in_oven) = expected_bake_time - time_in_oven

# Define the `total_working_time(layers, time_in_oven)` function.
total_working_time(layers, time_in_oven) = preparation_time(layers) + time_in_oven
