function sortquantity!(qty)
    ix = sortperm(qty, rev = true)
    qty .= qty[ix]
    return ix
end

sortcustomer(cust, srtperm) = cust[srtperm]

function production_schedule!(cust, qty)
    ix = sortquantity!(qty)
    cust = cust[ix]
    return (cust, invperm(ix))
end
