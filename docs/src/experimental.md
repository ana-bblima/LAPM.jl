# Experimental

```@example mvalue
import Pkg
Pkg.develop(url="https://github.com/m3g/LAPM.jl")
using LAPM
```

## Urea (Creamer)

```@example mvalue
plot_experimental(MoeserHorinek; sasas_from=LAPM.creamer_sasa)
```

```@example mvalue
plot_experimental(AutonBolen; sasas_from=LAPM.creamer_sasa)
```

## Urea (Server)

```@example mvalue
plot_experimental(MoeserHorinek; sasas_from=LAPM.server_sasa)
```

```@example mvalue
plot_experimental(AutonBolen; sasas_from=LAPM.server_sasa)
```


