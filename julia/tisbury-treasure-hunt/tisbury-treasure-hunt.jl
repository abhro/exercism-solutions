get_coordinate((treasure, coordinate)) = coordinate

convert_coordinate(coordinate) = Tuple(collect(coordinate))

compare_records(azara_record, rui_record) = convert_coordinate(azara_record[2]) == rui_record[2]

function create_record(azara_record, rui_record)
    if !compare_records(azara_record, rui_record)
        return ()
    end
    treasure, coordinate = azara_record
    location, _, quadrant = rui_record
    return (coordinate, location, quadrant, treasure)
end
