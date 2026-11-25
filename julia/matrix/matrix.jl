using DelimitedFiles: readdlm

function matrix(strmatrix)
    matrix = strmatrix |> IOBuffer |> readdlm
    return eachrow(matrix), eachcol(matrix)
end
