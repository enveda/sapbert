# BC5CDR
# MODEL_DIR="trained_models/mesh/" 
MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
DICT_PATH=/efs/davidkartchner/el-robustness-comparison/data/mesh_to_alias.txt
DATASET_NAME=bc5cdr

CUDA_VISIBLE_DEVICES=0 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json&


# NLM Chem
# MODEL_DIR="trained_models/mesh/" 
MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
DICT_PATH=/efs/davidkartchner/el-robustness-comparison/data/mesh_to_alias.txt
DATASET_NAME=nlmchem

CUDA_VISIBLE_DEVICES=1 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json&


# NLM Gene
# MODEL_DIR="trained_models/entrez/" 
MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
DICT_PATH=/efs/davidkartchner/el-robustness-comparison/data/entrez_to_alias.txt
DATASET_NAME=nlm_gene

CUDA_VISIBLE_DEVICES=2 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json&


# GNormPlus
# MODEL_DIR="trained_models/entrez/" 
MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
DICT_PATH=/efs/davidkartchner/el-robustness-comparison/data/entrez_to_alias.txt
DATASET_NAME=gnormplus

CUDA_VISIBLE_DEVICES=3 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json



# Medmentions Full
MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext" 
DICT_PATH=./data/medmentions/umls_dict_uncased.txt
DATASET_NAME=medmentions_full

CUDA_VISIBLE_DEVICES=0 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json&
	# --debug \



# MedMentions ST21PV
MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext" 
DICT_PATH=/efs/davidkartchner/el-robustness-comparison/data/st21pv_to_alias.txt 
DATASET_NAME=medmentions_st21pv

CUDA_VISIBLE_DEVICES=1 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json \



# NCBI Disease
MODEL_DIR="trained_models/mesh_and_omim_disease_only/" 
# MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
DICT_PATH=/efs/davidkartchner/el-robustness-comparison/data/mesh_and_omim_to_alias_disease_only.txt
DATASET_NAME=ncbi_disease

CUDA_VISIBLE_DEVICES=2 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json



# NCBI Disease
# MODEL_DIR="trained_models/mesh_omim_disease/" 
MODEL_DIR="cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
DICT_PATH=/efs/davidkartchner/el-robustness-comparison/data/mesh_and_omim_to_alias_disease_only.txt
DATASET_NAME=ncbi_disease

CUDA_VISIBLE_DEVICES=3 python3 run_bigbio_inference.py \
	--model_dir $MODEL_DIR \
	--dictionary_path $DICT_PATH \
	--dataset_name $DATASET_NAME \
	--output_dir ./output/ \
	--use_cuda \
	--max_length 25 \
	--batch_size 32 \
	--abbreviations_path /efs/davidkartchner/el-robustness-comparison/data/abbreviations.json