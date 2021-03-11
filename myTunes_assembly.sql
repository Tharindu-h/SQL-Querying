PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- CAUTION REMOVES OLD VERSIONS OF TABLES!
DROP TABLE IF EXISTS My_cds;
DROP TABLE IF EXISTS My_songs;
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

-- Create temp tables My_cds and My_songs that will later be changed to cds and songs respectively
-- Each time this script reads a insert script it will copy the data onto My_cds and My_songs tables
-- After the tables read from the insert scripts will be deleted to ensure no conflicts when reading 
-- Another insert script.
CREATE TABLE My_cds(
      cd_id text primary key not null, --cd unique id
      title text NOT NULL, --title of CD
      artist text NOT NULL, --artist whose CD it is or "various artists"
      producer text default NULL,
      year integer,
      contributer text --student number who contirbuted the data
      );

CREATE TABLE My_songs(
      song_id integer primary key autoincrement, --auto incrementing key
      title text NOT NULL, --title of song
      composer text NOT NULL, --person or persons who wrote the song
      cd_id text NOT NULL, --cd this song appears on
      track integer NOT NULL, --track number of the song
      contributer text --student number who contirbuted the data
      );

COMMIT;

-- Read Rezieh's script
.read myTunes_Rezieh.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Here the all data read from the previous .read command is copied to the proper table so that the tables read from the .read can be deleted
INSERT INTO My_cds SELECT * FROM cds; -- copying all data from cds to My_cds
INSERT INTO My_songs (title, composer, cd_id,track,contributer) 
 SELECT title, composer, cd_id,track,contributer
 FROM songs; -- copying all data from songs to My_songs

-- Drop the cds and songs tables
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

COMMIT;

-- Read Monica's script
.read myTunes_Monica.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Here the all data read from the previous .read command is copied to the proper table so that the tables read from the .read can be deleted
INSERT INTO My_cds  SELECT * FROM cds; -- copying all data from cds to My_cds
INSERT INTO My_songs (title, composer, cd_id,track,contributer)
 SELECT title, composer, cd_id,track,contributer
 FROM songs; -- copying all data from songs to My_songs

-- Drop the cds and songs tables
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

COMMIT;

-- Read Saman's script
.read myTunes_Saman.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Here the all data read from the previous .read command is copied to the proper table so that the tables read from the .read can be deleted
INSERT INTO My_cds  SELECT * FROM cds; -- copying all data from cds to My_cds
INSERT INTO My_songs (title, composer, cd_id,track,contributer)
 SELECT title, composer, cd_id,track,contributer
 FROM songs; -- copying all data from songs to My_songs

-- Drop the cds and songs tables
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

COMMIT;


-- Read Fatemeh's script
.read myTunes_Fatemeh.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Here the all data read from the previous .read command is copied to the proper table so that the tables read from the .read can be deleted
INSERT INTO My_cds  SELECT * FROM cds; -- copying all data from cds to My_cds
INSERT INTO My_songs (title, composer, cd_id,track,contributer)
 SELECT title, composer, cd_id,track,contributer
 FROM songs; -- copying all data from songs to My_songs

-- Drop the cds and songs tables
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

COMMIT;


-- Read Ali's script
.read myTunes_Ali.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Here the all data read from the previous .read command is copied to the proper table so that the tables read from the .read can be deleted
INSERT INTO My_cds  SELECT * FROM cds; -- copying all data from cds to My_cds
INSERT INTO My_songs (title, composer, cd_id,track,contributer)
 SELECT title, composer, cd_id,track,contributer
 FROM songs; -- copying all data from songs to My_songs

-- Drop the cds and songs tables
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

COMMIT;


-- Read Abdelghny's script 
.read myTunes_Abdelghny.sql

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Here the all data read from the previous .read command is copied to the proper table so that the tables read from the .read can be deleted
INSERT INTO My_cds  SELECT * FROM cds; -- copying all data from cds to My_cds
INSERT INTO My_songs (title, composer, cd_id,track,contributer)
 SELECT title, composer, cd_id,track,contributer
 FROM songs; -- copying all data from songs to My_songs

-- Drop the cds and songs tables
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

COMMIT;


-- Time to rename the My_cds and My_songs tables
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Rename My_cds to cds
ALTER TABLE My_cds
 RENAME TO cds;

-- Rename My_songs to songs
ALTER TABLE My_songs
 RENAME TO songs;

COMMIT;