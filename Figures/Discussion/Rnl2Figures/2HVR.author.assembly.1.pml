# Clear PyMol session
reinitialize 
# NB - Authors version! 
load http://www.rcsb.org/pdb/files/2HVR.pdb1.gz 
# See residue #'s *per* namespace on the Pymol screen
set seq_view, 1 
# For good images
set antialias, 2 
# For faster images
set hash_max, 220 
# Remove the waters
remove solvent 
# Make the background white
bg_color white 
# Hide everything, build in what you want!
hide everything, all 

# Ligase proper
create Rnl2, (chain A) 
# the template strandof the nick
create DNA_Template, (chain C) 
create 5prime_Nick, (chain D) 
create 3prime_Nick, (chain E)
# AMP coupled to the 3´ OH side 5´ P04 position
create AMP_3Nick, (resi 236) and chain E 
# Everything on 3´ nick side *minus* the AMP
create 3prime_Nick_No_AMP, not resi 236 and chain E 

# The strand to be ligated will be blue!
## Show as sticks
show sticks, 5prime_Nick 
## color them blue
color blue, 5prime_Nick 

show sticks, 3prime_Nick
color blue, 5prime_Nick

#Template strand is red
show sticks, DNA_Template
color red, DNA_Template

# The enzyme will be a transparent Grey color
show surface, Rnl2
color grey80, Rnl2
set transparency=0.8

# Lets color some important residues
## Residue K35 is important for enzyme adenylylation (i.e. "step 1")
show spheres, (resi 35) and chain A 
color purple, resi 35
show sticks, (resi 35) and chain A 
color charge, resi 35

## Residue H37 is important 2´OH selectivity | Step 3, Can be also be H39D 
show spheres, (resi 37) and chain A 
color yellow, resi 37
show sticks, (resi 37) and chain A 
color charge, resi 37

## T39 - 2´OH selectivity | important for RNA selective via interaction with penultimate 2´OH position
show spheres, (resi 39) and chain A 
color green, resi 39
show sticks, (resi 39)
color charge, resi 39
set sphere_transparency, 0.8

set_view (\
    -0.348872781,   -0.201284543,   -0.915308356,\
    -0.534009576,   -0.759907484,    0.370647341,\
    -0.770150900,    0.618086815,    0.157621354,\
    -0.001809739,   -0.000905246, -252.574966431,\
   155.544738770,   66.954612732,   43.734931946,\
  -663.913696289, 1167.579101562,  -20.000000000 )
ray 900,900
png Rnl2_RNA_Selectively-2HVR.png, dpi=300