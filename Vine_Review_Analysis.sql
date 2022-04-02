-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
select * from vine_table;
------step1----------------------------
CREATE TABLE tot_votes_greaterthan20 (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

Insert into tot_votes_greaterthan20 (
select * from vine_table
where total_votes >=20
and helpful_votes > 0);

select * from tot_votes_greaterthan20;
----step2---------------------------------
CREATE TABLE helpful_votes_greaterthan50p (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
Insert into helpful_votes_greaterthan50p
select * 
from tot_votes_greaterthan20
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

select * from helpful_votes_greaterthan50p

-----step3------------------------------------
CREATE TABLE vine_Y (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
Insert into vine_Y
select * from helpful_votes_greaterthan50p
where vine = 'Y';

select * from vine_Y

-----step4----------------------------------------
CREATE TABLE vine_N (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
Insert into vine_N
select * from helpful_votes_greaterthan50p
where vine = 'N';

select * from vine_N
---------step5-----------------------------------------
----Precentage for 5 star unpaid reviews
----No of total unpaid vine reviews
select count(*)
from vine_N
---17514
---No of 5 star unpaid vine reviews----
select count(*)
from vine_N
where star_rating = 5
---5154

---
CREATE TABLE vine_N_fivestar (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

Insert Into vine_N_fivestar
select *
from vine_N
where star_rating = 5
-----Calculate Precentage for 5 star Non vine(unpaid) reviews

WITH
vine_N AS (SELECT COUNT(*) as tot from vine_N),
vine_N_fivestar AS (SELECT COUNT(*) as fivestar from vine_N_fivestar)
SELECT CAST(vine_N_fivestar.fivestar AS FLOAT)/
CAST(vine_N.tot AS FLOAT)*100 AS precent
FROM vine_N,vine_N_fivestar
---------------------------------------------------------------------------------------
----Precentage for 5 star paid reviews
----No of total paid vine reviews
select count(*)
from vine_Y
---248
---No of 5 star paid vine reviews----
select count(*)
from vine_Y
where star_rating = 5;
---102

---
CREATE TABLE vine_Y_fivestar (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

Insert Into vine_Y_fivestar
select *
from vine_Y
where star_rating = 5
-----Calculate Precentage for 5 star paid reviews

WITH
vine_Y AS (SELECT COUNT(*) as totpaid from vine_Y),
vine_Y_fivestar AS (SELECT COUNT(*) as fivestarpaid from vine_Y_fivestar)
SELECT CAST(vine_Y_fivestar.fivestarpaid AS FLOAT)/
CAST(vine_Y.totpaid AS FLOAT)*100 AS precent
FROM vine_Y,vine_Y_fivestar
---------------------------------------------------------------------------------------



