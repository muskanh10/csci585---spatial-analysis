
CREATE EXTENSION IF NOT EXISTS postgis;

SELECT PostGIS_Version();

CREATE TABLE LOCATIONS (name varchar(25), coord geometry);

INSERT INTO LOCATIONS (name, coord) VALUES
    ('Leavey', ST_GeomFromText('POINT(-118.2829617 34.0217565)', 4326)),
    ('SEL', ST_GeomFromText('POINT(-118.2888411 34.0196256)', 4326)),
    ('Doheny', ST_GeomFromText('POINT(-118.2841768 34.0203371)', 4326)),
    ('Cafe Annenberg', ST_GeomFromText('POINT(-118.2872641 34.0207431)', 4326)),
    ('Tutor hall cafe', ST_GeomFromText('POINT(-118.2899143 34.0200275)', 4326)),
    ('Rock and Reilly', ST_GeomFromText('POINT(-118.2841415 34.0242538)', 4326)),
    ('Fountain 1', ST_GeomFromText('POINT(-118.2861019 34.0204255)', 4326)),
    ('Fountain 2', ST_GeomFromText('POINT(-118.2909055 34.0190061)', 4326)),
    ('Fountain 3', ST_GeomFromText('POINT(-118.2853235 34.025183)', 4326)),
    ('Annenberg', ST_GeomFromText('POINT(-118.2864837 34.0221893)', 4326)),
    ('Cinematic arts', ST_GeomFromText('POINT(-118.2860399 34.0229895)', 4326)),
    ('Dramatic arts', ST_GeomFromText('POINT(-118.2872756 34.0247834)', 4326)),
    ('Home', ST_GeomFromText('POINT(-118.2799864 34.0280492)', 4326));

SELECT ST_AsText(ST_ConvexHull(ST_Collect(coord))) FROM LOCATIONS;

SELECT name, ST_Astext(coord), ST_Distance(coord, ST_GeomFromText('POINT(-118.2799864 34.0280492)', 4326)) as Dist
FROM LOCATIONS
WHERE name != 'Home'
ORDER BY Dist
LIMIT 4;
