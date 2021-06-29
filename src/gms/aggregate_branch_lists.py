#!/usr/bin/env python3

import argparse 
import pandas as pd
from os import environ
from os.path import join
from glob import iglob


def aggregate_inputs_for_gms():

    # get huc listi
    hucList = environ['hucList']
    
    try:
        hucList = pd.read_csv(hucList,header=None,dtype=str).loc[:,0].tolist()
    except FileNotFoundError:
        hucList=hucList.split(' ')

    hucList = set(hucList)

    # get branch lists
    outputRunDataDir = environ['outputRunDataDir']
    branch_id_files = iglob(join(outputRunDataDir,'*','gms','branch_id.lst'))

    all_huc_numbers,all_bids = [],[]
    for bid_file in branch_id_files:
        huc_number = bid_file.split('/')[-3]
        
        if huc_number in hucList:
            bids = pd.read_csv(bid_file,header=None).loc[:,0].tolist()
            huc_number_list = [huc_number] * len(bids)

            all_bids += bids
            all_huc_numbers += huc_number_list
        
    output = pd.DataFrame({ 
                            'huc': all_huc_numbers,
                            'branch' : all_bids
                          })
    print(output)
    output.to_csv(join(outputRunDataDir,'gms_inputs.csv'),index=False,header=False)



if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Aggregate GMS Inputs')
    #parser.add_argument('-d','--input-catchments-fileName', help='DEM derived catchments', required=True)
    #parser.add_argument('-a','--input-flows-fileName', help='DEM derived streams', required=True)

    aggregate_inputs_for_gms()
