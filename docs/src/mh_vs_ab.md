# Moeser & Horinek vs Auton & Bolen

```@example mvalue
import Pkg
Pkg.develop(url="https://github.com/m3g/LAPM.jl")
using LAPM
```

## Urea

### Using the A&B server SASAs

```@example mvalue
plot_MH_vs_AB("urea"; sasa_from=LAPM.server_sasa)
```

### Using the Cremer SASAs

```@example mvalue
plot_MH_vs_AB("urea"; sasa_from=LAPM.cremer_sasa)
```
