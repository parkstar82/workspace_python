import numpy as np
import pandas as pd

# load the data set
coip = pd.read_csv(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook/coip_10_300.csv', encoding='utf-8')
dbscan = pd.read_csv(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook/dbscan_100_5_coip_10_300.csv', encoding='utf-8')
cid = dbscan.to_numpy()[:,[1]]
coip = coip.to_numpy()
result = np.append(cid, coip, axis=1)
temp_df = pd.DataFrame(result)
temp_df.to_csv(r'C:\00.Research\00.Project\2019_MCA_LX\jupyter_notebook\result_dbscan_100_5_coip_10_300.csv',
               index=False, header=False)
