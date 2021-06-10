import os
import pandas as pd
from pathlib import Path
import georasters as gr
import datetime
import numpy as np
from pathlib import Path
import re



directory_in_str = "/opt/datos/wrf-meteo/geotiff/" #dentro de ....
pathlist = Path(directory_in_str).glob('**/*useful*.tiff') #todos los tiff de 70000 ISBL

for path in pathlist:
    path_in_str = str(path)
    
    lluvias = gr.from_file(path_in_str)
    df_lluvias = lluvias.to_pandas()
    
    df_mask = pd.DataFrame(columns=['valor'])
    for i in range(len(df_lluvias)):
        if((df_lluvias.loc[i]['value']) > 1.0):
            df_mask.loc[i] = 1
        else:
            df_mask.loc[i] = 0
            
    # Reshapeo df_mask para que quede 175 x 175
    np_mask = df_mask.to_numpy()
    np_mask = np_mask.reshape((175,175))
    
    df_mask = pd.DataFrame(np_mask)
    
    #Guardo la matriz en un csv
    regex = "geotiff\/\w{7}\/\w{2}\/\w{6}"
    regex2 = "\.tiff"
    filename = re.sub(regex, "matrices/matriz_tag", path_in_str)
    filename = re.sub(regex2, ".csv", filename)
    df_mask.to_csv(filename, index=False)
    print(filename)
