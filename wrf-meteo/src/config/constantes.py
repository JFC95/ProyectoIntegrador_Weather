import os

PROG_VERSION = 'v0.1.0'

#WRF_VARIABLES = ['T2', 'TSK', 'wspd10', 'wdir10']
WRF_VARIABLES = ['RAINNC']

WRFOUT_REGEX = r"wrfout_(?P<param>[A-Z])_[a-z0-9]{3,4}_(?P<timestamp>\d{4}-\d{2}-\d{2}_\d{2}:\d{2}:\d{2})"

CBA_EXTENT = [-67.0,
              -35.3,
              -60.7,
              -29.0]

WRF_EXTENT = [-538001.0623448786,
              -538000.0000000792,
              537998.9376551214,
              537999.9999999208]

# recorte para graphs de ppnaccum
RECORTE_EXTENT = [-66.07031,
                  -35.168794,
                  -61.579685,
                  -29.328177]

KM_PER_DEGREE = 111.32
RESOLUTION = 4

base_url = 'https://bdhm.ohmc.ar/api/'

Token = os.getenv('TOKEN')
user = os.getenv('DB_SUER')
secret = os.getenv('SECRET')
