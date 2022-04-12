
create table wikiwtershed.strmcat19 
as 
select * from wikiwtershed.strmcat11 limit 0;

alter table wikiwtershed.strmcat19 add CONSTRAINT pkstrmcat19 PRIMARY KEY (comid);

create table wikiwtershed.cache_nhdcoefs_2019 
as 
select * from wikiwtershed.nhdcoefs_2019;

alter table wikiwtershed.cache_nhdcoefs_2019 add CONSTRAINT nhdpluscoefs_2019_pk4 PRIMARY KEY (comid);

GRANT SELECT ON TABLE wikiwtershed.cache_nhdcoefs_2019 TO ms_select;
GRANT SELECT ON TABLE wikiwtershed.cache_nhdcoefs_2019 TO srat_select;


alter table wikiwtershed.cache_nhdcoefs_2019 add CONSTRAINT cache_nhdcoefs2_2019_huc12_fkey1 FOREIGN KEY (huc12) REFERENCES wikiwtershed.boundary_huc12 (huc12) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;


