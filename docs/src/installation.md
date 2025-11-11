# Installation

!!! note
    This is a package written in Julia. We invite you to experiment with the language, but if you want to just call this package 
    from Python, read the [From Python](@ref python) section of the manual. Understanding all the features of the package 
    requires reading the manual as whole. The syntaxes of using this package from Julia or Python are almost identical, and the
    motivation for using Python should be mostly the familiarity with further analysis tools, as the plotting packages. 

## Install Julia

First you need to install the Julia language, version 1.9 or greater is required. 
Using the [juliaup](https://github.com/JuliaLang/juliaup) tool is a highly recommended way of installing and keeping Julia up to date.

Alternatively, you can install Julia by downloading the binaries directly from [the Julia webpage](https://julialang.org).

!!! note
    New to Julia? Julia is a modern high-level yet performant programming language. Some tips
    and a nice workflow for using it effectively can be found [here](https://m3g.github.io/JuliaNotes.jl/stable/workflow/). 

    For this specific package, following a the step-by-step examples provided here after installing Julia should be enough. 

## Install the packages

Within Julia, to install the packages required for running the examples here you need to do:

```julia-repl
julia> import Pkg

julia> Pkg.add(["PDBTools", "MolSimToolkit", "Plots"])
```
