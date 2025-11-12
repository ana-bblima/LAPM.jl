using Documenter

makedocs(
    sitename="LAPM.jl",
    pages=[
        "Introduction" => "index.md",
        "Auton & Bolen" => "autonbolen.md",
        "Moeser & Horinek" => "moeserhorinek.md",
        "M&H vs A&B" => "mh_vs_ab.md",
        "References" => "references.md",
    ],
)
deploydocs(
    repo="github.com/m3g/LAPM.jl.git",
    target="build",
    branch="gh-pages",
    versions=["stable" => "v^", "v#.#"],
)
