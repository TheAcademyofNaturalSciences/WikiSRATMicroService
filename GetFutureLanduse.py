import requests
import json
import geojson
import smtplib
import time
import datetime
import psycopg2


def get_settting(setting, config):
    try:
        val = config[setting]
        if val == 'True':
            val = True
        elif val == 'False':
            val = False
        return val
    except KeyError:
        error_msg = "ImproperlyConfigured: Set {0} environment      variable".format(setting)
        raise error_msg

parentpath = r'D:\GitHub\DS_TOOL\Watersheds\backend'

config_file = json.load(open(parentpath + '\config.json'))
PG_CONFIG = config_file['PGadmin']

PG_Connection = psycopg2.connect(
        host=PG_CONFIG['host'],
        database=PG_CONFIG['database'],
        user=PG_CONFIG['user'],
        password=PG_CONFIG['password'],
        port=PG_CONFIG['port'])
        
cur = PG_Connection.cursor()
cur.execute("SELECT comid, practice_id, ST_AsGeoJson(st_transform(geom, 4326)) as geom FROM datapolassess.fd_api_protection_comid "
            "ORDER BY comid, practice_id;")
data = cur.fetchall()


_headers = {'Content-Type': 'application/json'}

for i in range(0, len(data)):
    _gj_drb = data[i][2]

    # FAST ZONAL API BUILDOUT
    _rasters = ['corridors']
    _payload_fzs_buildout = {"geom": eval(_gj_drb),
                "rasters": _rasters}
    _payload_fzs_buildout = json.dumps(_payload_fzs_buildout)
    _url_fzs_buildout = 'http://watersheds.cci.drexel.edu/api/fzs_buildout/'
        
    _r_fzs_buildout = requests.post(_url_fzs_buildout, data=_payload_fzs_buildout, headers=_headers, allow_redirects=True)
    
    try:
        _r_fzs_buildout_out = eval(_r_fzs_buildout.text)
        _r_fzs_buildout_corridors = _r_fzs_buildout_out['corridors']
        
        histo_11, histo_21, histo_22, histo_23, histo_24, histo_31, histo_41, histo_42, histo_43, histo_52, histo_71, histo_81, histo_82, histo_90, histo_95 = \
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
        
        for k, v in _r_fzs_buildout_corridors.items():
            print(k)
            if k == '11':
                histo_11 = v
            elif k == '21':
                histo_21 = v
            elif k == '22':
                histo_22 = v
            elif k == '23':
                histo_23 = v
            elif k == '24':
                histo_24 = v
            elif k == '31':
                histo_31 = v
            elif k == '41':
                histo_41 = v
            elif k == '42':
                histo_42 = v
            elif k == '43':
                histo_43 = v
            elif k == '52':
                histo_52 = v
            elif k == '71':
                histo_71 = v
            elif k == '81':
                histo_81 = v
            elif k == '82':
                histo_82 = v
            elif k == '90':
                histo_90 = v
            elif k == '95':
                histo_95 = v
            else:
                pass
            
        try:
            print(data[i][0], data[i][1])
            print(_r_fzs_buildout_corridors)
            cur.execute("INSERT INTO datapolassess.fd_api_protection_comid_buildout_corridors VALUES "
                            "({},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{});".format(
                    data[i][0], data[i][1], histo_11, histo_21, histo_22, histo_23, histo_24, histo_31, histo_41, histo_42, histo_43, histo_52, histo_71, histo_81, histo_82, histo_90, histo_95))
            PG_Connection.commit()
        except Exception as e:
            print(e)
    except Exception as e:
            print(e)







