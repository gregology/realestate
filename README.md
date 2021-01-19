# README

A property monitoring app

## DB setup

### Dev

```
CREATE DATABASE realestate_development;
CREATE USER realestate_development WITH PASSWORD 'password';
ALTER USER realestate_development WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE "realestate_development" to realestate_development;
```

```
CREATE DATABASE realestate_test;
CREATE USER realestate_test WITH PASSWORD 'password';
ALTER USER realestate_test WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE "realestate_test" to realestate_test;
```

`brails generate scenic:view properties`

### Regions

#### Create

```
SELECT ST_GeomFromKML('
		<Polygon>
			<tessellate>1</tessellate>
			<outerBoundaryIs>
				<LinearRing>
					<coordinates>
						-77.25022891511702,43.85641397371344,0 -77.16867437563201,43.8212562688399,0 -77.11490202759302,43.82374344318048,0 -77.04255707553263,43.84741075770832,0 -77.00672138289923,43.8666710697511,0 -76.96626039070019,43.88444968753872,0 -76.93728295202904,43.89387269323177,0 -76.87937402646641,43.90285990509671,0 -76.82514768967469,43.92051934214746,0 -76.7901816711978,43.93682251415988,0 -76.78344050771436,43.94604628275817,0 -76.79030249401976,43.96272637818038,0 -76.80352174078382,43.96887577147201,0 -76.8441065557014,43.97516160305875,0 -76.90089723183456,43.96718651197304,0 -76.955607391591,43.96250570346344,0 -76.99726565897871,43.95355844002144,0 -77.02792805498228,43.93458253094532,0 -77.05337142557062,43.91096353680949,0 -77.14501408697674,43.88592048317948,0 -77.19723394301671,43.88312905622368,0 -77.25022891511702,43.85641397371344,0
					</coordinates>
				</LinearRing>
			</outerBoundaryIs>
		</Polygon>
')
```

```
INSERT INTO regions(title, area, created_at, updated_at)
VALUES ('Southern PEC',
    ST_GeomFromKML('
		<Polygon>
			<tessellate>1</tessellate>
			<outerBoundaryIs>
				<LinearRing>
					<coordinates>
						-77.25022891511702,43.85641397371344 -77.16867437563201,43.8212562688399 -77.11490202759302,43.82374344318048 -77.04255707553263,43.84741075770832 -77.00672138289923,43.8666710697511 -76.96626039070019,43.88444968753872 -76.93728295202904,43.89387269323177 -76.87937402646641,43.90285990509671 -76.82514768967469,43.92051934214746 -76.7901816711978,43.93682251415988 -76.78344050771436,43.94604628275817 -76.79030249401976,43.96272637818038 -76.80352174078382,43.96887577147201 -76.8441065557014,43.97516160305875 -76.90089723183456,43.96718651197304 -76.955607391591,43.96250570346344 -76.99726565897871,43.95355844002144 -77.02792805498228,43.93458253094532 -77.05337142557062,43.91096353680949 -77.14501408697674,43.88592048317948 -77.19723394301671,43.88312905622368 -77.25022891511702,43.85641397371344
					</coordinates>
				</LinearRing>
			</outerBoundaryIs>
		</Polygon>
    '),
    NOW(),
    NOW()
);
```