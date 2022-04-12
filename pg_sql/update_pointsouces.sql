
select * from wikiwtershed.ms_pointsource_drb_12_13_18 where npdes_id = '4686464';

--798
select distinct npdes_id, state
from phase2.pointsources_azavea_12_13_18_cache;

alter table phase2.pointsources_azavea_12_13_18_cache add constraint pk_pointsources primary key (npdes_id, state);

-- 812
select * 
from phase2.pointsources_azavea_12_13_18_cache
order by npdes_id desc;

drop table if exists wikiwtershed.pointsources_azavea_04_11_2022;
create table wikiwtershed.pointsources_azavea_04_11_2022 as select * from wikiwtershed.ms_pointsource_drb_12_13_18;

update wikiwtershed.pointsources_azavea_04_11_2022 a
set avg_n_conc = b.avg_n_conc
, avgpconc = b.avgpconc
from phase2.pointsources_azavea_12_13_18_cache as b
where a.npdes_id = b.npdes_id and a.state = b.state;

update wikiwtershed.pointsources_azavea_04_11_2022 a
set avg_n_conc = b.avg_n_conc
, avgpconc = b.avgpconc
from phase2.pointsources_azavea_12_13_18_cache as b
where a.npdes_id = b.state||b.npdes_id;



select * from wikiwtershed.pointsources_azavea_04_11_2022 where npdes_id = 'PA0043974';

UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 93410.6753404 where npdes_id = 'PA0043974' and state = 'PA';	
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 13160.809783 where npdes_id = 'PA0043974' and state = 'PA';	
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 42370.3350490027 where npdes_id = 'PA0043974' and state = 'PA';	
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 5969.63803109053 where npdes_id = 'PA0043974' and state = 'PA';

UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 42466.8895816 where npdes_id = 'WQG02231503' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 9403.1893164 where npdes_id = 'WQG02231503' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 19262.6413790971 where npdes_id = 'WQG02231503' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 4265.2114484045 where npdes_id = 'WQG02231503' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 41515.860606 where npdes_id = 'PA0043885' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 11077.002959 where npdes_id = 'PA0043885' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 18831.2622439967 where npdes_id = 'PA0043885' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 5024.43992617872 where npdes_id = 'PA0043885' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 39412.6310798 where npdes_id = 'PA0027235' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 13891.9499598 where npdes_id = 'PA0027235' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 17877.2541567486 where npdes_id = 'PA0027235' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 6301.2773661656 where npdes_id = 'PA0027235' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 39116.8151682 where npdes_id = 'PA0026085' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 4386.9292456 where npdes_id = 'PA0026085' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 17743.0744257741 where npdes_id = 'PA0026085' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 1989.87601037019 where npdes_id = 'PA0026085' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 34249.6755942 where npdes_id = 'PA0026603' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 1827.8945344 where npdes_id = 'PA0026603' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 15535.3788521243 where npdes_id = 'PA0026603' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 829.118337647564 where npdes_id = 'PA0026603' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 27783.9219658 where npdes_id = 'PA0026131' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 4386.9292456 where npdes_id = 'PA0026131' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 12602.5647323111 where npdes_id = 'PA0026131' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 1989.87601037019 where npdes_id = 'PA0026131' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 26518.933056 where npdes_id = 'PA0026972' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 9139.4506258 where npdes_id = 'PA0026972' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 12028.7758827371 where npdes_id = 'PA0026972' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 4145.58168825787 where npdes_id = 'PA0026972' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 24216.0531426 where npdes_id = 'NJ0021598' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 3542.9786634 where npdes_id = 'NJ0021598' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 10984.2079770582 where npdes_id = 'NJ0021598' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 1607.06677788893 where npdes_id = 'NJ0021598' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 22902.2980384 where npdes_id = 'PA0023256' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 767.7148226 where npdes_id = 'PA0023256' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 10388.2991718339 where npdes_id = 'PA0023256' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 348.229301812779 where npdes_id = 'PA0023256' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 22665.8304972 where npdes_id = 'PA0025976' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 4021.3591572 where npdes_id = 'PA0025976' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 10281.0393868859 where npdes_id = 'PA0025976' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 1824.05634283266 where npdes_id = 'PA0025976' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 19971.4982566 where npdes_id = 'PA0026638' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 3290.1969342 where npdes_id = 'PA0026638' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 9058.9118372077 where npdes_id = 'PA0026638' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 1492.40700777764 where npdes_id = 'PA0026638' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 18522.11493 where npdes_id = 'PA0027383' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 4935.3064244 where npdes_id = 'PA0027383' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 8401.48315532856 where npdes_id = 'PA0027383' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 2238.61551165644 where npdes_id = 'PA0027383' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 14421.4996838 where npdes_id = 'NJ0023507' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 676.377416 where npdes_id = 'NJ0023507' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 6541.4768845742 where npdes_id = 'NJ0023507' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 306.799384878272 where npdes_id = 'NJ0023507' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 12480.9270212 where npdes_id = 'NJ0024660' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 2496.180995 where npdes_id = 'NJ0024660' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 5661.24864940015 where npdes_id = 'NJ0024660' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 1132.24772988404 where npdes_id = 'NJ0024660' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 10973.3637728 where npdes_id = 'PA0053147' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 731.162223 where npdes_id = 'PA0053147' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 4977.43002043189 where npdes_id = 'PA0053147' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 331.649335055016 where npdes_id = 'PA0053147' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 8586.6421608 where npdes_id = 'PA0020168' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 957.8192052 where npdes_id = 'PA0020168' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 3894.83219100159 where npdes_id = 'PA0020168' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 434.459128925078 where npdes_id = 'PA0020168' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 8330.597594 where npdes_id = 'PA0070351' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 1096.7323114 where npdes_id = 'PA0070351' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 3778.69242385764 where npdes_id = 'PA0070351' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 497.469002592548 where npdes_id = 'PA0070351' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 7781.9338146 where npdes_id = 'PA0029017' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 365.5700884 where npdes_id = 'PA0029017' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 3529.82292283204 where npdes_id = 'PA0029017' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 165.819667537532 where npdes_id = 'PA0029017' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 7608.1877124 where npdes_id = 'PA0026646' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 292.4648892 where npdes_id = 'PA0026646' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 3451.01308084294 where npdes_id = 'PA0026646' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 132.659734022006 where npdes_id = 'PA0026646' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 7187.5462164 where npdes_id = 'PA0027031' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 212.0403516 where npdes_id = 'PA0027031' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 3260.2134633893 where npdes_id = 'PA0027031' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 96.1798071629472 where npdes_id = 'PA0027031' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 6396.5506066 where npdes_id = 'PA0021601' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 201.061344 where npdes_id = 'PA0021601' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 2901.4241827489 where npdes_id = 'PA0021601' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 91.199817147648 where npdes_id = 'PA0021601' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 4983.7419258 where npdes_id = 'NJ0022519' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 116.7566752 where npdes_id = 'NJ0022519' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 2260.58546760747 where npdes_id = 'NJ0022519' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 52.9598938173184 where npdes_id = 'NJ0022519' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 4572.2275566 where npdes_id = 'PA0021709' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 182.7850442 where npdes_id = 'PA0021709' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 2073.9258418533 where npdes_id = 'PA0021709' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 82.9098337687664 where npdes_id = 'PA0021709' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 4142.4368876 where npdes_id = 'PA0052167' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 424.0807032 where npdes_id = 'PA0052167' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1878.97623272025 where npdes_id = 'PA0052167' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 192.359614325894 where npdes_id = 'PA0052167' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 3365.1540142 where npdes_id = 'PA0060089' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 694.5875772 where npdes_id = 'PA0060089' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1526.406939609 where npdes_id = 'PA0060089' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 315.059368317302 where npdes_id = 'PA0060089' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 3185.3231608 where npdes_id = 'PA0058041' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 93.4317956 where npdes_id = 'PA0058041' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1444.83710315359 where npdes_id = 'PA0058041' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 42.3799150297952 where npdes_id = 'PA0058041' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2926.2362184 where npdes_id = 'NY0029211' and state = 'MD';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 486.228941 where npdes_id = 'NY0029211' and state = 'MD';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1327.31733877649 where npdes_id = 'NY0029211' and state = 'MD';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 220.549557806072 where npdes_id = 'NY0029211' and state = 'MD';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2921.6506088 where npdes_id = 'PA0024074' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 292.2003348 where npdes_id = 'PA0024074' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1325.2373429468 where npdes_id = 'PA0024074' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 132.539734262601 where npdes_id = 'PA0024074' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2844.2023082 where npdes_id = 'PA0021636' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 109.679845 where npdes_id = 'PA0021636' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1290.10741338105 where npdes_id = 'PA0021636' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 49.74990025324 where npdes_id = 'PA0021636' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2560.445668 where npdes_id = 'PA0042170' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 190.1043826 where npdes_id = 'PA0042170' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1161.39767143945 where npdes_id = 'PA0042170' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 86.2298271122992 where npdes_id = 'PA0042170' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2559.0347112 where npdes_id = 'PA0031062' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 548.3771788 where npdes_id = 'PA0031062' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1160.75767272263 where npdes_id = 'PA0031062' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 248.739501286249 where npdes_id = 'PA0031062' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2449.3769124 where npdes_id = 'PA0025437' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 402.1447342 where npdes_id = 'PA0025437' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1111.01777244934 where npdes_id = 'PA0025437' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 182.409634275246 where npdes_id = 'PA0025437' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2272.3900188 where npdes_id = 'PA0062243' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 325.2475886 where npdes_id = 'PA0062243' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 1030.73793340752 where npdes_id = 'PA0062243' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 147.529704208251 where npdes_id = 'PA0062243' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 2093.3087362 where npdes_id = 'PA0046868' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 79.3222276 where npdes_id = 'PA0046868' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 949.50809627043 where npdes_id = 'PA0046868' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 35.9799278615392 where npdes_id = 'PA0046868' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 1636.8642114 where npdes_id = 'PA0060640' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 203.3100564 where npdes_id = 'PA0060640' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 742.468511377348 where npdes_id = 'PA0060640' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 92.2198151025888 where npdes_id = 'PA0060640' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 1610.4308176 where npdes_id = 'NJ0021610' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 80.5127224 where npdes_id = 'NJ0021610' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 730.478535416819 where npdes_id = 'NJ0021610' and state = 'NJ';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 36.5199267788608 where npdes_id = 'NJ0021610' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 1325.0427586 where npdes_id = 'PA0033995' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 84.5912694 where npdes_id = 'PA0033995' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 601.028794958891 where npdes_id = 'PA0033995' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 38.3699230696848 where npdes_id = 'PA0033995' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsn_yr = 13404.972042 where npdes_id = 'PA0022586' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set lbsp_yr = 1340.4972042 where npdes_id = 'PA0022586' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgn_yr = 6079.3524 where npdes_id = 'PA0022586' and state = 'PA';	UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set kgp_yr = 607.93524 where npdes_id = 'PA0022586' and state = 'PA';

-- RUN THIS ONLY ONCE!

UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0043974' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'WQG02231503' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0043885' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0027235' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0026085' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0026603' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0026131' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0026972' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'NJ0021598' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0023256' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0025976' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0026638' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0027383' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'NJ0023507' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'NJ0024660' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0053147' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0020168' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0070351' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0029017' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0026646' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0027031' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0021601' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'NJ0022519' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0021709' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0052167' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0060089' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0058041' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'NY0029211' and state = 'MD';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0024074' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0021636' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0042170' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0031062' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0025437' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0062243' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0046868' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0060640' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'NJ0021610' and state = 'NJ';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0033995' and state = 'PA';
UPDATE wikiwtershed.pointsources_azavea_04_11_2022 set avg_n_conc = avgpconc, avgpconc = avg_n_conc where npdes_id = 'PA0022586' and state = 'PA';

-- QAQC

select * from wikiwtershed.pointsources_azavea_04_11_2022 where npdes_id = 'NJ0023507';

select * from wikiwtershed.pointsources_azavea_04_11_2022 where npdes_id = 'PA0060089';




select ogc_fid						
,npdes_id			
,city			
,state			
,latitude			
,longitude			
,huc12			
,avg_n_conc			
,lbsn_yr			
,mgd			
,avgpconc			
,lbsp_yr			
,kgn_yr			
,kgp_yr			
,facilityname			
,comid
from wikiwtershed.pointsources_azavea_04_11_2022;

alter table wikiwtershed.pointsources_azavea_04_11_2022 add CONSTRAINT pk_ms_pointsource_drb_04_12_22 PRIMARY KEY (npdes_id);

alter table wikiwtershed.pointsources_azavea_04_11_2022 rename to ms_pointsource_drb_04_12_22;

CREATE INDEX ms_pointsource_drb_04_12_22_geomidx
  ON wikiwtershed.ms_pointsource_drb_04_12_22
  USING gist
  (geom);

GRANT ALL ON TABLE wikiwtershed.ms_pointsource_drb_04_12_22 TO gregb;
GRANT SELECT ON TABLE wikiwtershed.ms_pointsource_drb_04_12_22 TO srat_select;





select * from wikiwtershed.comid_qe_ma_new limit 100;

select * from wikiwtershed.strmcat11 limit 100;

select * from wikiwtershed.nhdplus_x_huc12 limit 100;

select * from wikiwtershed.retetion_factors;
--update wikiwtershed.retetion_factors set tn = 0.00, tp = 0.13, tss = 0.10;
update wikiwtershed.retetion_factors set tn = 0.02, tp = 0.16, tss = 0.20;
--update wikiwtershed.retetion_factors set tn = 0.02, tp = 0.19, tss = 0.24;
--update wikiwtershed.retetion_factors set tn = 0.02, tp = 0.22, tss = 0.28;





