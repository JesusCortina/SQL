CREATE TABLE eps (
	ep_id INT auto_increment,
    ep_name VARCHAR(50) UNIQUE,
    ep_rdate date,
    ep_length TIME,
    ep_trackno INT,
    CONSTRAINT epid PRIMARY KEY (ep_id));
    
INSERT INTO eps (ep_name, ep_rdate, ep_length, ep_trackno)
VALUES   ('Prospekt''s March',  '2008-11-21', '00:27:31', 8),
	('Kaleidoscope EP', '2017-07-14', '00:24:57', 5),
    ('The Blue Room', '1999-10-11', '00:19:33', 5);
    
 INSERT INTO eps (ep_name, ep_rdate, ep_length, ep_trackno)
VALUES ('Every Teardrop Is A Waterfall EP',  '2011-06-26', '00:11:50', 3),
 ('A Sky Full Of Stars EP', '2014-06-29', '00:13:22', 4);
 
  INSERT INTO eps (ep_name, ep_rdate, ep_length, ep_trackno)
VALUES ('Global Citizen - EP 1', '2018-11-30', '00:14:18', 4);



