
DROP DATABASE IF EXISTS ChampionsLeague;

CREATE DATABASE ChampionsLeague;

USE ChampionsLeague;


DROP TABLE IF EXISTS Managers;
CREATE TABLE if not exists Managers (
ManagerName varchar(50) not null
);


INSERT INTO Managers(ManagerName)
VALUES('Clinton Iwu'), 
('Tana Erisnor');

DROP TABLE IF EXISTS FantasyTeam;
CREATE TABLE  if not exists FantasyTeam(
TeamCode int PRIMARY KEY not null,
TeamPoints SMALLINT not null,
TeamBudget INT not null,
PlayerNames varchar(50) not null
);

DROP TABLE IF EXISTS Players;
CREATE TABLE Players (
PlayerCode  SMALLINT PRIMARY KEY not null,
PlayerPrice MEDIUMINT not null,
PlayerName varchar(50) not null,
PlayerCountry varchar(50) not null, 
TeamId INT not null,
FOREIGN KEY (TeamId) REFERENCES FantasyTeam(TeamCode)
);

DROP TABLE IF EXISTS PlayerStatistics;

CREATE TABLE if not exists PlayerStatistics (
	PlayerPoint SMALLINT PRIMARY KEY not null  ,
	ShotsOnTargetPoints SMALLINT not null,
	AssistPoints SMALLINT not null,
	SavesPoints SMALLINT not null , 
	GoalsScoredPoints SMALLINT not null,
	FantasyPoints INT not null,
	PlayerCode SMALLINT not null,
    FOREIGN KEY (PlayerCode) REFERENCES Players(PlayerCode)
);

DROP TABLE IF EXISTS PlayerPositions;
CREATE TABLE  if not exists PlayerPositions(
GoalkeepersName varchar(25),
ForwardsName varchar(25),
PositionId SMALLINT PRIMARY KEY not null,
FOREIGN KEY (PositionId) REFERENCES Players(PlayerCode)
);

CREATE TABLE  if not exists Country(

Countries varchar(50) not null,
CountryId SMALLINT PRIMARY KEY  not null

);

CREATE TABLE  if not exists PlayerCountry(

PlayerCode SMALLINT not null,
CountryId	SMALLINT not null,
FOREIGN KEY (PlayerCode) REFERENCES Players(PlayerCode),
FOREIGN KEY (CountryId) REFERENCES Country(CountryId)
);

























INSERT INTO FantasyTeam(TeamCode, PlayerNames, TeamBudget, TeamPoints)
VALUES(101, 'Wayne Rooney', 1000, 10),
		(102, 'Christiano Ronaldo', 1000, 20 ),
        (103, 'Neymar', 1000, 25 );
        
INSERT INTO Players(PlayerCode, PlayerPrice, PlayerName, PlayerCountry, TeamId )
VALUES(0, 100, 'Wayne Rooney', 'England', 101);

INSERT INTO Players(PlayerCode, PlayerPrice, PlayerName, PlayerCountry,  TeamId )
VALUES(1, 150, 'Christiano Ronaldo', 'Portugal', 101);

INSERT INTO Players(PlayerCode, PlayerPrice, PlayerName, PlayerCountry, TeamId )
VALUES(2, 250, 'Neymar', 'Brazil', 101);



SET FOREIGN_KEY_CHECKS=0;  /*. here it is just making foreign key off */
INSERT INTO PlayerPositions(GoalkeepersName, ForwardsName, PositionId)
VALUES('Peter Cech', null, 101),
		(null, 'Mbampe', 102),
		(null, 'Robinho', 103);
        SET FOREIGN_KEY_CHECKS=1;













INSERT INTO PlayerStatistics (PlayerPoint, ShotsOnTargetPoints, AssistPoints, SavesPoints, GoalsScoredPoints, FantasyPoints, PlayerCode)
VALUES(10, 10, 1, 2, 5, 20, 0);

INSERT INTO PlayerStatistics (PlayerPoint, ShotsOnTargetPoints, AssistPoints, SavesPoints, GoalsScoredPoints, FantasyPoints, PlayerCode)
VALUES(20, 5, 1, 2, 5, 35, 1);

INSERT INTO PlayerStatistics (PlayerPoint, ShotsOnTargetPoints, AssistPoints, SavesPoints, GoalsScoredPoints, FantasyPoints, PlayerCode)
VALUES(25, 25, 1, 2, 5, 30, 2);

INSERT INTO Country(Countries, CountryId)
VALUES('Brazil', 224);

INSERT INTO Country(Countries, CountryId)
VALUES('Portugal', 225);

INSERT INTO Country(Countries, CountryId)
VALUES('England', 226);


INSERT INTO PlayerCountry(PlayerCode, CountryId)
VALUES(1, 225);


INSERT INTO PlayerCountry(PlayerCode, CountryId)
VALUES(0, 226);

INSERT INTO PlayerCountry(PlayerCode, CountryId)
VALUES(2, 224);



alter table FantasyTeam 
add constraint FK_teampoints foreign key (TeamPoints) references PlayerStatistics(PlayerPoint);




















