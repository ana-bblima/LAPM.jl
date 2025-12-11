# Reproduction of Creamer ASA

## Figure 2 of Creamer

![./figures/creamer_fig2.png](./figures/creamer_fig2.png)

## Comparison of BB and SC ASAs

![./figures/ASA_creamer_vs_LAPM.png](./figures/ASA_creamer_vs_LAPM.png)

## Using the parameterized united atom model

### For a single structure:

```@example creamer_ua
using LAPM
using PDBTools
pdb = read_pdb(LAPM.pdb_files["1AO3"], "protein and not element H")
mvalue_ua(pdb)
```

### All results vs. experimental values

```@example creamer_ua
LAPM.plot_ua()
```

### All results vs. other models

```@example creamer_ua
LAPM.plot_mvalue_ua()
```



