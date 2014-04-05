# Clear PyMol session
reinitialize 
load http://www.rcsb.org/pdb/files/2HVQ.pdb1.gz 
# See residue #'s *per* namespace on the Pymol screen
set seq_view, 1 
# For good images
set antialias, 2 
# For faster images
set hash_max, 220 
# Remove the waters
#remove solvent 
# Make the background white
bg_color white 
# Hide everything, build in what you want!
hide everything, all 


create Rnl2, (resi 0-350)
# N-Terminus
create Nterm, (resi 0-239)
# C-Terminus
create Cterm, (resi 240-350)
# The AMP covalently bonded to the ligase
create APK, (resi 35)
create H37, (resi 37)
create K227, (resi 227)
create mag, (resi 335)
# Select waters within  5Å of K35
create activeWater, (( resi 35 around 4) and resn HOH) 


# The enzyme will be a transparent Grey color
set transparency=0.5
show surface, Nterm
color grey80, Nterm
show surface, Cterm
color grey20, Cterm
show sphere, mag

show sticks, APK
color Purple, APK 
show sticks, H37

show spheres, activeWater

# This lets us see the domains.
set_view (\
     0.224508688,    0.541609049,    0.810105860,\
    -0.272096187,    0.833101392,   -0.481584966,\
    -0.935724854,   -0.112304553,    0.334406704,\
     0.000000000,    0.000000000, -199.920257568,\
    10.564598083,   27.988311768,   34.529663086,\
   157.618652344,  242.221862793,  -20.000000000 )

ray 900,900
png Rnl2_Structure.png, dpi=300

show sticks, K227
color blue, K227

## This lets us see the active site better
set_view (\
    -0.291360170,    0.493169874,    0.819699526,\
     0.048234604,    0.863359749,   -0.502295792,\
    -0.955405056,   -0.106809936,   -0.275334328,\
     0.000000000,    0.000000000, -199.920257568,\
    10.564598083,   27.988311768,   34.529663086,\
   157.618652344,  242.221862793,  -20.000000000 )
ray 900,900
png Rnl2_ActiveSite.png, dpi=300

set transparency=0.3
## Active Site bottom View
set_view (\
     0.246105134,    0.811559498,   -0.529929399,\
    -0.192838207,   -0.494823486,   -0.847339153,\
    -0.949878037,    0.310724199,    0.034719061,\
     0.000000000,    0.000000000, -199.920257568,\
    10.564598083,   27.988311768,   34.529663086,\
   157.618652344,  242.221862793,  -20.000000000 )

ray 900,900
png Rnl2_ActiveBottom.png, dpi=300
