import psycopg2
from constants import huc12_column_numbers
from constants import huc12_returned_column_numbers
from constants import comid_column_numbers
from constants import comid_returned_column_numbers


class DatabaseMakeTable:
    def __init__(self, db_in, user_in, host_in, port_in, password_in, table_name_in):
        try:
            self.conn = psycopg2.connect(database=db_in, user=user_in, host=host_in, port=port_in, password=password_in)
        except psycopg2.OperationalError as e:
            raise AttributeError("unable to connect to datbase")
        try:
            if table_name_in is None:
                self.table_name_in = 'base'
            else:
                self.table_name_in = table_name_in
        except Exception as e:
            raise print('No flag for base vs BMPs added in given, defaulting to base routine.')

    def make_table(self):
        cur = self.conn.cursor()
        drop_table = 'drop table if exists wikiwtershedoutputs.{};'.format(self.table_name_in)
        create_table = 'create table wikiwtershedoutputs.{}' \
                       '(comid int,tploadrate_total numeric(20,4),tploadate_conc numeric(20,4),tnloadrate_total numeric(20,4),' \
                       'tnloadate_conc numeric(20,4),tssloadrate_total numeric(20,4),tssloadate_conc numeric(20,4),' \
                       'catchment_hectares numeric(20,4),watershed_hectares numeric(20,4),tploadrate_total_ws numeric(20,4),' \
                       'tnloadrate_total_ws numeric(20,4),tssloadrate_total_ws numeric(20,4),maflowv numeric(20,4),' \
                       'geom geometry(MultiLineStringZM,32618),geom_catchment geometry(multipolygon,32618),cluster character varying(50),' \
                       'fa_name character varying(50),sub_focusarea smallint,nord integer,nordstop integer, huc12 varchar(12));'.format(self.table_name_in)
        add_pkey = 'alter table wikiwtershedoutputs.{} add constraint pk_{} primary key (comid);'.format(self.table_name_in, self.table_name_in)
        grant_select = 'grant select on wikiwtershedoutputs.{} to srat_select;'.format(self.table_name_in)
        create_trigger = 'CREATE OR REPLACE FUNCTION update_{}_geom() RETURNS trigger AS $BODY$ BEGIN ' \
                      'new.geom := a.geom from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'new.geom_catchment := a.catchment from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'new.maflowv := a.qe_ma from wikiwtershed.cache_nhdcoefs a where a.comid = new.comid;' \
                      'new.watershed_hectares := a.totdasqkm*100.0 from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'new.catchment_hectares := ST_AREA(a.catchment)/10000.0 from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'new.tploadrate_total_ws := case when new.maflowv >= 0 then ((new.tploadate_conc * 28.3168 * 31557600 / 1000000) * new.maflowv) / new.watershed_hectares else -9999 end;' \
                      'new.tnloadrate_total_ws := case when new.maflowv >= 0 then ((new.tnloadate_conc * 28.3168 * 31557600 / 1000000) * new.maflowv) / new.watershed_hectares else -9999 end;' \
                      'new.tssloadrate_total_ws := case when new.maflowv >= 0 then ((new.tssloadate_conc * 28.3168 * 31557600 / 1000000) * new.maflowv) / new.watershed_hectares else -9999 end;' \
                      'new.cluster := a.cluster from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'new.fa_name := a.name from datadrwi.focusareas_p2plus_pp a where a.comid = new.comid and a.phase like \'Phase 2 Plus\' and a.cluster like new.cluster limit 1;' \
                      'new.sub_focusarea := a.sub_focusarea from datadrwi.focusareas_p2plus_pp a where a.comid = new.comid and a.phase like \'Phase 2 Plus\' and a.cluster like new.cluster and a.name like new.fa_name limit 1;' \
                      'new.nord := a.nord from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'new.nordstop := a.nordstop from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'new.huc12 := a.huc12 from spatial.nhdplus_maregion a where a.comid = new.comid;' \
                      'RETURN new; END; $BODY$ LANGUAGE plpgsql;'.format(self.table_name_in)
        add_trigger = 'CREATE TRIGGER {}_trigger_geom_insert BEFORE INSERT ON wikiwtershedoutputs.{} FOR EACH ROW ' \
                      'EXECUTE PROCEDURE update_{}_geom();'.format(self.table_name_in, self.table_name_in, self.table_name_in)
        cur.execute(drop_table)
        cur.execute(create_table)
        cur.execute(add_pkey)
        cur.execute(grant_select)
        cur.execute(create_trigger)
        cur.execute(add_trigger)
        self.conn.commit()
        return print('Table Created')
