demote(x::Float64) = round(UInt8, x, RoundUp)
demote(n::Integer) = Int8(n)

preprocess(coll::AbstractVector) = demote.(coll) |> reverse
preprocess(coll::AbstractSet) = sort(demote.(coll), rev = true)
