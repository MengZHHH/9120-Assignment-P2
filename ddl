CREATE TABLE Member (
		member_id CHAR(10) PRIMARY KEY,
		title VARCHAR(50) NOT NULL,
		given_name VARCHAR(20) NOT NULL,
		family_name VARCHAR(20) NOT NULL
		);

CREATE TABLE Event(
		event_name VARCHAR(50) PRIMARY KEY,
		start_time TIME NOT NULL,
		start_date DATE NOT NULL,
		result_type VARCHAR(20)
		);

///////用SELECT COUNT计算同样的booking数量 D/HD要求//
CREATE TABLE Journey_book(
		vehicle_code CHAR(8) ,
		start_date DATE,
		start_time TIME,
		member_id CHAR(10) REFERENCES Member(member_id),
		book_time TIME NOT NULL,
		operator CHAR(10) REFERENCES Staff(member_id),
		PRIMARY KEY (vehicle_code, start_date, start_time, member_id)
		);

CREATE TABLE Journey(
		vehicle_code CHAR(8) REFERENCES Journey_book(vehicle_code),
		start_date DATE REFERENCES Journey_book(start_date),
		start_time TIME REFERENCES Journey_book(start_time),
		nbooked INTEGER(SELECT COUNT(*)
			FROM
		from_where VARCHAR(20) REFERENCES Place(place_name),
		to_where VARCHAR(20) REFERENCES Place(place_name),
		PRIMARY KEY (vehicle_code, start_date, start_time)
		)

CREATE TABLE Place(
		place_name VARCHAR(20) PRIMARY KEY,
		longitude VARCHAR(20) NOT NULL,
		latitude VARCHAR(20) NOT NULL,
		address VARCHAR(50) NOT NULL
		 )

CREATE TABLE Accommodation(
		place_name VARCHAR(20) PRIMARY KEY REFERENCES Place(place_name)
		)

CREATE TABLE Sport_venue(
		place_name VARCHAR(20) PRIMARY KEY REFERENCES Place(place_name)
		)

CREATE TABLE Hold_event(
		event_name VARCHAR(50) REFERENCES Event(event_name),
		place_name VARCHAR (20) REFERENCES Sport_venue(place_name),
		PRIMARY KEY (event_name, place_name)
		)

CREATE TABLE Live_in(
		member_id CHAR(10) REFERENCES Member(member_id),
		place_name VARCHAR(20) REFERENCES Accommodation(place_name),
		PRIMARY KEY (member_id, place_name)
		)


CREATE TABLE Sport(
		sport_name VARCHAR(20) PRIMARY KEY
		);

CREATE TABLE Sport_for_event(
		sport_name VARCHAR(20) REFERENCES Sport(sport_name),
		event_name VARCHAR(50) REFERENCES Event(event_name)
		PRIMARY KEY(sport_name, event_name)
		);

CREATE TABLE Athelete(
		member_id CHAR(10) PRIMARY KEY REFERENCES Member(member_id)
		);

CREATE TABLE Official(
		member_id CHAR(10) PRIMARY KEY REFERENCES Member(member_id)
		);

CREATE TABLE Run_event(
		event_name VARCHAR(50) REFERENCES Event(event_name),
		member_id CHAR(10) REFERENCES Official(member_id),
		role VARCHAR(20) NOT NULL
		);

CREATE TABLE Staff(
		member_id CHAR(10) PRIMARY KEY REFERENCES Member(member_id)
			);

CREATE TABLE Country(
		Country_code SMALLINT PRIMARY KEY,
		name VARCHAR(50) NOT NULL
		);

CREATE TABLE Member_from(
		Country_code SMALLINT REFERENCES Country(Country_code), 
		member_id CHAR(10) REFERENCES Member(member_id)
		PRIMARY KEY(Country_code, member_id)
		);

CREATE TABLE Participates(
		event_name VARCHAR(50) REFERENCES Event(event_name),
		member_id CHAR(10) REFERENCES Athelete(member_id),
		medal VARCHAR(20) DEFAULT NULL CHECK (medal IN ('Gold', 'Silver', 'Bronze'))
		);