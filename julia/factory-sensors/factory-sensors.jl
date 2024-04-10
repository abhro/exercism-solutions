function humiditycheck(pct_humidity)
    pct_humidity > 70 && error("humidity level check failed: $pct_humidity%")
    return @info("humidity level check passed: $pct_humidity%")
end

function temperaturecheck(temperature)
    isnothing(temperature) && throw(ArgumentError("sensor is broken"))
    temperature > 500 && throw(DomainError(temperature, "overheating detected: $temperature °C"))
    return @info("temperature check passed: $temperature °C")
end

# define MachineError here
struct MachineError <: Exception end

function machinemonitor(pct_humidity, temperature)
    flag_machine_error = false

    try
        humiditycheck(pct_humidity)
    catch err
        @error(err.msg)
        flag_machine_error = true
    end

    try
        temperaturecheck(temperature)
    catch err
        if err isa ArgumentError
            @warn(err.msg)
        elseif err isa DomainError
            @error(err.msg)
        end
        flag_machine_error = true
    end
    return if flag_machine_error
        throw(MachineError())
    end
end
