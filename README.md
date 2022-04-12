# Sub-Basin Modeling Routine for WikiWatershed / Model My Watershed

## Install instructions

This project is designed to run on Python 3.6.
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

## Submitting a request

Example CURL request. Contact Mike Campagna (msc94@drexel.edu) for an API key.
```
curl -X POST -H "User-Agent: python-requests/2.26.0" -H "Accept-Encoding: gzip, deflate" -H "Accept: */*" -H "Connection: keep-alive" -H "x-api-key: XXXXXXXXXXXXXXXXXXXX" -H "Content-Length: 11735" -d '[{"huc12": "020402031007", "tpload_tiledrain": 151.9988963147289, "tnload_tiledrain": 1423.7102677823646, "tssload_tiledrain": 55418.326854061204, "tpload_hp": 81.26891657809323, "tnload_hp": 256.6697299523854, "tssload_hp": 26702.305956209464, "tpload_crop": 5.476128187061795, "tnload_crop": 39.45267493504511, "tssload_crop": 2224.288070944983, "tpload_wooded": 17.22173760997708, "tnload_wooded": 262.6987387938992, "tssload_wooded": 5151.003446206433, "tpload_wetland": 2.188644935829291, "tnload_wetland": 40.290527006612585, "tssload_wetland": 103.2948287782333, "tpload_open": 1.754299033616584, "tnload_open": 47.63734442840878, "tssload_open": 1083.9374233282124, "tpload_barren": 1.3236050211518449, "tnload_barren": 38.34563516279599, "tssload_barren": 64.26889995948285, "tpload_ldm": 97.4741916821234, "tnload_ldm": 913.0001000420286, "tssload_ldm": 35538.788408635846, "tpload_mdm": 320.1497139090365, "tnload_mdm": 3113.0194695985506, "tssload_mdm": 136690.91908864462, "tpload_hdm": 185.32621099090176, "tnload_hdm": 1802.0447246300723, "tssload_hdm": 79126.76167113516, "tpload_farman": 518.2519736491736, "tnload_farman": 1979.6155180941582, "tpload_streambank": 3677, "tnload_streambank": 11473, "tssload_streambank": 18650178, "tpload_subsurface": 839.9223356086145, "tnload_subsurface": 43825.45498844718, "tpload_pointsource": 84486.05060850835, "tnload_pointsource": 416058.51581764553, "tpload_septics": 0.0, "tnload_septics": 7248.131946000002}, {"huc12": "020402031002", "tpload_tiledrain": 71.90093332903781, "tnload_tiledrain": 671.3643379780342, "tssload_tiledrain": 26254.62337054578, "tpload_hp": 476.4847681076154, "tnload_hp": 1103.450842582097, "tssload_hp": 144133.0510684356, "tpload_crop": 753.8098839484895, "tnload_crop": 2276.2994576957435, "tssload_crop": 485574.062319786, "tpload_wooded": 23.052788088890768, "tnload_wooded": 323.48018000065093, "tssload_wooded": 5458.613825911071, "tpload_wetland": 3.3575188437358174, "tnload_wetland": 58.0388944118447, "tssload_wetland": 274.2568911713522, "tpload_open": 2.8849430611827938, "tnload_open": 32.65600583476815, "tssload_open": 1877.560355778007, "tpload_barren": 0.14104181864308343, "tnload_barren": 3.913279942360054, "tssload_barren": 9.18334599657182, "tpload_ldm": 53.65226721460775, "tnload_ldm": 500.97011529346366, "tssload_ldm": 19591.12355675812, "tpload_mdm": 137.10238701909597, "tnload_mdm": 1335.2192718595436, "tssload_mdm": 61363.25280664948, "tpload_hdm": 61.680278952715405, "tnload_hdm": 600.6948452317417, "tssload_hdm": 27606.394263820992, "tpload_farman": 806.0272291083704, "tnload_farman": 3359.32751807924, "tpload_streambank": 1892, "tnload_streambank": 3947, "tssload_streambank": 6099464, "tpload_subsurface": 643.1871561640324, "tnload_subsurface": 43726.22169853858, "tpload_pointsource": 21631.48662964761, "tnload_pointsource": 169469.54021966943, "tpload_septics": 0.0, "tnload_septics": 3041.9538599999987}, {"huc12": "020402031003", "tpload_tiledrain": 58.5351318378462, "tnload_tiledrain": 545.6454869988083, "tssload_tiledrain": 22093.19444189769, "tpload_hp": 354.33219604279054, "tnload_hp": 913.3220742551916, "tssload_hp": 143928.18463069046, "tpload_crop": 837.6368332533727, "tnload_crop": 2778.970853281117, "tssload_crop": 651747.8898245891, "tpload_wooded": 18.082151738874554, "tnload_wooded": 179.9026780772318, "tssload_wooded": 9335.451120091877, "tpload_wetland": 5.703601996281584, "tnload_wetland": 91.06269658882614, "tssload_wetland": 987.1604202156216, "tpload_open": 1.955920615665028, "tnload_open": 23.212270346268546, "tssload_open": 1483.2982493195955, "tpload_barren": 0.0250625239007076, "tnload_barren": 0.616441375989875, "tssload_barren": 4.645744115592343, "tpload_ldm": 25.934847931345356, "tnload_ldm": 241.75622887363886, "tssload_ldm": 9788.713549933365, "tpload_mdm": 52.60920513736478, "tnload_mdm": 514.7280687445407, "tssload_mdm": 25697.71696443285, "tpload_hdm": 13.698355035766966, "tnload_hdm": 134.02460299727252, "tssload_hdm": 6691.156987989527, "tpload_farman": 2648.3319598932103, "tnload_farman": 11573.427988250001, "tpload_streambank": 913, "tnload_streambank": 2197, "tssload_streambank": 3455682, "tpload_subsurface": 1174.8688623597088, "tnload_subsurface": 118982.26854546226, "tpload_pointsource": 0.0, "tnload_pointsource": 0.0, "tpload_septics": 0.0, "tnload_septics": 1274.1167999999996}, {"huc12": "020402031004", "tpload_tiledrain": 53.36001321183094, "tnload_tiledrain": 499.1154032716765, "tssload_tiledrain": 19650.88549984443, "tpload_hp": 74.96008356407008, "tnload_hp": 223.00196138925884, "tssload_hp": 37995.46213316214, "tpload_crop": 66.9718012140605, "tnload_crop": 244.9955629132646, "tssload_crop": 65418.46372411163, "tpload_wooded": 9.488303552590697, "tnload_wooded": 111.0515548152738, "tssload_wooded": 4861.783629880077, "tpload_wetland": 0.6008358352854642, "tnload_wetland": 9.954465464541395, "tssload_wetland": 102.63576788769028, "tpload_open": 2.193830643715939, "tnload_open": 25.075432815276187, "tssload_open": 2031.0757693291866, "tpload_barren": 0.8638061718613039, "tnload_barren": 21.85538648091675, "tssload_barren": 169.33395735572074, "tpload_ldm": 30.733623060113295, "tnload_ldm": 287.4741542276652, "tssload_ldm": 11318.267582732886, "tpload_mdm": 117.44291052871951, "tnload_mdm": 1145.2572232552648, "tssload_mdm": 53487.930724566606, "tpload_hdm": 47.952105358916505, "tnload_hdm": 467.6101331733182, "tssload_hdm": 21839.197257527383, "tpload_farman": 1583.7545833712284, "tnload_farman": 6920.435005527961, "tpload_streambank": 676, "tnload_streambank": 1964, "tssload_streambank": 3058886, "tpload_subsurface": 345.21365020294064, "tnload_subsurface": 15632.292797014117, "tpload_pointsource": 689.6386172993856, "tnload_pointsource": 6179.7676097882895, "tpload_septics": 0.0, "tnload_septics": 2744.1290580000004}, {"huc12": "020402031005", "tpload_tiledrain": 65.91258947884286, "tnload_tiledrain": 616.4132902116984, "tssload_tiledrain": 23782.253848909095, "tpload_hp": 256.23663402226833, "tnload_hp": 678.2434093348163, "tssload_hp": 99363.55865485151, "tpload_crop": 356.4270923984617, "tnload_crop": 1296.6817638696505, "tssload_crop": 271312.88213408506, "tpload_wooded": 5.7098765703495795, "tnload_wooded": 96.34455869104575, "tssload_wooded": 726.4720257297129, "tpload_wetland": 0.8652783914116278, "tnload_wetland": 15.477124779484525, "tssload_wetland": 57.62222182356646, "tpload_open": 0.5060126734014113, "tnload_open": 9.057971953104566, "tssload_open": 339.3066101505826, "tpload_barren": 0.2368121136442157, "tnload_barren": 6.748722758772469, "tssload_barren": 12.806575495207884, "tpload_ldm": 55.7593773042988, "tnload_ldm": 521.4606419814676, "tssload_ldm": 20118.822155114864, "tpload_mdm": 104.1835361910485, "tnload_mdm": 1015.1564817619501, "tssload_mdm": 47179.92526825505, "tpload_hdm": 43.8692321093922, "tnload_hdm": 427.4584733244576, "tssload_hdm": 19866.354782788538, "tpload_farman": 227.84641764758865, "tnload_farman": 860.5428541974088, "tpload_streambank": 788, "tnload_streambank": 1866, "tssload_streambank": 3137030, "tpload_subsurface": 369.8190408369646, "tnload_subsurface": 21887.36994059851, "tpload_pointsource": 128.61974212204476, "tnload_pointsource": 2203.475582110739, "tpload_septics": 0.0, "tnload_septics": 2323.6705140000004}, {"huc12": "020402031008", "tpload_tiledrain": 35.6767418636447, "tnload_tiledrain": 336.469298943642, "tssload_tiledrain": 12350.084036306916, "tpload_hp": 4.540275448906245, "tnload_hp": 14.228528225910749, "tssload_hp": 906.4157983340926, "tpload_crop": 1.799100543191853, "tnload_crop": 15.649501742182158, "tssload_crop": 339.5240783632521, "tpload_wooded": 2.006691470069048, "tnload_wooded": 35.51335343479423, "tssload_wooded": 212.79124106637443, "tpload_wetland": 2.302505265375395, "tnload_wetland": 43.73424842347138, "tssload_wetland": 1.0869708305827872, "tpload_open": 0.9186667663928846, "tnload_open": 38.85723400030074, "tssload_open": 207.82694777512648, "tpload_barren": 0.1184462201334566, "tnload_barren": 3.5256623177820465, "tssload_barren": 1.385778001625454, "tpload_ldm": 41.319078536675704, "tnload_ldm": 389.6824839377943, "tssload_ldm": 14303.270578379526, "tpload_mdm": 412.2382289969066, "tnload_mdm": 3980.3396349579652, "tssload_mdm": 147382.60487996537, "tpload_hdm": 558.8427212938925, "tnload_hdm": 5395.869855851091, "tssload_hdm": 199796.35606070975, "tpload_farman": 30.520851515386198, "tnload_farman": 118.88676257230176, "tpload_streambank": 891, "tnload_streambank": 1340, "tssload_streambank": 5073942, "tpload_subsurface": 2146.759264723012, "tnload_subsurface": 280434.9615427279, "tpload_pointsource": 40582.368633811064, "tnload_pointsource": 9391.891169596127, "tpload_septics": 0.0, "tnload_septics": 8622.585443999997}, {"huc12": "020402031006", "tpload_tiledrain": 119.44073332814234, "tnload_tiledrain": 1121.536189295922, "tssload_tiledrain": 42751.66574321999, "tpload_hp": 604.5358371460408, "tnload_hp": 1636.7814032581298, "tssload_hp": 219186.17036514782, "tpload_crop": 1134.448381989612, "tnload_crop": 4224.6688680251655, "tssload_crop": 917439.1015581441, "tpload_wooded": 20.123523751690666, "tnload_wooded": 307.0124652939899, "tssload_wooded": 4705.841058525231, "tpload_wetland": 4.402257591497741, "tnload_wetland": 78.87301020431829, "tssload_wetland": 297.95538972403995, "tpload_open": 3.6493456585386976, "tnload_open": 50.87794234530801, "tssload_open": 2844.9846250906585, "tpload_barren": 0.4529304411990668, "tnload_barren": 12.946036080855922, "tssload_barren": 24.003848273416814, "tpload_ldm": 93.67386159522587, "tnload_ldm": 879.5879164732955, "tssload_ldm": 33528.87669228809, "tpload_mdm": 239.61472742221167, "tnload_mdm": 2333.789259800038, "tssload_mdm": 106238.79833961948, "tpload_hdm": 113.71932854441195, "tnload_hdm": 1107.5986457250576, "tssload_hdm": 50420.12626902832, "tpload_farman": 1437.455436953993, "tnload_farman": 6059.044949239532, "tpload_streambank": 3594, "tnload_streambank": 9314, "tssload_streambank": 14736726, "tpload_subsurface": 923.2084830099982, "tnload_subsurface": 59925.09111136625, "tpload_pointsource": 60550.98859744651, "tnload_pointsource": 13607.232717987992, "tpload_septics": 0.0, "tnload_septics": 5523.296328}, {"huc12": "020402031001", "tpload_tiledrain": 24.34461426752157, "tnload_tiledrain": 223.93748151763253, "tssload_tiledrain": 9890.052298515275, "tpload_hp": 254.55520775910495, "tnload_hp": 589.6740238645044, "tssload_hp": 126300.46778109811, "tpload_crop": 600.1081450936132, "tnload_crop": 1556.3673460355276, "tssload_crop": 453119.7659875034, "tpload_wooded": 12.902330063290373, "tnload_wooded": 95.55806371359343, "tssload_wooded": 7452.18442314593, "tpload_wetland": 0.9463761521556932, "tnload_wetland": 13.919243661550585, "tssload_wetland": 202.35857625281878, "tpload_open": 1.3884655057672197, "tnload_open": 8.645396763867154, "tssload_open": 1068.603251362505, "tpload_barren": 0.03106383073177255, "tnload_barren": 0.8325009950324652, "tssload_barren": 3.0005410757186697, "tpload_ldm": 5.898701646049841, "tnload_ldm": 54.26006657261341, "tssload_ldm": 2396.360325601917, "tpload_mdm": 6.679523282231212, "tnload_mdm": 65.27049883333024, "tssload_mdm": 3220.117027637151, "tpload_hdm": 1.9020167193797397, "tnload_hdm": 18.585994062405693, "tssload_hdm": 916.9391536096821, "tpload_farman": 1017.8890459726888, "tnload_farman": 4441.131052344155, "tpload_streambank": 193, "tnload_streambank": 403, "tssload_streambank": 649490, "tpload_subsurface": 396.45886697805093, "tnload_subsurface": 36311.708910491325, "tpload_pointsource": 77.76984407426079, "tnload_pointsource": 2.6399947069056005, "tpload_septics": 0.0, "tnload_septics": 156.0793079999999}]' https://802or9kkk2.execute-api.us-east-2.amazonaws.com/prod/SratRunModel_DEV
```

Input comes from a GWLF-E model run at the HUC08 or HUC10 level on Model My Watershed.
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
    "tssload_streambank": {"type": "number"}},
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
