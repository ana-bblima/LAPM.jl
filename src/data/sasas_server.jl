#
# Each file contains the data for SASAs by residue type, provided by the server:
#
# http://best.bio.jhu.edu/mvalue/
#
# The data is added to the following dictionary:
sasa_server = Dict{String,Any}()
#
include("./sasa_auton_bolen_server/1MJC.jl")
include("./sasa_auton_bolen_server/2RN2.jl")