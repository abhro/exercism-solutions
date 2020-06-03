get_vector_of_wagons(args...) = collect(args)

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    deleteat!(each_wagons_id, 3) # Remove the '1' in the third entry
    return [
        1,
        missing_wagons...,
        each_wagons_id[(begin + 2):end]...,
        each_wagons_id[begin:(begin + 1)]...,
    ]
end

function add_missing_stops(route, stops...)
    return Dict(route..., "stops" => collect(last.(stops)))
end

function extend_route_information(route; more_route_information...)
    return merge(route, more_route_information)
end
