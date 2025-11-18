mvalues_moeser_horinek["2BU4"] = OrderedDict(
    "tmao"      => (tot=NaN, bb=NaN, sc=NaN),
    "sarcosine" => (tot=NaN, bb=NaN, sc=NaN),
    "betaine"   => (tot=NaN, bb=NaN, sc=NaN), 
    "proline"   => (tot=NaN, bb=NaN, sc=NaN), 
    "glycerol"  => (tot=NaN, bb=NaN, sc=NaN), 
    "sorbitol"  => (tot=NaN, bb=NaN, sc=NaN), 
    "sucrose"   => (tot=NaN, bb=NaN, sc=NaN), 
    "trehalose" => (tot=NaN, bb=NaN, sc=NaN), 
    "urea"      => (tot=-1.331, bb=-0.691, sc=-0.691), 
)

mvalues_auton_bolen["2BU4"] = parse_mvalue_server("""
Native and Denatured State Transfer Free Energy Contributions to the m-value for /tmp/phptZ5UHf. 
		    Native State (cal/mol/M) 							 Denatured State (cal/mol/M) 
Osmolyte 	 Backbone   Sidechains    Total 	 | 		 Backbone 			 Sidechains 			 Total 
1M TMAO            2986        -967        2020 	 | 	 (  4505)   6072 [  7638] 	 ( -2084)  -2267 [ -2449] 	 (  2421)   3805 [  5189] 
1M Sarcosine       1725        -597        1128 	 | 	 (  2603)   3508 [  4413] 	 (  -842)   -884 [  -927] 	 (  1761)   2624 [  3486] 
1M Betaine         2223       -1662         561 	 | 	 (  3354)   4520 [  5686] 	 ( -3871)  -4191 [ -4514] 	 (  -517)    329 [  1172] 
1M Proline         1593       -1372         220 	 | 	 (  2403)   3238 [  4073] 	 ( -2819)  -3051 [ -3286] 	 (  -416)    187 [   788] 
1M Glycerol         465        -436          29 	 | 	 (   701)    944 [  1188] 	 ( -1304)  -1402 [ -1500] 	 (  -603)   -458 [  -312] 
1M Sorbitol        1161        -554         607 	 | 	 (  1752)   2361 [  2970] 	 (  -886)   -939 [  -992] 	 (   867)   1422 [  1978] 
1M Sucrose         2057        -550        1507 	 | 	 (  3104)   4183 [  5262] 	 ( -1538)  -1618 [ -1700] 	 (  1566)   2565 [  3562] 
1M Trehalose       2057        -309        1748 	 | 	 (  3104)   4183 [  5262] 	 (  -718)   -700 [  -683] 	 (  2386)   3483 [  4579] 
1M Urea           -1294         512        -782 	 | 	 ( -1952)  -2631 [ -3310] 	 (   569)    639 [   709] 	 ( -1383)  -1992 [ -2601] 
""")