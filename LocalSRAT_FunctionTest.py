import json
import psycopg2
from StringParser import StringParser
from DatabaseAdapter import DatabaseAdapter
from DatabaseFormatter import DatabaseFormatter


# CREATE A COUPLE HELPER FUNCTIONS TO RUN THE MICROSERVICE
def respond(err, res=None):
    return {
        'statusCode': '400' if err else '200',
        'body': err.args[0] if err else json.dumps(res),
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
    }

def lambda_handler(event, context):
    try:
        data = StringParser.parse(event['body'])
        db = DatabaseAdapter(_database[0], _user[0], _host[0], _port, _password[0], _flag)
        input_array = DatabaseAdapter.python_to_array(data)
        print(data[0]["with_concentration"])
        try:
            rest_sources = data[0]["restoration_sources"]
            with_conc = data[0]["with_concentration"]
        except:
            rest_sources = None
            with_conc = None

        return respond(None, db.run_model(input_array))
    except AttributeError as e:
        return respond(e)


# GET THE DATABASE CONFIG INFORMATION USING A CONFIG FILE.
# THE FILE IS IN THE GITIGNORE SO WILL REQUIRE BEING SENT VIA EMAIL.

config_file = json.load(open('db_config.json'))
PG_CONFIG = config_file['PG_CONFIG']

_host = PG_CONFIG['host'],
_database = PG_CONFIG['database'],
_user = PG_CONFIG['user'],
_password = PG_CONFIG['password'],
_port = PG_CONFIG['port']

# Create connection to database using `psycopg2`
_PG_Connection = psycopg2.connect(
        host=PG_CONFIG['host'],
        database=PG_CONFIG['database'],
        user=PG_CONFIG['user'],
        password=PG_CONFIG['password'],
        port=PG_CONFIG['port'])

# GET THE MODELED LOADS FROM THE DRWI DATABASE, DERIVED FROM MMW MODEL RUNS
_PG_Connection.set_isolation_level(0)
_cur = _PG_Connection.cursor()
# _cur.execute("select * from databmpapi.drb_loads_raw order by huc12;")
_cur.execute("select * from databmpapi.drb_loads_raw where huc12 in ('020402030902', '020402030901');")

_dbdata = _cur.fetchall()

# Prepare the input payload body for the MicroService request
_body = DatabaseFormatter.parse(_dbdata)
_body = eval(json.loads(json.dumps(_body)))
for huc12 in _body:
    huc12["restoration_sources"] = ["Delaware River Operational Fund", "Delaware Watershed Conservation Fund",
                                    "Delaware River Restoration Fund", "PADEP", "NJDEP"]
    # huc12["restoration_sources"] = ["Delaware River Operational Fund", "Delaware Watershed Conservation Fund",
    #                                 "Delaware River Restoration Fund"]
    # huc12["restoration_sources"] = ["PADEP", "NJDEP"]
    huc12["with_concentration"] = True
_body = json.dumps(_body)
# print(_body)

_flag = 'base'

# RUN THE HUC12s THROUGH THE MICROSERVICE
_r = dict(lambda_handler({"body": _body},None))
# print(_r)

# Extract the NHD Loads from the response
nhdloads = dict(json.loads(_r['body']))['huc12s']

# Explore selection of data for a HUC12
print(dict(json.loads(_r['body']))['huc12s']['020402030902']['catchments'])




