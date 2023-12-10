CREATE TABLE IF NOT EXISTS zipcodes (
   id INTEGER,
   zipcode INTEGER,
   geometry geometry(POLYGON,-1),
);

CREATE TABLE IF NOT EXISTS nyc311s (
   id INTEGER,
   created_date DATETIME,
   complaint_type VARCHAR,
   zipcode INTEGER,
   geometry geometry(POINT,4326),
);

CREATE TABLE IF NOT EXISTS trees (
   id INTEGER,
   created_at DATETIME,
   tree_id VARCHAR,
   health VARCHAR,
   status VARCHAR,
   spc_common VARCHAR,
   zipcode INTEGER,
   geometry geometry(POINT,4326),
);

CREATE TABLE IF NOT EXISTS zillow_datas (
   id INTEGER,
   zipcode INTEGER,
   date DATETIME,
   rent FLOAT,
);

