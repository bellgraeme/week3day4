DROP TABLE gigs;
DROP TABLE venues;
DROP TABLE artists;

CREATE TABLE artists(
id SERIAL4 primary key,
name VARCHAR(255),
genre VARCHAR(255)
);

CREATE TABLE venues(
id SERIAL4 primary key,
name VARCHAR(255),
location VARCHAR(255)
);

CREATE TABLE gigs(
id SERIAL4 primary key,
artist_id INT4 references artists(id) ON DELETE CASCADE,
venue_id INT4 references venues(id) ON DELETE CASCADE,
gig_date  DATE
);