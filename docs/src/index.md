# Installation

```
import Pkg
Pkg.add(url="https://github.com/m3g/LAPM.jl")
```

Additional packages for the example:

```
Pkg.add("Plots", "StatsPlots")
```

# Introduction

```@example mvalue
using LAPM
using Plots
using StatsPlots
```

```@example mvalue
example_structs = [
    "1MJC",
    "2RN2",
]
```

```@example mvalue
nexamples = length(example_structs)
tot, bb, sc = zeros(nexamples), zeros(nexamples), zeros(nexamples)
tot_ref, bb_ref, sc_ref = zeros(nexamples), zeros(nexamples), zeros(nexamples)
for (i, str) in enumerate(example_structs)
    p = predict_mvalue(str)
    tot[i] = p.tot
    bb[i] = p.bb
    sc[i] = p.sc
    tot_ref[i] = LAPM.mvalues_moeser_horinek[str][1]
    bb_ref[i] = LAPM.mvalues_moeser_horinek[str][2]
    sc_ref[i] = LAPM.mvalues_moeser_horinek[str][3]
end
```

```@example mvalue
plt = plot(layout=(1,3))
plot!(plt, [minimum(tot), maximum(tot)], [minimum(tot), maximum(tot)]; label="", subplot=1)
plot!(plt, [minimum(bb), maximum(bb)], [minimum(bb), maximum(bb)]; label="", subplot=2)
plot!(plt, [minimum(sc), maximum(bb)], [minimum(sc), maximum(sc)]; label="", subplot=3)
scatter!(plt, tot_ref, tot; label="Total", subplot=1)
scatter!(plt, bb_ref, bb; label="Backbone", subplot=2)
scatter!(plt, sc_ref, sc; label="Sidechain", subplot=3)
plot!(plt, 
    size=(900,300),
    xlabel="Moeser&Horinek",
    ylabel=nothing,
    aspect_ratio=1,
)
plot!(plt,
    ylabel="LAPM prediction",
    subplot=1
)
```

```@example mvalue 
groupedbar(
    example_structs,
    hcat(tot, bb, sc); 
    label=["Total" "BB" "SC"], 
    title="Contributions",
    xlabel="Structure",
    ylabel="m-value and contribution / kcal/mol",
)
```
