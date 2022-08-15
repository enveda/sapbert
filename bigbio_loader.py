import ujson
from tqdm.auto import tqdm
from torch.utils.data import Dataset, DataLoader
from bigbio.dataloader import BigBioConfigHelpers
from typing import List, Optional




class SapBertBigBioDataset(Dataset):

    def __init__(self, dataset_name: str='medmentions_st21pv', 
                    split: str='train', 
                    resolve_abbreviations: bool=True, 
                    path_to_abbreviation_dict: Optional[str]=None,
                    ):
        '''
        Load initial BigBio dataset
        '''
        self.conhelps = BigBioConfigHelpers()
        self.data = self.conhelps.for_config_name(dataset_name + '_bigbio_kb').load_dataset()[split]
        self.resolve_abbreviations = resolve_abbreviations

        if self.resolve_abbreviations:
            self.abbreviations = ujson.load(open(path_to_abbreviation_dict, 'r'))
        self._data_to_flat_instances()


    # def get_abbreviations(self, path_to_abbrev_dict):
    #     '''
    #     Get dictionary of abbreviations for each PMID stored in PMID -> {'abbrev' -> 'full name'}
    #     '''
    #     pass

        

    def _data_to_flat_instances(self):
        '''
        Convert dataset into flat set of examples to use with dataloader
        '''
        flat_ents = []
        for doc in tqdm(self.data):
            pmid = doc['document_id']
            ents = doc['entities']
            for e in ents:
                ent_text = ' '.join([x for x in e['text']])

                if self.resolve_abbreviations:
                    if ent_text in self.abbreviations[pmid]:
                        # print(ent_text, self.abbreviations[pmid][ent_text])
                        ent_text = self.abbreviations[pmid][ent_text]

                flat_ents.append({
                    'pmid':pmid, 
                    'type': e['type'], 
                    'text': ent_text, 
                    'offsets': e['offsets'], 
                    'cuis':[x['db_id'].split(':')[-1] for x in e['normalized']],
                    'normalized':e['normalized'],
                    })
            
        self.flat_instances = flat_ents


    def __len__(self):
        return len(self.flat_instances)

    def __getitem__(self, idx):
        return self.flat_instances[idx]


def sapbert_collate_fn(batch):
    mentions = [x['text'] for x in batch]
    labels = [x['cuis'] for x in batch]
    metadata = batch

    return mentions, labels, metadata


if __name__=='__main__':
    dataset = SapBertBigBioDataset()
    dataloader = DataLoader(dataset, collate_fn=sapbert_collate_fn, batch_size=64)
    for i, batch in enumerate(tqdm(dataloader)):
        if i < 3:
            print(batch)
