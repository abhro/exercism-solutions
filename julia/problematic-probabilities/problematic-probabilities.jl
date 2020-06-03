using Statistics: mean

rationalize(successes, trials) = successes .// trials

probabilities(successes, trials) = successes ./ trials

function checkmean(successes, trials)
    mean_rats = mean(rationalize(successes, trials))
    mean_decs = mean(probabilities(successes, trials))
    return float(mean_rats) == mean_decs || mean_rats
end

function checkprob(successes, trials)
    total_rats = prod(rationalize(successes, trials))
    total_decs = prod(probabilities(successes, trials))
    return float(total_rats) == total_decs || total_rats
end
