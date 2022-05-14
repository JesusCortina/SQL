#Creating a table for singles and ep
CREATE TABLE singles (
	sing_id CHAR(4),
    sing_name CHAR(80) NOT NULL,
    sing_rdate DATE,
    sing_trackno INT,
    CONSTRAINT SingleKey PRIMARY KEY (sing_id))

    
    
INSERT 
INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
VALUES (1, 'Shiver', '2000-03-06', 3),
(2, 'Yellow', '2000-06-26', 3),
(3, 'Trouble', '2000-10-23', 3),
(4, 'Don''t Panic', '2001-03-19', 3);    

UPDATE singles
SET sing_name = 'Don''t Panic'
WHERE sing_id = 4;

INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
VALUES (5, 'In My Place', '2002-08-05', 3),
	(6, 'The Scientist', '2003-04-15', 3),
    (7, 'Clocks', '2002-11-04', 3),
    (8, 'God Put A Smile Upon Your Face', '2003-07-14', 2);
    
 INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (9, 'Speed Of Sound', '2005-04-18', 3),
	(10, 'Fix You', '2005-09-05', 3),
    (11, 'Talk', '2005-12-19', 3),
    (12, 'The Hardest Part', '2006-04-03', 2);
    
  INSERT INTO  singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (13, 'Violet Hill', '2008-05-09', 3),
	(14, 'Viva La Vida', '2008-05-25', 2),
    (15, 'Lovers In Japan', '2008-11-03', 1),
    (16, 'Lost!', '2008-11-10', 4),
    (17, 'Strawberry Swing', '2009-09-13', 1),
    (18, 'Life In Technicolor II', '2009-02-02', 3);
    
  INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (19, 'Every Teardrop Is A Waterfall', '2001-06-03', 2),
	(20, 'Paradise', '2011-09-12', 1),
    (21, 'Charlie Brown', '2012-01-23', 1),
    (22, 'Princess Of China', '2012-02-12', 1),
    (23, 'Hurts Like Heaven', '2012-07-27', 1);
    
  INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (24, 'Magic', '2014-03-03', 1),
	(25, 'Midnight', '2014-04-17', 1),
    (26, 'A Sky Full Of Stars', '2014-05-02', 1),
    (27, 'True Love', '2014-08-14', 1),
    (28, 'Ink', '2014-10-13' , 1);
    
  INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (29, 'Adventure Of A Lifetime', '2015-11-06', 1),
	(30, 'Hymn For The Weekend', '2016-01-25', 1),
    (31, 'Up&Up', '2016-04-22', 1),
    (32, 'A Head Full Of Dreams', '2016-08-19', 1),
    (33, 'Everglow', '2016-11-11', 1);
    
  INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (34, 'Orphans / Arabesque', '2019-10-24', 2),
	(35, 'Everyday Life', '2019-11-03', 1),
    (36, 'Champion Of The World', '2020-02-24', 1);
    
   INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (37, 'Atlas', '2013-09-06', 1),
	(38, 'Miracles', '2014-12-15', 1),
    (39, 'Something Just Like This', '2017-02-22', 1),
    (40, 'Flags', '2020-12-21', 1);
   
   UPDATE singles
   SET sing_rdate = '2011-06-03'
   WHERE sing_id = 19;
   
   
     INSERT INTO singles (sing_id, sing_name, sing_rdate, sing_trackno)
 VALUES (41, 'Higher Power', '2021-05-07', 1),
	(42, 'My Universe', '2021-09-24', 2),
    (43, 'Let Somebody Go', '2022-02-07', 1);
   
   