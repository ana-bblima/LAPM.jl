module LAPM

using Plots
using StatsPlots
using PDBTools
# At the end, qualify everything and remove the above using
using PDBTools: 
    PDBTools,
    MValueModel,
    mvalue_delta_sasa,
    parse_mvalue_server_sasa,
    read_pdb

export MoeserHorinek, AutonBolen
export plot_mvalue

data_dir = joinpath(@__DIR__, "data")

# Input data for examples
include("./data/load_data.jl")

#
# predict m-value using a model, for a specific structure
#
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

#
# run all predictions and plot
#
function plot_mvalue(model::Type{<:PDBTools.MValueModel}=MoeserHorinek, cosolvent="urea")
    if model == MoeserHorinek
        mvalues_ref = mvalues_moeser_horinek
    elseif model == AutonBolen
        mvalues_ref = mvalues_auton_bolen
    end
    example_structs = keys(sasa_server)
    nexamples = length(example_structs)
    tot, bb, sc = zeros(nexamples), zeros(nexamples), zeros(nexamples)
    tot_ref, bb_ref, sc_ref = zeros(nexamples), zeros(nexamples), zeros(nexamples)
    for (i, str) in enumerate(example_structs)
        p = predict_mvalue(str; cosolvent, model)
        tot[i] = p.tot
        bb[i] = p.bb
        sc[i] = p.sc
        tot_ref[i] = mvalues_ref[str][1]
        bb_ref[i] = mvalues_ref[str][2]
        sc_ref[i] = mvalues_ref[str][3]
    end

    l = @layout [a b c; d]
    plt = plot(layout=l, framestyle=:box)
    ls=(lw=2, ls=:dash, label="", lc=:black)
    plot!(plt, [minimum(tot), maximum(tot)], [minimum(tot), maximum(tot)]; ls..., subplot=1)
    plot!(plt, [minimum(bb), maximum(bb)], [minimum(bb), maximum(bb)]; ls..., subplot=2)
    plot!(plt, [minimum(sc), maximum(bb)], [minimum(sc), maximum(sc)]; ls..., subplot=3)
    ls=(lw=2, lc=:black, label="")
    scatter!(plt, tot_ref, tot; ls..., legend_title="Total", subplot=1)
    scatter!(plt, bb_ref, bb; ls..., legend_title="Backbone", subplot=2)
    scatter!(plt, sc_ref, sc; ls..., legend_title="Sidechain", subplot=3)
    plot!(plt, 
        size=(900,500),
        xlabel="Moeser&Horinek",
        ylabel=nothing,
        aspect_ratio=1,
        leftmargin=0.5Plots.Measures.cm
    )
    plot!(plt,
        ylabel="LAPM prediction",
        subplot=1
    )
    
    ys = 0.1 * (maximum(vcat(tot, sc, bb)) - minimum(vcat(tot, sc, bb)))
    groupedbar!(
        string.(example_structs),
        hcat(tot, bb, sc); 
        label=["Total" "BB" "SC"], 
        #title="Contributions",
        xlabel="Structure",
        ylabel="m-value / kcal/mol",
        subplot=4,
        ylims=(minimum(tot) - ys, max(0,maximum(tot)) + ys),
    )
    return plt
end

end
