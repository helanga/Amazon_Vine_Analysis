-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
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


-----step3------------------------------------
CREATE TABLE vine_paid (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
Insert into vine_paid
select * from helpful_votes_greaterthan50p
where vine = 'Y';

-----step4----------------------------------------
CREATE TABLE vine_unpaid (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
Insert into vine_unpaid
select * from helpful_votes_greaterthan50p
where vine = 'N';

select * from vine_unpaid
---------step5-----------------------------------------
----Precentage for 5 star unpaid reviews
----No of total unpaid vine reviews
select count(*)
from vine_unpaid
---17514
---No of 5 star unpaid vine reviews----
select count(*)
from vine_unpaid
where star_rating = 5
---5154

---
CREATE TABLE vine_unpaid_fivestar (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

Insert Into vine_unpaid_fivestar
select *
from vine_unpaid
where star_rating = 5
-----Calculate Precentage for 5 star unpaid reviews

WITH
vine_unpaid AS (SELECT COUNT(*) as tot from vine_unpaid),
vine_unpaid_fivestar AS (SELECT COUNT(*) as fivestar from vine_unpaid_fivestar)
SELECT CAST(vine_unpaid_fivestar.fivestar AS FLOAT)/
CAST(vine_unpaid.tot AS FLOAT)*100 AS precent
FROM vine_unpaid,vine_unpaid_fivestar
---------------------------------------------------------------------------------------
----Precentage for 5 star paid reviews
----No of total paid vine reviews
select count(*)
from vine_paid
---248
---No of 5 star paid vine reviews----
select count(*)
from vine_paid
where star_rating = 5;
---102

---
CREATE TABLE vine_paid_fivestar (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

Insert Into vine_paid_fivestar
select *
from vine_paid
where star_rating = 5
-----Calculate Precentage for 5 star paid reviews

WITH
vine_paid AS (SELECT COUNT(*) as totpaid from vine_paid),
vine_paid_fivestar AS (SELECT COUNT(*) as fivestarpaid from vine_paid_fivestar)
SELECT CAST(vine_paid_fivestar.fivestarpaid AS FLOAT)/
CAST(vine_paid.totpaid AS FLOAT)*100 AS precent
FROM vine_paid,vine_paid_fivestar
---------------------------------------------------------------------------------------



