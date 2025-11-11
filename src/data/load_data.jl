#
# SASAs
#
# Each file contains the data for SASAs by residue type, provided by the server:
#
# http://best.bio.jhu.edu/mvalue/
#
# The data is added to the following dictionary:
sasa_server = Dict()

#
# Results obtained from the references 
#
mvalues_auton_bolen = Dict()
mvalues_moeser_horinek = Dic()

#
# PDB files
#
pdb_files = Dict(
    "1MJC" => "./pdb/1MJC.pdb",
    "2RN2" => "./pdb/2RN2.pdb",
)

#
# SASAs
#
include("./sasa_auton_bolen_server/1MJC.jl")
include("./sasa_auton_bolen_server/2RN2.jl")

#
# m-values from references
#
include("./mvalues_references/1MJC.jl")
include("./mvalues_references/2RN2.jl")



