DROP TABLE IF EXISTS fleet CASCADE;
DROP TABLE IF EXISTS ship CASCADE;
DROP TABLE IF EXISTS sailor CASCADE;
DROP TABLE IF EXISTS duty CASCADE;


CREATE TABLE fleet (
  id SERIAL PRIMARY KEY,
  fleet_name VARCHAR(50)
);

INSERT INTO fleet (id, fleet_name)
 VALUES (1, 'Eastern');
INSERT INTO fleet (id, fleet_name)
 VALUES (2, 'North');
INSERT INTO fleet (id, fleet_name)
 VALUES (3, 'South');
INSERT INTO fleet (id, fleet_name)
 VALUES (4, 'Far Eastern');
INSERT INTO fleet (id, fleet_name)
 VALUES (5, 'Western');

CREATE TABLE ship (
  ship_id SERIAL PRIMARY KEY,
  ship_name VARCHAR(50),
  built_date DATE,
  fleet_id INTEGER,
  FOREIGN KEY(fleet_id) REFERENCES fleet(id) ON DELETE CASCADE
);

INSERT INTO ship (ship_id, ship_name, built_date, fleet_id)
 VALUES (1, 'Caribbean Princess', '2004-10-02', 2);
INSERT INTO ship (ship_id, ship_name, built_date, fleet_id)
 VALUES (2, 'Disney Dream', '2011-03-06', 4);
INSERT INTO ship (ship_id, ship_name, built_date, fleet_id)
 VALUES (3, 'Golden Iris', '1977-05-23', 1);
INSERT INTO ship (ship_id, ship_name, built_date, fleet_id)
 VALUES (4, 'Jewel of the Seas', '2004-04-04',3);
INSERT INTO ship (ship_id, ship_name, built_date, fleet_id)
 VALUES (5, 'Noordam', '2006-02-19',5);
INSERT INTO ship (ship_id, ship_name, built_date, fleet_id)
 VALUES (6, 'Pacific Star', '2009-09-13',4);

CREATE TABLE sailor (
  sailor_id SERIAL PRIMARY KEY,
  sailor_name VARCHAR(50),
  date_of_birth DATE
);

INSERT INTO sailor (sailor_id, sailor_name, date_of_birth)
 VALUES (1, 'Simon Danziker', '1950-12-14');
INSERT INTO sailor (sailor_id, sailor_name, date_of_birth)
 VALUES (2, 'Roger North', '1978-05-03');
INSERT INTO sailor (sailor_id, sailor_name, date_of_birth)
 VALUES (3, 'Peter Harris', '1988-08-16');
INSERT INTO sailor (sailor_id, sailor_name, date_of_birth)
 VALUES (4, 'Jean Hamlin', '1967-09-28');
INSERT INTO sailor (sailor_id, sailor_name, date_of_birth)
 VALUES (5, 'Edward Davis', '1990-02-24');

CREATE TABLE duty (
  sailor_id INTEGER,
  ship_id INTEGER,
  duty_name VARCHAR(50),
  start_date DATE,
  end_date DATE,
  rank VARCHAR(50),
  FOREIGN KEY(sailor_id) REFERENCES sailor(sailor_id) ON DELETE CASCADE,
  FOREIGN KEY(ship_id) REFERENCES ship(ship_id) ON DELETE CASCADE
);

INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (2, 6, 'Captain', '1998-02-03','2004-06-05', 'Senior Officer');
INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (1, 4, 'Navigator', '1978-09-09','1990-10-24', 'Officer');
INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (4, 2, 'Boatswain', '1998-12-14','2009-05-13', 'Officer');
INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (3, 1, 'Surgeon', '2000-01-18','2000-12-12', 'Junior Officer');
INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (5, 5, 'Captain', '2001-01-01', '2002-08-04', 'Senior Officer');
INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (5, 6, 'Gunner', '2004-05-03', '2007-04-18', 'Standing Officer');
INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (3, 3, 'Surgeon', '2005-09-15','2009-03-07', 'Junior Officer');
INSERT INTO duty (sailor_id, ship_id, duty_name, start_date, end_date, rank)
 VALUES (2, 1, 'Carpenter', '2008-03-16','2010-08-09', 'Standing Officer');



