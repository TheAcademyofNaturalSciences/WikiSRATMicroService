# Sub-Basin Modeling Routine for WikiWatershed / Model My Watershed

## Install instructions

This project is designed to run on Python 3.8.
To install all dependancies for this project run the following command
```
pip install requirements.txt
```

The SRAT service can be run by executing `main.py`

You will need to have the following enviromental variables set:

Variable|Explantion
--------|----------
POSTGRES_USER|User with premissions to execute SRAT functions
POSTGRES_HOST|Host for database
POSTGRES_PASSWORD|Password for POSTGRES_USER
POSTGRES_PORT|Most likely 5432
POSTGRES_DB|Most likely drwi

## Running tests

Tests for this project use the Unittests library. All tests can be found in the `tests` folder

## Deploying to AWS

There is a simple script called `deploy.py` that will create a .zip for deployment to AWS. This script uses the dependencies that are saved in dependancies.zip. If dependancies have since been updated, please update this zip. Once the `SRAT.zip` has been created, upload it to AWS lambda.

If dependancies need to be updated, the lambda layer that has the python environment should be updated. This is in the './package' folder. This process has been Dockerized for ease of use across operating systems.

```
cd packages
docker build -f Dockerfile . -t aws_lamda_builder_image
./runner.sh
```

Running this code should produce './python.zip'. Upload this python.zip file as a new version of the wikisrat-psycopg2-jsonschema layer in AWS.

## Submitting a baseline 2019 attenuation request

Contact Mike Campagna (msc94@drexel.edu) for an API key. There is no limit on the amount of HUC12s that can be submitted. In order to route comids, all HUC12s in the watershed of interest should be submitted.

Example CURL request. 
```
curl -X POST -H "User-Agent: python-requests/2.26.0" -H "Accept-Encoding: gzip, deflate" -H "Accept: */*" -H "Connection: keep-alive" -H "x-api-key: XXXXXXXXXXXXXXXXXXXX" -d '[{"huc12": "020402031007", "tpload_tiledrain": 151.9988963147289, "tnload_tiledrain": 1423.7102677823646, "tssload_tiledrain": 55418.326854061204, "tpload_hp": 81.26891657809323, "tnload_hp": 256.6697299523854, "tssload_hp": 26702.305956209464, "tpload_crop": 5.476128187061795, "tnload_crop": 39.45267493504511, "tssload_crop": 2224.288070944983, "tpload_wooded": 17.22173760997708, "tnload_wooded": 262.6987387938992, "tssload_wooded": 5151.003446206433, "tpload_wetland": 2.188644935829291, "tnload_wetland": 40.290527006612585, "tssload_wetland": 103.2948287782333, "tpload_open": 1.754299033616584, "tnload_open": 47.63734442840878, "tssload_open": 1083.9374233282124, "tpload_barren": 1.3236050211518449, "tnload_barren": 38.34563516279599, "tssload_barren": 64.26889995948285, "tpload_ldm": 97.4741916821234, "tnload_ldm": 913.0001000420286, "tssload_ldm": 35538.788408635846, "tpload_mdm": 320.1497139090365, "tnload_mdm": 3113.0194695985506, "tssload_mdm": 136690.91908864462, "tpload_hdm": 185.32621099090176, "tnload_hdm": 1802.0447246300723, "tssload_hdm": 79126.76167113516, "tpload_farman": 518.2519736491736, "tnload_farman": 1979.6155180941582, "tpload_streambank": 3677, "tnload_streambank": 11473, "tssload_streambank": 18650178, "tpload_subsurface": 839.9223356086145, "tnload_subsurface": 43825.45498844718, "tpload_pointsource": 84486.05060850835, "tnload_pointsource": 416058.51581764553, "tpload_septics": 0.0, "tnload_septics": 7248.131946000002}]' https://802or9kkk2.execute-api.us-east-2.amazonaws.com/prod/SratRunModel_DEV
```

Input comes from a GWLF-E model run at the HUC08 or HUC10 level on Model My Watershed. This is the data structure schema accepted by the API.
```javascript
[{"huc12": {"type": "string", "pattern": "^[0-9]{1,12}$"},
    "tpload_hp": {"type": "number"},
    "tpload_crop": {"type": "number"},
    "tpload_wooded": {"type": "number"},
    "tpload_open": {"type": "number"},
    "tpload_barren": {"type": "number"},
    "tpload_ldm": {"type": "number"},
    "tpload_mdm": {"type": "number"},
    "tpload_hdm": {"type": "number"},
    "tpload_wetland": {"type": "number"},
    "tpload_farman": {"type": "number"},
    "tpload_tiledrain": {"type": "number"},
    "tpload_streambank": {"type": "number"},
    "tpload_subsurface": {"type": "number"},
    "tpload_pointsource": {"type": "number"},
    "tpload_septics": {"type": "number"},
    "tnload_hp": {"type": "number"},
    "tnload_crop": {"type": "number"},
    "tnload_wooded": {"type": "number"},
    "tnload_open": {"type": "number"},
    "tnload_barren": {"type": "number"},
    "tnload_ldm": {"type": "number"},
    "tnload_mdm": {"type": "number"},
    "tnload_hdm": {"type": "number"},
    "tnload_wetland": {"type": "number"},
    "tnload_farman": {"type": "number"},
    "tnload_tiledrain": {"type": "number"},
    "tnload_streambank": {"type": "number"},
    "tnload_subsurface": {"type": "number"},
    "tnload_pointsource": {"type": "number"},
    "tnload_septics": {"type": "number"},
    "tssload_hp": {"type": "number"},
    "tssload_crop": {"type": "number"},
    "tssload_wooded": {"type": "number"},
    "tssload_open": {"type": "number"},
    "tssload_barren": {"type": "number"},
    "tssload_ldm": {"type": "number"},
    "tssload_mdm": {"type": "number"},
    "tssload_hdm": {"type": "number"},
    "tssload_wetland": {"type": "number"},
    "tssload_tiledrain": {"type": "number"},
    "tssload_streambank": {"type": "number"}
}
]
```

Output is the HUC12 loads re-aggregated and routed at the NHDplus V2 catchment scale.
```javascript
{"020402030901": {"huc12": "020402030901",
  "tpload_hp": {"type": "number"},
  "tpload_crop": {"type": "number"},
  "tpload_wooded": {"type": "number"},
  "tpload_open": {"type": "number"},
  "tpload_barren": {"type": "number"},
  "tpload_ldm": {"type": "number"},
  "tpload_mdm": {"type": "number"},
  "tpload_hdm": {"type": "number"},
  "tpload_wetland": {"type": "number"},
  "tpload_farman": {"type": "number"},
  "tpload_tiledrain": {"type": "number"},
  "tpload_streambank": {"type": "number"},
  "tpload_subsurface": {"type": "number"},
  "tpload_pointsource": {"type": "number"},
  "tpload_septics": {"type": "number"},
  "tnload_hp": {"type": "number"},
  "tnload_crop": {"type": "number"},
  "tnload_wooded": {"type": "number"},
  "tnload_open": {"type": "number"},
  "tnload_barren": {"type": "number"},
  "tnload_ldm": {"type": "number"},
  "tnload_mdm": {"type": "number"},
  "tnload_hdm": {"type": "number"},
  "tnload_wetland": {"type": "number"},
  "tnload_farman": {"type": "number"},
  "tnload_tiledrain": {"type": "number"},
  "tnload_streambank": {"type": "number"},
  "tnload_subsurface": {"type": "number"},
  "tnload_pointsource": {"type": "number"},
  "tnload_septics": {"type": "number"},
  "tssload_hp": {"type": "number"},
  "tssload_crop": {"type": "number"},
  "tssload_wooded": {"type": "number"},
  "tssload_open": {"type": "number"},
  "tssload_barren": {"type": "number"},
  "tssload_ldm": {"type": "number"},
  "tssload_mdm": {"type": "number"},
  "tssload_hdm": {"type": "number"},
  "tssload_wetland": {"type": "number"},
  "tssload_tiledrain": {"type": "number"},
  "tssload_streambank": {"type": "number"},
  "catchments": {"4781585": {"comid": 4781585,
    "tploadrate_total": {"type": "number"},
    "tploadate_conc": {"type": "number"},
    "tnloadrate_total": {"type": "number"},
    "tnloadrate_conc": {"type": "number"},
    "tssloadrate_total": {"type": "number"},
    "tssloadrate_conc": {"type": "number"},
    "tpload_hp": {"type": "number"},
    "tpload_crop": {"type": "number"},
    "tpload_wooded": {"type": "number"},
    "tpload_open": {"type": "number"},
    "tpload_barren": {"type": "number"},
    "tpload_ldm": {"type": "number"},
    "tpload_mdm": {"type": "number"},
    "tpload_hdm": {"type": "number"},
    "tpload_wetland": {"type": "number"},
    "tpload_farman": {"type": "number"},
    "tpload_tiledrain": {"type": "number"},
    "tpload_streambank": {"type": "number"},
    "tpload_subsurface": {"type": "number"},
    "tpload_pointsource": {"type": "number"},
    "tpload_septics": {"type": "number"},
    "tnload_hp": {"type": "number"},
    "tnload_crop": {"type": "number"},
    "tnload_wooded": {"type": "number"},
    "tnload_open": {"type": "number"},
    "tnload_barren": {"type": "number"},
    "tnload_ldm": {"type": "number"},
    "tnload_mdm": {"type": "number"},
    "tnload_hdm": {"type": "number"},
    "tnload_wetland": {"type": "number"},
    "tnload_farman": {"type": "number"},
    "tnload_tiledrain": {"type": "number"},
    "tnload_streambank": {"type": "number"},
    "tnload_subsurface": {"type": "number"},
    "tnload_pointsource": {"type": "number"},
    "tnload_septics": {"type": "number"},
    "tssload_hp": {"type": "number"},
    "tssload_crop": {"type": "number"},
    "tssload_wooded": {"type": "number"},
    "tssload_open": {"type": "number"},
    "tssload_barren": {"type": "number"},
    "tssload_ldm": {"type": "number"},
    "tssload_mdm": {"type": "number"},
    "tssload_hdm": {"type": "number"},
    "tssload_wetland": {"type": "number"},
    "tssload_tiledrain": {"type": "number"},
    "tssload_streambank": {"type": "number"},
    "tn_conc_ptsource": {"type": "number"}, 
    "tp_conc_ptsource": {"type": "number"}, 
    "tss_conc_ptsource": {"type": "number"}, 
    "maflowv": {"type": "number"}},
   "4782675": ...
   },
   ...
   }
  ...
}
```

## Submitting a 2019 attenuation request with DRWI and state agency (PADEP, NJDEP) Restoration Best Management Practices (BMPs) AND/OR DRWI Protection projects considered.

Contact Mike Campagna (msc94@drexel.edu) for an API key. There is no limit on the amount of HUC12s that can be submitted. In order to route comids, all HUC12s in the watershed of interest should be submitted.

In order to submit a request with BMPs considered, there are two additional parameters to be used. These are the "restoration_sources" and "with_attenuation" keys. Both of these must be properly filled out in order to format a valid request. Any combination of restoration and protection source options can be included.

Restoration projects are subtracted from the load as it is attenuated downstream. Protection is dealt with differently. When running a protection run, the result represents the load and concentrations if these parcels were NOT protected. So, the loads go up in the protection runs as this is what the landscape would produce if the lands were not protected.

Restoration Source Options
```
["Delaware River Operational Fund", "Delaware Watershed Conservation Fund", "Delaware River Restoration Fund", "PADEP", "NJDEP"]
```
Protection Source Options
```
["Delaware River Watershed Protection Fund - Forestland Capital Grants", "Delaware River Watershed Protection Fund - Transaction Grants"]
```
With Attenuation Options
```
True or False
```
Example CURL request.
```
curl -X POST -H "User-Agent: python-requests/2.26.0" -H "Accept-Encoding: gzip, deflate" -H "Accept: */*" -H "Connection: keep-alive" -H "x-api-key: XXXXXXXXXXXXXXXXXXXX" -d '[{"huc12": "020402031007", "tpload_tiledrain": 151.9988963147289, "tnload_tiledrain": 1423.7102677823646, "tssload_tiledrain": 55418.326854061204, "tpload_hp": 81.26891657809323, "tnload_hp": 256.6697299523854, "tssload_hp": 26702.305956209464, "tpload_crop": 5.476128187061795, "tnload_crop": 39.45267493504511, "tssload_crop": 2224.288070944983, "tpload_wooded": 17.22173760997708, "tnload_wooded": 262.6987387938992, "tssload_wooded": 5151.003446206433, "tpload_wetland": 2.188644935829291, "tnload_wetland": 40.290527006612585, "tssload_wetland": 103.2948287782333, "tpload_open": 1.754299033616584, "tnload_open": 47.63734442840878, "tssload_open": 1083.9374233282124, "tpload_barren": 1.3236050211518449, "tnload_barren": 38.34563516279599, "tssload_barren": 64.26889995948285, "tpload_ldm": 97.4741916821234, "tnload_ldm": 913.0001000420286, "tssload_ldm": 35538.788408635846, "tpload_mdm": 320.1497139090365, "tnload_mdm": 3113.0194695985506, "tssload_mdm": 136690.91908864462, "tpload_hdm": 185.32621099090176, "tnload_hdm": 1802.0447246300723, "tssload_hdm": 79126.76167113516, "tpload_farman": 518.2519736491736, "tnload_farman": 1979.6155180941582, "tpload_streambank": 3677, "tnload_streambank": 11473, "tssload_streambank": 18650178, "tpload_subsurface": 839.9223356086145, "tnload_subsurface": 43825.45498844718, "tpload_pointsource": 84486.05060850835, "tnload_pointsource": 416058.51581764553, "tpload_septics": 0.0, "tnload_septics": 7248.131946000002, "restoration_sources": ["Delaware River Operational Fund", "Delaware Watershed Conservation Fund", "Delaware River Restoration Fund", "PADEP", "NJDEP"], "with_attenuation": true}]' https://802or9kkk2.execute-api.us-east-2.amazonaws.com/prod/SratRunModel_DEV
```

Input comes from a GWLF-E model run at the HUC08 or HUC10 level on Model My Watershed. This is the data structure schema accepted by the API.
```javascript
[{"huc12": {"type": "string", "pattern": "^[0-9]{1,12}$"},
    "tpload_hp": {"type": "number"},
    "tpload_crop": {"type": "number"},
    "tpload_wooded": {"type": "number"},
    "tpload_open": {"type": "number"},
    "tpload_barren": {"type": "number"},
    "tpload_ldm": {"type": "number"},
    "tpload_mdm": {"type": "number"},
    "tpload_hdm": {"type": "number"},
    "tpload_wetland": {"type": "number"},
    "tpload_farman": {"type": "number"},
    "tpload_tiledrain": {"type": "number"},
    "tpload_streambank": {"type": "number"},
    "tpload_subsurface": {"type": "number"},
    "tpload_pointsource": {"type": "number"},
    "tpload_septics": {"type": "number"},
    "tnload_hp": {"type": "number"},
    "tnload_crop": {"type": "number"},
    "tnload_wooded": {"type": "number"},
    "tnload_open": {"type": "number"},
    "tnload_barren": {"type": "number"},
    "tnload_ldm": {"type": "number"},
    "tnload_mdm": {"type": "number"},
    "tnload_hdm": {"type": "number"},
    "tnload_wetland": {"type": "number"},
    "tnload_farman": {"type": "number"},
    "tnload_tiledrain": {"type": "number"},
    "tnload_streambank": {"type": "number"},
    "tnload_subsurface": {"type": "number"},
    "tnload_pointsource": {"type": "number"},
    "tnload_septics": {"type": "number"},
    "tssload_hp": {"type": "number"},
    "tssload_crop": {"type": "number"},
    "tssload_wooded": {"type": "number"},
    "tssload_open": {"type": "number"},
    "tssload_barren": {"type": "number"},
    "tssload_ldm": {"type": "number"},
    "tssload_mdm": {"type": "number"},
    "tssload_hdm": {"type": "number"},
    "tssload_wetland": {"type": "number"},
    "tssload_tiledrain": {"type": "number"},
    "tssload_streambank": {"type": "number"},
    "restoration_sources": {"type": "array"},
    "with_attenuation": {"type": "boolean"}
}
]
```

Output is the HUC12 loads re-aggregated and routed at the NHDplus V2 catchment scale. Note that the results for land-cover-specific loads are not output at the COMID scale. This is because the load reduction information is based on total nitrogen, phosphorous and sediment for an individual project with no way to break this information down by land cover source.
```javascript
{"020402030901": {"huc12": "020402030901",
  "tpload_hp": {"type": "number"},
  "tpload_crop": {"type": "number"},
  "tpload_wooded": {"type": "number"},
  "tpload_open": {"type": "number"},
  "tpload_barren": {"type": "number"},
  "tpload_ldm": {"type": "number"},
  "tpload_mdm": {"type": "number"},
  "tpload_hdm": {"type": "number"},
  "tpload_wetland": {"type": "number"},
  "tpload_farman": {"type": "number"},
  "tpload_tiledrain": {"type": "number"},
  "tpload_streambank": {"type": "number"},
  "tpload_subsurface": {"type": "number"},
  "tpload_pointsource": {"type": "number"},
  "tpload_septics": {"type": "number"},
  "tnload_hp": {"type": "number"},
  "tnload_crop": {"type": "number"},
  "tnload_wooded": {"type": "number"},
  "tnload_open": {"type": "number"},
  "tnload_barren": {"type": "number"},
  "tnload_ldm": {"type": "number"},
  "tnload_mdm": {"type": "number"},
  "tnload_hdm": {"type": "number"},
  "tnload_wetland": {"type": "number"},
  "tnload_farman": {"type": "number"},
  "tnload_tiledrain": {"type": "number"},
  "tnload_streambank": {"type": "number"},
  "tnload_subsurface": {"type": "number"},
  "tnload_pointsource": {"type": "number"},
  "tnload_septics": {"type": "number"},
  "tssload_hp": {"type": "number"},
  "tssload_crop": {"type": "number"},
  "tssload_wooded": {"type": "number"},
  "tssload_open": {"type": "number"},
  "tssload_barren": {"type": "number"},
  "tssload_ldm": {"type": "number"},
  "tssload_mdm": {"type": "number"},
  "tssload_hdm": {"type": "number"},
  "tssload_wetland": {"type": "number"},
  "tssload_tiledrain": {"type": "number"},
  "tssload_streambank": {"type": "number"},
  "catchments": {"4781585": {"comid": 4781585,
    "tploadrate_total": {"type": "number"},
    "tploadate_conc": {"type": "number"},
    "tnloadrate_total": {"type": "number"},
    "tnloadrate_conc": {"type": "number"},
    "tssloadrate_total": {"type": "number"},
    "tssloadrate_conc": {"type": "number"}
   "4782675": ...
   },
   ...
   }
  ...
}
```

## Running the Jupyter Notebook

There is a simple demonstration called `WikiSRAT_Demo.ipynb` that will link to a database of pre-modeled results from GWLF-E, calculated through Model My Watershed. This script uses the dependencies that are saved in `WikiSRAT.yml`. To restore this environment, follow the below example. For this, you will need to have recieved a config file from ANS that has the login information.
```
conda env create -f WikiSRAT.yml
activate WikiSRAT
ipython kernel install --user --name=WikiSRAT
jupyter notebook WikiSRAT_Demo.ipynb
```
