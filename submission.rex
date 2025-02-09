(λ input → 
    let        
        {- protein conformers are a single physical shape of a protein -}
        protein_conformer = load (id (get 0 input)) "ProteinConformer",

        {- protein is a description of the protein e.g. its amino acid sequence -}
        protein = load (protein_id protein_conformer) "Protein",

        {- smol is a description of a small molecule e.g. its SMILES string -}
        smol = load (id (get 1 input)) "Smol",

        {- TODO(you): this is where you need to write code that predicts the binding affinity -}
        affinity = 0.5

    in
        {- the output must be a list with exactly one element: our binding affinity prediction for this input -}
        [BenchmarkArg {
            entity = "BindingAffinity", 
            id = save (BindingAffinity {
                affinity = affinity,
                affinity_metric = "kcal/mol",
                protein_id = id protein,
                smol_id = id smol,
                metadata = Metadata {
                    name = "binding affinity for smol and protein",
                    description = none,
                    tags = []
                }
            })
        }]
)