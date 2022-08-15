#!/bin/bash

bash pretrain.sh 0 /efs/davidkartchner/sapbert/training_data/mesh_positive_example_pairs.txt /efs/davidkartchner/sapbert/trained_models/mesh/

bash pretrain.sh 1 /efs/davidkartchner/sapbert/training_data/omim_positive_example_pairs.txt /efs/davidkartchner/sapbert/trained_models/omim/&

bash pretrain.sh 2 /efs/davidkartchner/sapbert/training_data/st21pv_positive_example_pairs.txt /efs/davidkartchner/sapbert/trained_models/st21pv/&

bash pretrain.sh 3 /efs/davidkartchner/sapbert/training_data/entrez_positive_example_pairs.txt /efs/davidkartchner/sapbert/trained_models/entrez/

bash pretrain.sh 0 /efs/davidkartchner/sapbert/training_data/mesh_chem_only_positive_example_pairs.txt /efs/davidkartchner/sapbert/trained_models/mesh_chem_only/&

bash pretrain.sh 1 /efs/davidkartchner/sapbert/training_data/mesh_and_omim_disease_only_positive_example_pairs.txt /efs/davidkartchner/sapbert/trained_models/mesh_and_omim_disease_only/