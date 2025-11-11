module LAPM

using PDBTools
# At the end, qualify everything and remove the above using
using PDBTools: 
    PDBTools,
    MValueModel,
    mvalue_delta_sasa,
    parse_mvalue_server_sasa,
    read_pdb

export predict_mvalue

data_dir = joinpath(@__DIR__, "data")

# Input data for examples
include("./data/sasas_server.jl")
include("./data/mvalues_refs.jl")

# Reference values 
include("./data/mvalues_refs.jl")

function predict_mvalue(
    pdb::AbstractString; 
    model::Type{<:PDBTools.MValueModel}=MoeserHorinek,
    cosolvent::String="urea",
    type::Int=2,
)
    atoms = read_pdb("$data_dir/pdb/$(pdb).pdb")
    m = mvalue_delta_sasa(;
        model=model,
        cosolvent=cosolvent,
        atoms=atoms,
        sasas=sasa_server[pdb],
        type=type,
    )
    return (tot = m.tot, bb = m.bb, sc = m.sc)
end

end
