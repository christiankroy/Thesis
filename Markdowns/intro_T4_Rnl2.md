## T4 Rn2 Ligase section

### 2014-03-06 

|       Important citations Publication        |                   notes                   |
|----------------------------------------------|-------------------------------------------|
| Richardson, 1965                             | First Report of T4 PNK                    |
| Amistur..Kaufman, Embo, 1987                 | Rnl1 in vivo activity                     |
| Ho & Shuman, PNAS, 2002                      | First report of T4 Rnl2                   |
| Nandakumar....Shuman, JBC, 2004              |                                           |
| Nandakumar & Shuman, MolCel, 2004            |                                           |
| Nandakumar & Shuman, JBC, 2005               |                                           |
| Kuhn & Frank-Kamenetskii, FEBS Journal, 2005 | NTL by T4 DNA ligase                      |
| Nandakumar ... Shuman, Structure 2005        |                                           |
| Bullard & Bowater, Biochemical Journal, 2006 | Coompared Δ activies of T4 ligases        |
| Nandakumar ... Lima, Cell, 2006              |                                           |
| Lohman...Evans, NAR, 2013                    | Chlorella virus DNA ligase will do RT/D:D |
| Chauleu & Shuman, RNA, 2013                  | Still don't know what Rnl2 does in vivo   |

---

Proteins of the T4 and T7 bacteriophages have been a boon for molecular biology. Without enzymes like polynucleotide kinase (Richardson 1965), T7 RNA polymerase ($REF=Summers..Seigal, Nature 1970), and T4 DNA ligase (see above) ($REF=Richardson and Luhman papers), many essential manipulations of nucleic acids would have been impossible for decades. These enzymes also have essential functions to their respective phages. T7 RNA polymerase is responsible for late stage replication of the T7 transcripts. While T4 PNK {Discuss T4 PNK | Read Richardson 1965}. T4 DNA ligase {Discuss function of T4 DNA ligase here}. Finally, T4 RNA ligase 1 (herein "Rnl1", also known as *gene 63*) works with T4 PNK to repair host-cleaved tRNAs. The host bacteria, in an effort to stave off phage replication, produces an anticodon nuclease from the *prr* locus ($REF=Amistur..Kaufman, Embo, 1987). 

Given the utility and importance of these enzymes, discovery of novel enzymes is a major area of research. The Shuman lab has an outstanding track record of discovering and characterizing numerous such enzymes including many involved in nucleic acid synthesis, modification, and repair. Through a *BLAST* search looking for novel ligases with sequences related to *Trypanosoma brucei* RNA-editing ligases TbMP52 and TbMP48 ($REF=Ho & Shuman, PNAS 2002), they identified a gene in the T4 bacteriophage genome containing nucleotidyl transferase motifs in correct arrangement, spacing, and number indicative of an RNA ligase. The gene identified, *gp24.1*, has quickly become an essential tool in the era of modern genomics.

Biochemical purification and characterization of *gp24.1* ($Ref=Ho & Shuman, 2002), revealed that it indeed codes for an RNA ligase, which was renamed T4 RNA ligase 2 (Herein "Rnl2"). Rnl2 is a 374 amino acid monomeric protein composed of 2 distinct domains that typically purified as a 42-kDa His-tagged recombinant protein. The N-terminal domain (1–249) is responsible for steps (1) and (3) of the general ligation mechanism described in {#Figure X}, while the C-terminal domain (250–334), seperated by a 9 nt flexible linker ($REF=Nandakumar...Lima, 2006), is responsible for adenylylation of the 5´ PO{4} residue in step (2). Additionally, Rnl2 is routinely purifed as a pre-adylated Ligase:AMP complex, already poised for the its first ligation. 

Mutational analysis of T4 Rnl2, and later a crystal structure, have identified key functional residues. The residue where the AMP is transfered to the enzyme in step (1) is a ligase-typical lysine residue at position 35 (K35) ($REF=Ho & Shuman, 2002; Nandakumar..Lima 2006). The K227 residue in the C-termainal domain is essential for adenylyation of the 5´ PO{4} at the nick.  Mutation of H37 results in an ~10^2 reduced rate of ligation. Finally, the resdue T39 has been shown to interact with the 2´ OH on the 3´ side of the nick, prefering a C3´ endo suger pucker confirmation {Consider drawing a figure| Maybe a Pymol of Rnl2 highlighting key residues?}.
{ Also mention that Rnl2 has a footprint of ~nt nucleotides centered about the nick, and that MG2 does not seem to be  required for STEP 3 chemistry, but is for Step 1! Also mention that the difference between the 2´ deoxy vs 3´ deoxy structures illustrats the importance of the RNA-like suger pucker. However, the Cell paper says that the 2´ OH (DNA) end can, at some rate, adopt an RNA-like suger pucker, leading to the correct orientiation of the 3´ OH relevtive to the AMP leaving group and result in catalysis (this would be my activity!). Make a note into the future directions that you would like to explore LNA's at the 3´OH pisition of all ligation results, leading to increased ligation efficiency, however both *this* and the use of penultimate 2´ OH (Ribosome) suger in your ligamers would lead to added costs, and the latter maybe better served with a T39A mutation. Giggity }

While T4 Rnl2 is extremely efficient at high concentration, and displays little or no reversable chemistry, the N-terminal only form of T4 Rnl2 with a K227A mutation ("Truncated mutant", $Ref NEB nomenclature) shows greatly decreassed adenylytransferance activity and has been harnesd in specialized cloning applications ($REF). In these reactions, the use of a preadenylated adaptor allows for XXXXX. Indeed, the modular nature of T4 Rnl2 makes it a remarkable example amidst an outstanding field enzymes.

The requirement of an RNA residue at the penultimate and terminal nt positions on the 3´ side of a nick has been repeatidly measured and reported ($REF $REF $REF). Indeed, independent labs have measured this preference, and have reported that the RNA-templated DNA:DNA joining activity of T4 Rnl2 is below assay limits of detection ($REF). However, results discussed in this work clearly show that with enough enzyme, and sensitive downstream measurements such as multiple radio-labeled oligos, T4 Rnl2 will indeed catalyze RNA-templated DNA:DNA ligation {See #Figure X}. Previous reports of T4 Rnl2 lacking this activity are likely due to a single turnover mechanism in this reaction, owning to the poor disociation rate of nucleic-intecting enzymes ($REF;$REF;$REF). 

+ DNA ligases want the 5´ PO4 side to be DNA; don’t care about other
+ RNA ligases want the 3´ OH side to be RNA; don’t care about other
+ C-terminal domain is much different from DNA ligases; while the N-terminal domain is similar
    + Perhaps this is why we don’t see much ligation, because of poor adeynlation activity (Aaron’s notes on my copy of the paper)
+ 2.4 Å crystal structure (329AA with a missing 9 nt of weak domain-connecting segment) 
+ C-terminal domain has no structural homolog
+ The penultimate 2´ OH is necessary to induce a 3´-endo suger pucker
+ T39A mutation has no effect on overall ligation, but alivates necessesity for penultimate 2´OH. 

While the biological function of T4 Rnl1 is known ($REF), after >12 years since its discovery, the function of T4 Rnl2 is not ($Ref Shuman paper 2013). It is not essential for T4 replication, even in the *prr* strain. While it is related to..... **Need to write more here***

Finally, another enzyme has been reported to catalyze RNA-templated DNA:DNA ligation. This long-studied enzyme, Chloroella virus, has also been reported to *not* display this activity ($REF). However, using enough enzyme, and special buffer conditions, specifically a critical concentration of ATP (?), Lohman et al have shown that Chlorella virus will join two DNA strands tempalted off an RNA polymer ($REF). They go to demonstrate that it performs no worse in this activity than the traditionaly used T4 DNA ligase ($REF- RASL Yearkly, Some Nilseen papers). 

One particular type of DNA and/or RNA sequence detection through ligation that has only been reported once previously is the investigation of *multiple* sequences contained in a single polymer. In 2010, Conze et al used T4 DNA ligase and specially designed DNA oligos to loop out sections of a viral (?) cDNA, joining multiple such DNA oligos off the viral cDNA template.  Ligation products were amplified using rolling circle PCR and quantified via flourence probe hybrization and visualization on a microscope slide ($Ref Conze et al). The SeqZip methodology has important similaries and differences to this prior work which are discussed in Chapter X. 



































