-- Function: wikiwtershed.srat_nhd_nlcd2019_restoration_protection(character varying[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], text[], boolean[])

-- DROP FUNCTION wikiwtershed.srat_nhd_nlcd2019_restoration_protection(character varying[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], text[], boolean[]);

CREATE OR REPLACE FUNCTION wikiwtershed.srat_nhd_nlcd2019_restoration_protection(
    IN huc12a character varying[],
    IN tpload_hp double precision[],
    IN tpload_crop double precision[],
    IN tpload_wooded double precision[],
    IN tpload_open double precision[],
    IN tpload_barren double precision[],
    IN tpload_ldm double precision[],
    IN tpload_mdm double precision[],
    IN tpload_hdm double precision[],
    IN tpload_otherup double precision[],
    IN tpload_farman double precision[],
    IN tpload_tiledrain double precision[],
    IN tpload_streambank double precision[],
    IN tpload_subsurface double precision[],
    IN tpload_pointsource double precision[],
    IN tpload_septics double precision[],
    IN tnload_hp double precision[],
    IN tnload_crop double precision[],
    IN tnload_wooded double precision[],
    IN tnload_open double precision[],
    IN tnload_barren double precision[],
    IN tnload_ldm double precision[],
    IN tnload_mdm double precision[],
    IN tnload_hdm double precision[],
    IN tnload_otherup double precision[],
    IN tnload_farman double precision[],
    IN tnload_tiledrain double precision[],
    IN tnload_streambank double precision[],
    IN tnload_subsurface double precision[],
    IN tnload_pointsource double precision[],
    IN tnload_septics double precision[],
    IN tssload_hp double precision[],
    IN tssload_crop double precision[],
    IN tssload_wooded double precision[],
    IN tssload_open double precision[],
    IN tssload_barren double precision[],
    IN tssload_ldm double precision[],
    IN tssload_mdm double precision[],
    IN tssload_hdm double precision[],
    IN tssload_otherup double precision[],
    IN tssload_tiledrain double precision[],
    IN tssload_streambank double precision[],
    IN restoration_sources text[],
    IN with_concentration boolean[])
  RETURNS TABLE(comid2 integer, tploadrate_total2 double precision, tploadrate_conc2 double precision, tnloadrate_total2 double precision, tnloadrate_conc2 double precision, tssloadrate_total2 double precision, tssloadrate_conc2 double precision,
  tpload_hp2 double precision, tpload_crop2 double precision, tpload_wooded2 double precision, tpload_open2 double precision, tpload_barren2 double precision, tpload_ldm2 double precision, tpload_mdm2 double precision, tpload_hdm2 double precision,
  tpload_otherup2 double precision, tpload_farman2 double precision, tpload_tiledrain2 double precision, tpload_streambank2 double precision, tpload_subsurface2 double precision, tpload_pointsource2 double precision, tpload_septics2 double precision,
  tnload_hp2 double precision, tnload_crop2 double precision, tnload_wooded2 double precision, tnload_open2 double precision, tnload_barren2 double precision, tnload_ldm2 double precision, tnload_mdm2 double precision, tnload_hdm2 double precision,
  tnload_otherup2 double precision, tnload_farman2 double precision, tnload_tiledrain2 double precision, tnload_streambank2 double precision, tnload_subsurface2 double precision, tnload_pointsource2 double precision, tnload_septics2 double precision,
  tssload_hp2 double precision, tssload_crop2 double precision, tssload_wooded2 double precision, tssload_open2 double precision, tssload_barren2 double precision, tssload_ldm2 double precision, tssload_mdm2 double precision, tssload_hdm2 double precision,
  tssload_otherup2 double precision, tssload_tiledrain2 double precision, tssload_streambank2 double precision,

  tpconc_hp2 double precision, tnconc_hp2 double precision, tssconc_hp2 double precision,
  tpconc_Crop2  double precision, tnconc_Crop2  double precision, tssconc_Crop2  double precision,
  tpconc_Wooded2  double precision, tnconc_Wooded2  double precision, tssconc_Wooded2  double precision,
  tpconc_Open2  double precision, tnconc_Open2  double precision, tssconc_Open2  double precision,
  tpconc_barren2  double precision, tnconc_barren2  double precision, tssconc_barren2  double precision,
  tpconc_ldm2  double precision, tnconc_ldm2  double precision, tssconc_ldm2  double precision,
  tpconc_MDM2  double precision, tnconc_MDM2  double precision, tssconc_MDM2  double precision,
  tpconc_HDM2  double precision, tnconc_HDM2  double precision, tssconc_HDM2  double precision,
  tpconc_OtherUp2  double precision, tnconc_OtherUp2  double precision, tssconc_OtherUp2  double precision,
  tpconc_FarmAn2  double precision, tnconc_FarmAn2  double precision,
  tpconc_tiledrain2  double precision, tnconc_tiledrain2  double precision, tssconc_tiledrain2  double precision,
  tpconc_streambank2  double precision, tnconc_streambank2  double precision, tssconc_streambank2  double precision,
  tpconc_subsurface2  double precision, tnconc_subsurface2  double precision,
  tpconc_septics2  double precision, tnconc_septics2  double precision,
  tpconc_ptsource2 double precision, tnconc_ptsource2 double precision,

  maflowv2 double precision

) AS
$BODY$

BEGIN

Drop Table If Exists nhdplus_out,huc12_out;

-- Create Temporary Output Tables
CREATE TEMP TABLE huc12_out
(
huc12 character varying(12)not null,
tpload_hp float Default 0,
tpload_Crop  float Default 0,
tpload_Wooded  float Default 0,
tpload_Open  float Default 0,
tpload_barren  float Default 0,
tpload_ldm  float Default 0,
tpload_MDM  float Default 0,
tpload_HDM  float Default 0,
tpload_OtherUp  float Default 0,
tpload_FarmAn  float Default 0,
tpload_tiledrain  float Default 0,
tpload_streambank  float Default 0,
tpload_subsurface  float Default 0,
tpload_pointsource  float Default 0,
tpload_septics  float Default 0,
tnload_hp  float Default 0,
tnload_crop  float Default 0,
tnload_wooded  float Default 0,
tnload_open  float Default 0,
tnload_barren  float Default 0,
tnload_ldm  float Default 0,
tnload_mdm  float Default 0,
tnload_hdm  float Default 0,
tnload_otherup  float Default 0,
tnload_farman  float Default 0,
tnload_tiledrain  float Default 0,
tnload_streambank  float Default 0,
tnload_subsurface  float Default 0,
tnload_pointsource  float Default 0,
tnload_septics  float Default 0,
tssload_hp  float Default 0,
tssload_crop  float Default 0,
tssload_wooded  float Default 0,
tssload_open  float Default 0,
tssload_barren  float Default 0,
tssload_ldm  float Default 0,
tssload_mdm  float Default 0,
tssload_hdm  float Default 0,
tssload_otherup  float Default 0,
tssload_tiledrain  float Default 0,
tssload_streambank  float Default 0,

tpload_hp_att float Default 0,
tpload_Crop_att  float Default 0,
tpload_Wooded_att  float Default 0,
tpload_Open_att  float Default 0,
tpload_barren_att  float Default 0,
tpload_ldm_att  float Default 0,
tpload_MDM_att  float Default 0,
tpload_HDM_att  float Default 0,
tpload_OtherUp_att  float Default 0,
tpload_FarmAn_att  float Default 0,
tpload_tiledrain_att  float Default 0,
tpload_streambank_att  float Default 0,
tpload_subsurface_att  float Default 0,
tpload_pointsource_att  float Default 0,
tpload_septics_att  float Default 0,
tnload_hp_att  float Default 0,
tnload_crop_att  float Default 0,
tnload_wooded_att  float Default 0,
tnload_open_att  float Default 0,
tnload_barren_att  float Default 0,
tnload_ldm_att  float Default 0,
tnload_mdm_att  float Default 0,
tnload_hdm_att  float Default 0,
tnload_otherup_att  float Default 0,
tnload_farman_att  float Default 0,
tnload_tiledrain_att  float Default 0,
tnload_streambank_att  float Default 0,
tnload_subsurface_att  float Default 0,
tnload_pointsource_att  float Default 0,
tnload_septics_att  float Default 0,
tssload_hp_att  float Default 0,
tssload_crop_att  float Default 0,
tssload_wooded_att  float Default 0,
tssload_open_att  float Default 0,
tssload_barren_att  float Default 0,
tssload_ldm_att  float Default 0,
tssload_mdm_att  float Default 0,
tssload_hdm_att  float Default 0,
tssload_otherup_att  float Default 0,
tssload_tiledrain_att  float Default 0,
tssload_streambank_att  float Default 0,
CONSTRAINT huc12_tmp_primary  PRIMARY KEY (huc12)
) ON COMMIT DROP;


CREATE TEMP TABLE nhdplus_out
(
comid integer not null,
hydroseq integer not null,
d_comid integer,
ShedAreaDrainLake double precision Default 0,
tploadrate_total  float Default 0,
tploadrate_total_ups  float Default 0,

-- Changed 6-5-18
tp_conc                float Default null,
tnloadrate_total  float Default 0,
tnloadrate_total_ups  float Default 0,

-- Changed 6-5-18
tn_conc                float Default null,
tssloadrate_total  float Default 0,
tssloadrate_total_ups  float Default 0,

-- Changed 6-5-18
tss_conc  float Default null,
totdasqkm float Default 0,
areasqkm float Default 0,

-- CHANGED 04-2022 ADD IN ALL THE LOAD SOURCES BY COMID
tpload_hp  float Default 0,
tpload_Crop  float Default 0,
tpload_Wooded  float Default 0,
tpload_Open  float Default 0,
tpload_barren  float Default 0,
tpload_ldm  float Default 0,
tpload_MDM  float Default 0,
tpload_HDM  float Default 0,
tpload_OtherUp  float Default 0,
tpload_FarmAn  float Default 0,
tpload_tiledrain  float Default 0,
tpload_streambank  float Default 0,
tpload_subsurface  float Default 0,
tpload_pointsource  float Default 0,
tpload_septics  float Default 0,

tnload_hp  float Default 0,
tnload_crop  float Default 0,
tnload_wooded  float Default 0,
tnload_open  float Default 0,
tnload_barren  float Default 0,
tnload_ldm  float Default 0,
tnload_mdm  float Default 0,
tnload_hdm  float Default 0,
tnload_otherup  float Default 0,
tnload_farman  float Default 0,
tnload_tiledrain  float Default 0,
tnload_streambank  float Default 0,
tnload_subsurface  float Default 0,
tnload_pointsource  float Default 0,
tnload_septics  float Default 0,

tssload_hp  float Default 0,
tssload_crop  float Default 0,
tssload_wooded  float Default 0,
tssload_open  float Default 0,
tssload_barren  float Default 0,
tssload_ldm  float Default 0,
tssload_mdm  float Default 0,
tssload_hdm  float Default 0,
tssload_otherup  float Default 0,
tssload_tiledrain  float Default 0,
tssload_streambank  float Default 0,

tpload_hp_ups  float Default 0,
tpload_Crop_ups  float Default 0,
tpload_Wooded_ups  float Default 0,
tpload_Open_ups  float Default 0,
tpload_barren_ups  float Default 0,
tpload_ldm_ups  float Default 0,
tpload_MDM_ups  float Default 0,
tpload_HDM_ups  float Default 0,
tpload_OtherUp_ups  float Default 0,
tpload_FarmAn_ups  float Default 0,
tpload_tiledrain_ups  float Default 0,
tpload_streambank_ups  float Default 0,
tpload_subsurface_ups  float Default 0,
tpload_pointsource_ups  float Default 0,
tpload_septics_ups  float Default 0,

tnload_hp_ups  float Default 0,
tnload_crop_ups  float Default 0,
tnload_wooded_ups  float Default 0,
tnload_open_ups  float Default 0,
tnload_barren_ups  float Default 0,
tnload_ldm_ups  float Default 0,
tnload_mdm_ups  float Default 0,
tnload_hdm_ups  float Default 0,
tnload_otherup_ups  float Default 0,
tnload_farman_ups  float Default 0,
tnload_tiledrain_ups  float Default 0,
tnload_streambank_ups  float Default 0,
tnload_subsurface_ups  float Default 0,
tnload_pointsource_ups  float Default 0,
tnload_septics_ups  float Default 0,

tssload_hp_ups  float Default 0,
tssload_crop_ups  float Default 0,
tssload_wooded_ups  float Default 0,
tssload_open_ups  float Default 0,
tssload_barren_ups  float Default 0,
tssload_ldm_ups  float Default 0,
tssload_mdm_ups  float Default 0,
tssload_hdm_ups  float Default 0,
tssload_otherup_ups  float Default 0,
tssload_tiledrain_ups  float Default 0,
tssload_streambank_ups  float Default 0,

-- ADDED 10-2022

  tpconc_hp float Default null, tnconc_hp float Default null, tssconc_hp float Default null,
  tpconc_Crop  float Default null, tnconc_Crop  float Default null, tssconc_Crop  float Default null,
  tpconc_Wooded  float Default null, tnconc_Wooded  float Default null, tssconc_Wooded  float Default null,
  tpconc_Open  float Default null, tnconc_Open  float Default null, tssconc_Open  float Default null,
  tpconc_barren  float Default null, tnconc_barren  float Default null, tssconc_barren  float Default null,
  tpconc_ldm  float Default null, tnconc_ldm  float Default null, tssconc_ldm  float Default null,
  tpconc_MDM  float Default null, tnconc_MDM  float Default null, tssconc_MDM  float Default null,
  tpconc_HDM  float Default null, tnconc_HDM  float Default null, tssconc_HDM  float Default null,
  tpconc_OtherUp  float Default null, tnconc_OtherUp  float Default null, tssconc_OtherUp  float Default null,
  tpconc_FarmAn  float Default null, tnconc_FarmAn  float Default null,
  tpconc_tiledrain  float Default null, tnconc_tiledrain  float Default null, tssconc_tiledrain  float Default null,
  tpconc_streambank  float Default null, tnconc_streambank  float Default null, tssconc_streambank  float Default null,
  tpconc_subsurface  float Default null, tnconc_subsurface  float Default null,
  tpconc_septics  float Default null, tnconc_septics  float Default null,
  tpconc_ptsource float Default null, tnconc_ptsource float Default null,

maflowv                float Default null,

CONSTRAINT nhdplus_tmp_primary PRIMARY KEY (comid)
) ON COMMIT DROP;

set enable_seqscan = off;

-- Insert
Insert into huc12_out
(huc12,
tpload_hp,
tpload_Crop,
tpload_Wooded,
tpload_Open,
tpload_barren,
tpload_ldm,
tpload_MDM,
tpload_HDM,
tpload_OtherUp,
tpload_FarmAn,
tpload_tiledrain,
tpload_streambank,
tpload_subsurface,
tpload_pointsource,
tpload_septics,
tnload_hp,
tnload_crop,
tnload_wooded,
tnload_open,
tnload_barren,
tnload_ldm,
tnload_mdm,
tnload_hdm,
tnload_otherup,
tnload_farman,
tnload_tiledrain,
tnload_streambank,
tnload_subsurface,
tnload_pointsource,
tnload_septics,
tssload_hp,
tssload_crop,
tssload_wooded,
tssload_open,
tssload_barren,
tssload_ldm,
tssload_mdm,
tssload_hdm,
tssload_otherup,
tssload_tiledrain,
tssload_streambank

)
Select unnest(huc12a) as huc12a,
unnest(                tpload_hp),
unnest(                tpload_Crop),
unnest(                tpload_Wooded),
unnest(                tpload_Open),
unnest(                tpload_barren),
unnest(                tpload_ldm),
unnest(                tpload_MDM),
unnest(                tpload_HDM),
unnest(                tpload_OtherUp),
unnest(                tpload_FarmAn),
unnest(                tpload_tiledrain),
unnest(                tpload_streambank),
unnest(                tpload_subsurface),
unnest(                tpload_pointsource),
unnest(                tpload_septics),
unnest(                tnload_hp),
unnest(                tnload_crop),
unnest(                tnload_wooded),
unnest(                tnload_open),
unnest(                tnload_barren),
unnest(                tnload_ldm),
unnest(                tnload_mdm),
unnest(                tnload_hdm),
unnest(                tnload_otherup),
unnest(                tnload_farman),
unnest(                tnload_tiledrain),
unnest(                tnload_streambank),
unnest(                tnload_subsurface),
unnest(                tnload_pointsource),
unnest(                tnload_septics),
unnest(                tssload_hp),
unnest(                tssload_crop),
unnest(                tssload_wooded),
unnest(                tssload_open),
unnest(                tssload_barren),
unnest(                tssload_ldm),
unnest(                tssload_mdm),
unnest(                tssload_hdm),
unnest(                tssload_otherup),
unnest(                tssload_tiledrain),
unnest(                tssload_streambank )
;

Insert into nhdplus_out
(
comid
,hydroseq
,d_comid
,ShedAreaDrainLake
,tploadrate_total
,tnloadrate_total
,tssloadrate_total

-- ADD IN ALL THE LOAD SOURCES BY COMID
,tpload_hp,
tpload_Crop,
tpload_Wooded,
tpload_Open,
tpload_barren,
tpload_ldm,
tpload_MDM,
tpload_HDM,
tpload_OtherUp,
tpload_FarmAn,
tpload_tiledrain,
tpload_streambank,
tpload_subsurface,
tpload_pointsource,
tpload_septics,

tnload_hp,
tnload_crop,
tnload_wooded,
tnload_open,
tnload_barren,
tnload_ldm,
tnload_mdm,
tnload_hdm,
tnload_otherup,
tnload_farman,
tnload_tiledrain,
tnload_streambank,
tnload_subsurface,
tnload_pointsource,
tnload_septics,

tssload_hp,
tssload_crop,
tssload_wooded,
tssload_open,
tssload_barren,
tssload_ldm,
tssload_mdm,
tssload_hdm,
tssload_otherup,
tssload_tiledrain,
tssload_streambank

)

select comid, hydroseq, d_comid, ShedAreaDrainLake
-- IMPLEMENT IN HERE IF WE DO NOT WANT NEGATIVE NUMBERS, CHANGE THE 100s to just 1, 0.3s IN THE CONDITIONALS
, case
	when coalesce(rest.tp_reduced_kg, 0.0) > (tploadrate_total * 100) then ((tploadrate_total * 0.3) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )))
	else ((tploadrate_total - coalesce(rest.tp_reduced_kg, 0.0) + coalesce(prot.tn_avoided_kg, 0.0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) ))) end
, case
	when coalesce(rest.tn_reduced_kg, 0.0) > (tnloadrate_total * 100) then ((tnloadrate_total * 0.3) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )))
	else ((tnloadrate_total - coalesce(rest.tn_reduced_kg, 0.0) + coalesce(prot.tp_avoided_kg, 0.0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) ))) end
, case
	when coalesce(rest.tss_reduced_kg, 0.0) > (tssloadrate_total * 100) then ((tssloadrate_total * 0.3) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )))
	else ((tssloadrate_total - coalesce(rest.tss_reduced_kg, 0.0) + coalesce(prot.tss_avoided_kg, 0.0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) ))) end
,	t1.tpload_hp
,	t1.tpload_Crop
,	t1.tpload_Wooded
,	t1.tpload_Open
,	t1.tpload_barren
,	t1.tpload_ldm
,	t1.tpload_MDM
,	t1.tpload_HDM
,	t1.tpload_OtherUp
,	t1.tpload_FarmAn
,	t1.tpload_tiledrain
,	t1.tpload_streambank
,	t1.tpload_subsurface
,	t1.tpload_pointsource
,	t1.tpload_septics
,	t1.tnload_hp
,	t1.tnload_Crop
,	t1.tnload_Wooded
,	t1.tnload_Open
,	t1.tnload_barren
,	t1.tnload_ldm
,	t1.tnload_MDM
,	t1.tnload_HDM
,	t1.tnload_OtherUp
,	t1.tnload_FarmAn
,	t1.tnload_tiledrain
,	t1.tnload_streambank
,	t1.tnload_subsurface
,	t1.tnload_pointsource
,	t1.tnload_septics
,	t1.tssload_hp
,	t1.tssload_Crop
,	t1.tssload_Wooded
,	t1.tssload_Open
,	t1.tssload_barren
,	t1.tssload_ldm
,	t1.tssload_MDM
,	t1.tssload_HDM
,	t1.tssload_OtherUp
,	t1.tssload_tiledrain
,	t1.tssload_streambank

from (
Select
x.comid
,rte2.hydroseq
,rte1.d_comid
,cfs.ShedAreaDrainLake
,
(
	(              coalesce(huc12_out.tpload_hp,0)          *             coalesce(p_hay2011catcomid_x_huc12,0) ) +
	(              coalesce(huc12_out.tpload_Crop,0)        *             coalesce(p_crop2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tpload_Wooded,0)      *             coalesce(p_all_forest2011cat_x_huc12,0)) +
	(              coalesce(huc12_out.tpload_Open,0)        *             coalesce(p_grs2011catcomid_x_huc12)) +
	(              coalesce(huc12_out.tpload_barren,0)      *             coalesce(p_bl2011catcomid_x_huc12,0)  ) +

	-- Changd based on call with BME 10.9.18
	(              coalesce(huc12_out.tpload_ldm,0)         *             coalesce(p_urblo2011catcomid_x_huc12,0)) +

	(              coalesce(huc12_out.tpload_MDM,0)         *             coalesce(p_urbmd2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tpload_HDM,0)         *             coalesce(p_urbhi2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tpload_OtherUp,0)     *             coalesce(p_all_wetland2011cat_x_huc12,0)) +
	(              coalesce(huc12_out.tpload_FarmAn,0)      *             coalesce(p_all_farm2011cat_x_huc12,0)) +
	-- Changd based on call with BME 10.9.18
	(              coalesce(huc12_out.tpload_tiledrain,0)   *             coalesce(p_urbop2011catcomid_x_huc12,0)) +

-- Stream Bank Is Special
-- Added this 10.2.18 based on conversation with BME
-- Smaller models have lower values for streambank
	(              coalesce((huc12_out.tpload_streambank*1.00),0)  *             coalesce(p_catarea_x_huc12,0) * 0.4 ) +
	(              coalesce((huc12_out.tpload_streambank*1.00),0)  *             coalesce(p_imparea_x_huc12,0) * 0.6 ) +
	-- add in 5_22_18
	(              coalesce(huc12_out.tpload_subsurface,0)  *             coalesce(p_tnsumgrnd_x_huc12,0)) +
	(              coalesce(huc12_out.tpload_pointsource,0) *             coalesce(p_pt_kgn_yr_x_huc12,0)) +
	(              coalesce(huc12_out.tpload_septics,0)     *             coalesce(p_all_lowdensity2011cat_x_huc12,0))
) --*   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) ))
as tploadrate_total

,
(
	(              coalesce(huc12_out.tnload_hp,0)          *             coalesce(p_hay2011catcomid_x_huc12,0) ) +
	(              coalesce(huc12_out.tnload_Crop,0)        *             coalesce(p_crop2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tnload_Wooded,0)      *             coalesce(p_all_forest2011cat_x_huc12,0)) +
	(              coalesce(huc12_out.tnload_Open,0)        *             coalesce(p_grs2011catcomid_x_huc12)) +
	(              coalesce(huc12_out.tnload_barren,0)      *             coalesce(p_bl2011catcomid_x_huc12,0)  ) +
--	(              coalesce(huc12_out.tnload_ldm,0)         *             coalesce(p_all_lowdensity2011cat_x_huc12,0)) +
-- Changd based on call with BME 10.9.18
	(              coalesce(huc12_out.tnload_ldm,0)         *             coalesce(p_urblo2011catcomid_x_huc12,0)) +

	(              coalesce(huc12_out.tnload_MDM,0)         *             coalesce(p_urbmd2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tnload_HDM,0)         *             coalesce(p_urbhi2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tnload_OtherUp,0)     *             coalesce(p_all_wetland2011cat_x_huc12,0)) +
	(              coalesce(huc12_out.tnload_FarmAn,0)      *             coalesce(p_all_farm2011cat_x_huc12,0)) +
	-- Changd based on call with BME 10.9.18
	(              coalesce(huc12_out.tnload_tiledrain,0)   *             coalesce(p_urbop2011catcomid_x_huc12,0)) +


-- Stream Bank Is Special
-- Added this 10.2.18 based on conversation with BME
-- Smaller models have lower values for streambank
	(              coalesce((huc12_out.tnload_streambank*1.00),0)  *             coalesce(p_catarea_x_huc12,0) * 0.4 ) +
	(              coalesce((huc12_out.tnload_streambank*1.00),0)  *             coalesce(p_imparea_x_huc12,0) * 0.6 ) +
	-- add in 5_22_18
	(              coalesce(huc12_out.tnload_subsurface,0)  *             coalesce(p_tnsumgrnd_x_huc12,0)) +
	(              coalesce(huc12_out.tnload_pointsource,0) *             coalesce(p_pt_kgn_yr_x_huc12,0)) +
	(              coalesce(huc12_out.tnload_septics,0)     *             coalesce(p_all_lowdensity2011cat_x_huc12,0))
) --*   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) ))
as tnloadrate_total


,
(
	(              coalesce(huc12_out.tssload_hp,0)          *             coalesce(p_hay2011catcomid_x_huc12,0) ) +
	(              coalesce(huc12_out.tssload_Crop,0)        *             coalesce(p_crop2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tssload_Wooded,0)      *             coalesce(p_all_forest2011cat_x_huc12,0)) +
	(              coalesce(huc12_out.tssload_Open,0)        *             coalesce(p_grs2011catcomid_x_huc12)) +
	(              coalesce(huc12_out.tssload_barren,0)      *             coalesce(p_bl2011catcomid_x_huc12,0)  ) +
--	(              coalesce(huc12_out.tssload_ldm,0)         *             coalesce(p_all_lowdensity2011cat_x_huc12,0)) +
-- Changd based on call with BME 10.9.18
	(              coalesce(huc12_out.tssload_ldm,0)         *             coalesce(p_urblo2011catcomid_x_huc12,0)) +

	(              coalesce(huc12_out.tssload_MDM,0)         *             coalesce(p_urbmd2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tssload_HDM,0)         *             coalesce(p_urbhi2011catcomid_x_huc12,0)) +
	(              coalesce(huc12_out.tssload_OtherUp,0)     *             coalesce(p_all_wetland2011cat_x_huc12,0)) +
--	(              coalesce(huc12_out.tssload_FarmAn,0)      *             coalesce(p_all_farm2011cat_x_huc12,0)) +
	--(              coalesce(huc12_out.tssload_tiledrain,0)   *             coalesce(p_catarea_x_huc12,0)) +
	-- Changd based on call with BME 10.9.18
	(              coalesce(huc12_out.tssload_tiledrain,0)   *             coalesce(p_urbop2011catcomid_x_huc12,0)) +


-- Stream Bank Is Special
-- Added this 10.2.18 based on conversation with BME
-- Smaller models have lower values for streambank
	(              coalesce((huc12_out.tssload_streambank * 1.00),0)  *             coalesce(p_catarea_x_huc12,0) * 0.4 ) +
	(              coalesce((huc12_out.tssload_streambank * 1.00),0)  *             coalesce(p_imparea_x_huc12,0) * 0.6 )
	--(              coalesce(huc12_out.tssload_subsurface,0)  *             coalesce(p_catarea_x_huc12,0)) +
	--(              coalesce(huc12_out.tssload_pointsource,0) *             coalesce(p_catarea_x_huc12,0)) +
	--(              coalesce(huc12_out.tssload_septics,0)     *             coalesce(p_catarea_x_huc12,0))
)-- *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) ))
as tssloadrate_total

-- ADD IN ALL THE LOAD SOURCES BY COMID
-- TP
,	(              coalesce(huc12_out.tpload_hp,0)          *             coalesce(p_hay2011catcomid_x_huc12,0) ) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_hp
,	(              coalesce(huc12_out.tpload_Crop,0)        *             coalesce(p_crop2011catcomid_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_Crop
,	(              coalesce(huc12_out.tpload_Wooded,0)      *             coalesce(p_all_forest2011cat_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_Wooded
,	(              coalesce(huc12_out.tpload_Open,0)        *             coalesce(p_grs2011catcomid_x_huc12)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_Open
,	(              coalesce(huc12_out.tpload_barren,0)      *             coalesce(p_bl2011catcomid_x_huc12,0)  ) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_barren
,	(              coalesce(huc12_out.tpload_ldm,0)         *             coalesce(p_urblo2011catcomid_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_ldm

,	(              coalesce(huc12_out.tpload_MDM,0)         *             coalesce(p_urbmd2011catcomid_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_MDM
,	(              coalesce(huc12_out.tpload_HDM,0)         *             coalesce(p_urbhi2011catcomid_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_HDM
,	(              coalesce(huc12_out.tpload_OtherUp,0)     *             coalesce(p_all_wetland2011cat_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_OtherUp
,	(              coalesce(huc12_out.tpload_FarmAn,0)      *             coalesce(p_all_farm2011cat_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_FarmAn
,	(              coalesce(huc12_out.tpload_tiledrain,0)   *             coalesce(p_urbop2011catcomid_x_huc12,0)) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_tiledrain

,	((              coalesce((huc12_out.tpload_streambank*1.00),0)  *             coalesce(p_catarea_x_huc12,0) * 0.4 ) +
	(              coalesce((huc12_out.tpload_streambank*1.00),0)  *             coalesce(p_imparea_x_huc12,0) * 0.6 )) *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_streambank

,	(              coalesce(huc12_out.tpload_subsurface,0)  *             coalesce(p_tnsumgrnd_x_huc12,0))*   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_subsurface
,	(              coalesce(huc12_out.tpload_pointsource,0) *             coalesce(p_pt_kgn_yr_x_huc12,0))*   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_pointsource
,	(              coalesce(huc12_out.tpload_septics,0)     *             coalesce(p_all_lowdensity2011cat_x_huc12,0))*   ( 1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_septics

-- TN
,	(              coalesce(huc12_out.tnload_hp,0)          *             coalesce(p_hay2011catcomid_x_huc12,0) )  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_hp
,	(              coalesce(huc12_out.tnload_Crop,0)        *             coalesce(p_crop2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_Crop
,	(              coalesce(huc12_out.tnload_Wooded,0)      *             coalesce(p_all_forest2011cat_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_Wooded
,	(              coalesce(huc12_out.tnload_Open,0)        *             coalesce(p_grs2011catcomid_x_huc12))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_Open
,	(              coalesce(huc12_out.tnload_barren,0)      *             coalesce(p_bl2011catcomid_x_huc12,0)  )  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_barren
,	(              coalesce(huc12_out.tnload_ldm,0)         *             coalesce(p_urblo2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_ldm

,	(              coalesce(huc12_out.tnload_MDM,0)         *             coalesce(p_urbmd2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_MDM
,	(              coalesce(huc12_out.tnload_HDM,0)         *             coalesce(p_urbhi2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_HDM
,	(              coalesce(huc12_out.tnload_OtherUp,0)     *             coalesce(p_all_wetland2011cat_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_OtherUp
,	(              coalesce(huc12_out.tnload_FarmAn,0)      *             coalesce(p_all_farm2011cat_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_FarmAn
,	(              coalesce(huc12_out.tnload_tiledrain,0)   *             coalesce(p_urbop2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_tiledrain

,	((              coalesce((huc12_out.tnload_streambank*1.00),0)  *             coalesce(p_catarea_x_huc12,0) * 0.4 ) +
	(              coalesce((huc12_out.tnload_streambank*1.00),0)  *             coalesce(p_imparea_x_huc12,0) * 0.6 ))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_streambank
	-- add in 5_22_18
,	(              coalesce(huc12_out.tnload_subsurface,0)  *             coalesce(p_tnsumgrnd_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_subsurface
,	(              coalesce(huc12_out.tnload_pointsource,0) *             coalesce(p_pt_kgn_yr_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_pointsource
,	(              coalesce(huc12_out.tnload_septics,0)     *             coalesce(p_all_lowdensity2011cat_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_septics

-- TSS
,	(              coalesce(huc12_out.tssload_hp,0)          *             coalesce(p_hay2011catcomid_x_huc12,0) )  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_hp
,	(              coalesce(huc12_out.tssload_Crop,0)        *             coalesce(p_crop2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_Crop
,	(              coalesce(huc12_out.tssload_Wooded,0)      *             coalesce(p_all_forest2011cat_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_Wooded
,	(              coalesce(huc12_out.tssload_Open,0)        *             coalesce(p_grs2011catcomid_x_huc12))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_Open
,	(              coalesce(huc12_out.tssload_barren,0)      *             coalesce(p_bl2011catcomid_x_huc12,0)  )  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_barren
,	(              coalesce(huc12_out.tssload_ldm,0)         *             coalesce(p_urblo2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_ldm

,	(              coalesce(huc12_out.tssload_MDM,0)         *             coalesce(p_urbmd2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_MDM
,	(              coalesce(huc12_out.tssload_HDM,0)         *             coalesce(p_urbhi2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_HDM
,	(              coalesce(huc12_out.tssload_OtherUp,0)     *             coalesce(p_all_wetland2011cat_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_OtherUp
,	(              coalesce(huc12_out.tssload_tiledrain,0)   *             coalesce(p_urbop2011catcomid_x_huc12,0))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_tiledrain

,	((              coalesce((huc12_out.tssload_streambank * 1.00),0)  *             coalesce(p_catarea_x_huc12,0) * 0.4 ) +
	(              coalesce((huc12_out.tssload_streambank * 1.00),0)  *             coalesce(p_imparea_x_huc12,0) * 0.6 ))  *   ( 1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_streambank

From
                wikiwtershed.nhdplus_x_huc12 x

                join
                huc12_out
                on x.huc12 = huc12_out.huc12

                join
                wikiwtershed.cache_nhdcoefs_2019 cfs
                on x.comid = cfs.comid

                join
                wikiwtershed.comid_routing rte1
                ON x.comid=rte1.comid

                join
                wikiwtershed.nhdplus_stream_nsidx rte2
                ON x.comid=rte2.comid
) as t1

left join (
			select distinct comid_rest
			,sum(tn_reduced_kg) OVER (PARTITION BY comid_rest) as tn_reduced_kg
			,sum(tp_reduced_kg) OVER (PARTITION BY comid_rest) as tp_reduced_kg
			,sum(tss_reduced_kg) OVER (PARTITION BY comid_rest) as tss_reduced_kg
			from datapolassess.fd_api_restoration_lbsreduced_comid
			where source = ANY (restoration_sources::text[])
		--('Delaware River Operational Fund', 'Delaware Watershed Conservation Fund', 'Delaware River Restoration Fund', 'PADEP', 'NJDEP', 'Delaware River Watershed Protection Fund - Forestland Capital Grants', 'Delaware River Watershed Protection Fund - Transaction Grants')
) as rest
on t1.comid = rest.comid_rest

left join (
			select distinct comid_prot
			,sum(tn_avoided_kg) OVER (PARTITION BY comid_prot) as tn_avoided_kg
			,sum(tp_avoided_kg) OVER (PARTITION BY comid_prot) as tp_avoided_kg
			,sum(tss_avoided_kg) OVER (PARTITION BY comid_prot) as tss_avoided_kg
			from datapolassess.fd_api_protection_lbsavoided_comid
			where source = ANY (restoration_sources::text[])
		--('Delaware River Operational Fund', 'Delaware Watershed Conservation Fund', 'Delaware River Restoration Fund', 'PADEP', 'NJDEP', 'Delaware River Watershed Protection Fund - Forestland Capital Grants', 'Delaware River Watershed Protection Fund - Transaction Grants')
) as prot
on t1.comid = prot.comid_prot

;


-- Set the upstream equal to the total before you start


update nhdplus_out
set
	tnloadrate_total_ups = tnloadrate_total,
	tploadrate_total_ups = tploadrate_total,
	tssloadrate_total_ups = tssloadrate_total,

-- ADD IN ALL THE LOAD SOURCES BY COMID

	tpload_hp_ups = nhdplus_out.tpload_hp,
	tpload_Crop_ups = nhdplus_out.tpload_Crop,
	tpload_Wooded_ups = nhdplus_out.tpload_Wooded,
	tpload_Open_ups = nhdplus_out.tpload_Open,
	tpload_barren_ups = nhdplus_out.tpload_barren,
	tpload_ldm_ups = nhdplus_out.tpload_ldm,
	tpload_MDM_ups = nhdplus_out.tpload_MDM,
	tpload_HDM_ups = nhdplus_out.tpload_HDM,
	tpload_OtherUp_ups = nhdplus_out.tpload_OtherUp,
	tpload_FarmAn_ups = nhdplus_out.tpload_FarmAn,
	tpload_tiledrain_ups = nhdplus_out.tpload_tiledrain,
	tpload_streambank_ups = nhdplus_out.tpload_streambank,
	tpload_subsurface_ups = nhdplus_out.tpload_subsurface,
	tpload_pointsource_ups = nhdplus_out.tpload_pointsource,
	tpload_septics_ups = nhdplus_out.tpload_septics,

	tnload_hp_ups = nhdplus_out.tnload_hp,
	tnload_crop_ups = nhdplus_out.tnload_crop,
	tnload_wooded_ups = nhdplus_out.tnload_wooded,
	tnload_open_ups = nhdplus_out.tnload_open,
	tnload_barren_ups = nhdplus_out.tnload_barren,
	tnload_ldm_ups = nhdplus_out.tnload_ldm,
	tnload_mdm_ups = nhdplus_out.tnload_mdm,
	tnload_hdm_ups = nhdplus_out.tnload_hdm,
	tnload_otherup_ups = nhdplus_out.tnload_otherup,
	tnload_farman_ups = nhdplus_out.tnload_farman,
	tnload_tiledrain_ups = nhdplus_out.tnload_tiledrain,
	tnload_streambank_ups = nhdplus_out.tnload_streambank,
	tnload_subsurface_ups = nhdplus_out.tnload_subsurface,
	tnload_pointsource_ups = nhdplus_out.tnload_pointsource,
	tnload_septics_ups = nhdplus_out.tnload_septics,

	tssload_hp_ups = nhdplus_out.tssload_hp,
	tssload_crop_ups = nhdplus_out.tssload_crop,
	tssload_wooded_ups = nhdplus_out.tssload_wooded,
	tssload_open_ups = nhdplus_out.tssload_open,
	tssload_barren_ups = nhdplus_out.tssload_barren,
	tssload_ldm_ups = nhdplus_out.tssload_ldm,
	tssload_mdm_ups = nhdplus_out.tssload_mdm,
	tssload_hdm_ups = nhdplus_out.tssload_hdm,
	tssload_otherup_ups = nhdplus_out.tssload_otherup,
	tssload_tiledrain_ups = nhdplus_out.tssload_tiledrain,
	tssload_streambank  = nhdplus_out.tssload_streambank

	;


Update nhdplus_out as old
Set
     areasqkm 	= new.areasqkm
From wikiwtershed.nhdplus_stream_nsidx new
where old.comid = new.comid;
-- Push It Down the tree for every Row..
--

Update nhdplus_out as old
Set
     totdasqkm 	= new.totdasqkm
From wikiwtershed.nhdplus_totdasqkm new
where old.comid = new.comid;
-- Push It Down the tree for every Row..
--



do
$$
declare _r record;
begin
  for _r in ( select * from nhdplus_out order by hydroseq desc ) loop
    -- Push Down
    Update nhdplus_out old
	Set
		 tnloadrate_total_ups = (  tnloadrate_total_ups + Coalesce( tn_plus,0) )
		,tploadrate_total_ups = (  tploadrate_total_ups + Coalesce( tp_plus,0) )
		,tssloadrate_total_ups= ( tssloadrate_total_ups + Coalesce(tss_plus,0) )

-- ADD IN ALL THE LOAD SOURCES BY COMID

			,tpload_hp_ups = (  tpload_hp_ups + Coalesce( tpload_hp_plus,0) )
			,tpload_Crop_ups = (  tpload_Crop_ups + Coalesce( tpload_Crop_plus,0) )
			,tpload_Wooded_ups = (  tpload_Wooded_ups + Coalesce( tpload_Wooded_plus,0) )
			,tpload_Open_ups = (  tpload_Open_ups + Coalesce( tpload_Open_plus,0) )
			,tpload_barren_ups = (  tpload_barren_ups + Coalesce( tpload_barren_plus,0) )
			,tpload_ldm_ups = (  tpload_ldm_ups + Coalesce( tpload_ldm_plus,0) )
			,tpload_MDM_ups = (  tpload_MDM_ups + Coalesce( tpload_MDM_plus,0) )
			,tpload_HDM_ups = (  tpload_HDM_ups + Coalesce( tpload_HDM_plus,0) )
			,tpload_OtherUp_ups = (  tpload_OtherUp_ups + Coalesce( tpload_OtherUp_plus,0) )
			,tpload_FarmAn_ups = (  tpload_FarmAn_ups + Coalesce( tpload_FarmAn_plus,0) )
			,tpload_tiledrain_ups = (  tpload_tiledrain_ups + Coalesce( tpload_tiledrain_plus,0) )
			,tpload_streambank_ups = (  tpload_streambank_ups + Coalesce( tpload_streambank_plus,0) )
			,tpload_subsurface_ups = (  tpload_subsurface_ups + Coalesce( tpload_subsurface_plus,0) )
			,tpload_pointsource_ups = (  tpload_pointsource_ups + Coalesce( tpload_pointsource_plus,0) )
			,tpload_septics_ups = (  tpload_septics_ups + Coalesce( tpload_septics_plus,0) )

			,tnload_hp_ups = (  tnload_hp_ups + Coalesce( tnload_hp_plus,0) )
			,tnload_crop_ups = (  tnload_crop_ups + Coalesce( tnload_crop_plus,0) )
			,tnload_wooded_ups = (  tnload_wooded_ups + Coalesce( tnload_wooded_plus,0) )
			,tnload_open_ups = (  tnload_open_ups + Coalesce( tnload_open_plus,0) )
			,tnload_barren_ups = (  tnload_barren_ups + Coalesce( tnload_barren_plus,0) )
			,tnload_ldm_ups = (  tnload_ldm_ups + Coalesce( tnload_ldm_plus,0) )
			,tnload_mdm_ups = (  tnload_mdm_ups + Coalesce( tnload_mdm_plus,0) )
			,tnload_hdm_ups = (  tnload_hdm_ups + Coalesce( tnload_hdm_plus,0) )
			,tnload_otherup_ups = (  tnload_otherup_ups + Coalesce( tnload_otherup_plus,0) )
			,tnload_farman_ups = (  tnload_farman_ups + Coalesce( tnload_farman_plus,0) )
			,tnload_tiledrain_ups = (  tnload_tiledrain_ups + Coalesce( tnload_tiledrain_plus,0) )
			,tnload_streambank_ups = (  tnload_streambank_ups + Coalesce( tnload_streambank_plus,0) )
			,tnload_subsurface_ups = (  tnload_subsurface_ups + Coalesce( tnload_subsurface_plus,0) )
			,tnload_pointsource_ups = (  tnload_pointsource_ups + Coalesce( tnload_pointsource_plus,0) )
			,tnload_septics_ups = (  tnload_septics_ups + Coalesce( tnload_septics_plus,0) )

			,tssload_hp_ups = (  tssload_hp_ups + Coalesce( tssload_hp_plus,0) )
			,tssload_crop_ups = (  tssload_crop_ups + Coalesce( tssload_crop_plus,0) )
			,tssload_wooded_ups = (  tssload_wooded_ups + Coalesce( tssload_wooded_plus,0) )
			,tssload_open_ups = (  tssload_open_ups + Coalesce( tssload_open_plus,0) )
			,tssload_barren_ups = (  tssload_barren_ups + Coalesce( tssload_barren_plus,0) )
			,tssload_ldm_ups = (  tssload_ldm_ups + Coalesce( tssload_ldm_plus,0) )
			,tssload_mdm_ups = (  tssload_mdm_ups + Coalesce( tssload_mdm_plus,0) )
			,tssload_hdm_ups = (  tssload_hdm_ups + Coalesce( tssload_hdm_plus,0) )
			,tssload_otherup_ups = (  tssload_otherup_ups + Coalesce( tssload_otherup_plus,0) )
			,tssload_tiledrain_ups = (  tssload_tiledrain_ups + Coalesce( tssload_tiledrain_plus,0) )
			,tssload_streambank  = (  tssload_streambank + Coalesce( tssload_streambank_plus,0) )


		,areasqkm	  = old.areasqkm + new.areasqkm
    From (
		Select
			 tnloadrate_total_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tn_plus
			,tploadrate_total_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tp_plus
			,tssloadrate_total_ups * (1 - ( (ShedAreaDrainLake/100) * (select tss from wikiwtershed.retetion_factors) )) as tss_plus

-- ADD IN ALL THE LOAD SOURCES BY COMID

			,tpload_hp_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_hp_plus
			,tpload_Crop_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_Crop_plus
			,tpload_Wooded_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_Wooded_plus
			,tpload_Open_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_Open_plus
			,tpload_barren_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_barren_plus
			,tpload_ldm_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_ldm_plus
			,tpload_MDM_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_MDM_plus
			,tpload_HDM_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_HDM_plus
			,tpload_OtherUp_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_OtherUp_plus
			,tpload_FarmAn_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_FarmAn_plus
			,tpload_tiledrain_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_tiledrain_plus
			,tpload_streambank_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_streambank_plus
			,tpload_subsurface_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_subsurface_plus
			,tpload_pointsource_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_pointsource_plus
			,tpload_septics_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tp from wikiwtershed.retetion_factors) )) as tpload_septics_plus

			,tnload_hp_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_hp_plus
			,tnload_crop_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_crop_plus
			,tnload_wooded_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_wooded_plus
			,tnload_open_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_open_plus
			,tnload_barren_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_barren_plus
			,tnload_ldm_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_ldm_plus
			,tnload_mdm_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_mdm_plus
			,tnload_hdm_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_hdm_plus
			,tnload_otherup_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_otherup_plus
			,tnload_farman_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_farman_plus
			,tnload_tiledrain_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_tiledrain_plus
			,tnload_streambank_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_streambank_plus
			,tnload_subsurface_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_subsurface_plus
			,tnload_pointsource_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_pointsource_plus
			,tnload_septics_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tn from wikiwtershed.retetion_factors) )) as tnload_septics_plus

			,tssload_hp_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_hp_plus
			,tssload_crop_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_crop_plus
			,tssload_wooded_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_wooded_plus
			,tssload_open_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_open_plus
			,tssload_barren_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_barren_plus
			,tssload_ldm_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_ldm_plus
			,tssload_mdm_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_mdm_plus
			,tssload_hdm_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_hdm_plus
			,tssload_otherup_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_otherup_plus
			,tssload_tiledrain_ups  * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_tiledrain_plus
			,tssload_streambank   * (1 - ( (ShedAreaDrainLake/100) * (select  tss from wikiwtershed.retetion_factors) )) as tssload_streambank_plus

	                ,areasqkm
		From nhdplus_out
		where comid = _r.comid
	 ) new
    Where old.comid = _r.d_comid;


  end loop;
end;
$$
;


-- convert to cubic feet multiple times seconds in a year
-- 31557600 (365.25*24*60*60)
-- 28.3168 liters in a cubic foot
-- 1000000 mg in kg

Update
	nhdplus_out old
	Set

		tp_conc  = ( tploadrate_total_ups  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
		tn_conc  = ( tnloadrate_total_ups  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
		tss_conc = ( tssloadrate_total_ups * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_hp = ( coalesce(tpload_hp_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_hp = ( coalesce(tnload_hp_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_hp = ( coalesce(tssload_hp_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_Crop  = ( coalesce(tpload_crop_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_Crop  = ( coalesce(tnload_crop_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_Crop  = ( coalesce(tssload_crop_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_Wooded  = ( coalesce(tpload_wooded_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_Wooded  = ( coalesce(tnload_wooded_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_Wooded  = ( coalesce(tssload_wooded_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_Open  = ( coalesce(tpload_open_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_Open  = ( coalesce(tnload_open_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_Open  = ( coalesce(tssload_open_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_barren  = ( coalesce(tpload_barren_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_barren  = ( coalesce(tnload_barren_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_barren  = ( coalesce(tssload_barren_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_ldm  = ( coalesce(tpload_ldm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_ldm  = ( coalesce(tnload_ldm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_ldm  = ( coalesce(tssload_ldm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_MDM  = ( coalesce(tpload_mdm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_MDM  = ( coalesce(tnload_mdm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_MDM  = ( coalesce(tssload_mdm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_HDM  = ( coalesce(tpload_hdm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_HDM  = ( coalesce(tnload_hdm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_HDM  = ( coalesce(tssload_hdm_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_OtherUp  = ( coalesce(tpload_otherup_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_OtherUp  = ( coalesce(tnload_otherup_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_OtherUp  = ( coalesce(tssload_otherup_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_FarmAn  = ( coalesce(tpload_FarmAn_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_FarmAn  = ( coalesce(tnload_FarmAn_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_tiledrain  = ( coalesce(tpload_tiledrain_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_tiledrain  = ( coalesce(tnload_tiledrain_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_tiledrain  = ( coalesce(tssload_tiledrain_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_streambank  = ( coalesce(tpload_streambank_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_streambank  = ( coalesce(tnload_streambank_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tssconc_streambank  = ( coalesce(tssload_streambank_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_subsurface  = ( coalesce(tpload_subsurface_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_subsurface  = ( coalesce(tnload_subsurface_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

	  tpconc_septics  = ( coalesce(tpload_septics_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
	  tnconc_septics  = ( coalesce(tnload_septics_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),

		tnconc_ptsource = ( coalesce(tpload_pointsource_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 ),
		tpconc_ptsource = ( coalesce(tnload_pointsource_ups,0.0)  * 1000000 ) / ( new.qe_ma * 31557600 * 28.3168 )

From wikiwtershed.cache_nhdcoefs_2019 new
Where new.comid = old.comid
	And
		--( totdasqkm between (areasqkm * 0.95) And (areasqkm * 1.05) )
		( totdasqkm > (areasqkm * 0.95)) And ( totdasqkm < (areasqkm * 1.05))
	And
		new.qe_ma > 0;
		-- This gives us a 5 percent fudge factor on the upstream s
set enable_seqscan = on;

update
	nhdplus_out old
	set maflowv = new.qe_ma
From wikiwtershed.cache_nhdcoefs_2019 new
Where new.comid = old.comid ;

-- Check values For Area

Return Query
Select
	comid,
	tploadrate_total,  tp_conc,
	--totdasqkm, areasqkm,

	tnloadrate_total,  tn_conc,
	tssloadrate_total, tss_conc,

	-- ADD IN ALL THE LOAD SOURCES BY COMID

	nhdplus_out.tpload_hp,
	nhdplus_out.tpload_Crop,
	nhdplus_out.tpload_Wooded,
	nhdplus_out.tpload_Open,
	nhdplus_out.tpload_barren,
	nhdplus_out.tpload_ldm,
	nhdplus_out.tpload_MDM,
	nhdplus_out.tpload_HDM,
	nhdplus_out.tpload_OtherUp,
	nhdplus_out.tpload_FarmAn,
	nhdplus_out.tpload_tiledrain,
	nhdplus_out.tpload_streambank,
	nhdplus_out.tpload_subsurface,
	nhdplus_out.tpload_pointsource,
	nhdplus_out.tpload_septics,

	nhdplus_out.tnload_hp,
	nhdplus_out.tnload_crop,
	nhdplus_out.tnload_wooded,
	nhdplus_out.tnload_open,
	nhdplus_out.tnload_barren,
	nhdplus_out.tnload_ldm,
	nhdplus_out.tnload_mdm,
	nhdplus_out.tnload_hdm,
	nhdplus_out.tnload_otherup,
	nhdplus_out.tnload_farman,
	nhdplus_out.tnload_tiledrain,
	nhdplus_out.tnload_streambank,
	nhdplus_out.tnload_subsurface,
	nhdplus_out.tnload_pointsource,
	nhdplus_out.tnload_septics,

	nhdplus_out.tssload_hp,
	nhdplus_out.tssload_crop,
	nhdplus_out.tssload_wooded,
	nhdplus_out.tssload_open,
	nhdplus_out.tssload_barren,
	nhdplus_out.tssload_ldm,
	nhdplus_out.tssload_mdm,
	nhdplus_out.tssload_hdm,
	nhdplus_out.tssload_otherup,
	nhdplus_out.tssload_tiledrain,
	nhdplus_out.tssload_streambank,

	-- ADD In New Columns
  nhdplus_out.tpconc_hp,
  nhdplus_out.tnconc_hp,
  nhdplus_out.tssconc_hp,
  nhdplus_out.tpconc_Crop ,
  nhdplus_out.tnconc_Crop ,
  nhdplus_out.tssconc_Crop ,
  nhdplus_out.tpconc_Wooded ,
  nhdplus_out.tnconc_Wooded ,
  nhdplus_out.tssconc_Wooded ,
  nhdplus_out.tpconc_Open ,
  nhdplus_out.tnconc_Open ,
  nhdplus_out.tssconc_Open ,
  nhdplus_out.tpconc_barren ,
  nhdplus_out.tnconc_barren ,
  nhdplus_out.tssconc_barren ,
  nhdplus_out.tpconc_ldm ,
  nhdplus_out.tnconc_ldm ,
  nhdplus_out.tssconc_ldm ,
  nhdplus_out.tpconc_MDM ,
  nhdplus_out.tnconc_MDM ,
  nhdplus_out.tssconc_MDM ,
  nhdplus_out.tpconc_HDM ,
  nhdplus_out.tnconc_HDM ,
  nhdplus_out.tssconc_HDM ,
  nhdplus_out.tpconc_OtherUp ,
  nhdplus_out.tnconc_OtherUp ,
  nhdplus_out.tssconc_OtherUp ,
  nhdplus_out.tpconc_FarmAn ,
  nhdplus_out.tnconc_FarmAn ,
  nhdplus_out.tpconc_tiledrain ,
  nhdplus_out.tnconc_tiledrain ,
  nhdplus_out.tssconc_tiledrain ,
  nhdplus_out.tpconc_streambank ,
  nhdplus_out.tnconc_streambank ,
  nhdplus_out.tssconc_streambank ,
  nhdplus_out.tpconc_subsurface ,
  nhdplus_out.tnconc_subsurface ,
  nhdplus_out.tpconc_septics ,
  nhdplus_out.tnconc_septics ,
  nhdplus_out.tpconc_ptsource,
  nhdplus_out.tnconc_ptsource,

	nhdplus_out.maflowv

From nhdplus_out;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION wikiwtershed.srat_nhd_nlcd2019_restoration_protection(character varying[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], double precision[], text[], boolean[])
  OWNER TO mikec;
