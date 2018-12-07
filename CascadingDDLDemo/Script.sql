Create Database CascadingDDLDemo

Use CascadingDDLDemo

Create Table tblCountries(CountryID int Primary Key, CountryName nvarchar(50))
Create Table tblStates(StateID int Primary Key, StateName nvarchar(50), CountryID int FOREIGN KEY REFERENCES tblCountries(CountryID))
Create Table tblCities(CityID int Primary Key, CityName nvarchar(50), StateID int FOREIGN KEY REFERENCES tblStates(StateID))

Insert Into tblCountries Values (1,'USA')
Insert Into tblCountries Values (2,'Europe')
Insert Into tblCountries Values (3,'India')

Insert Into tblStates Values (1,'New York',1)
Insert Into tblStates Values (2,'California',1)
Insert Into tblStates Values (3,'Albania',2)
Insert Into tblStates Values (4,'Austria',2)
Insert Into tblStates Values (5,'Uttar Pradesh',3)
Insert Into tblStates Values (6,'Maharashtra',3)

Insert Into tblCities Values (1,'Bufflo',1)
Insert Into tblCities Values (2,'Yonkers',1)
Insert Into tblCities Values (3,'Richmond',2)
Insert Into tblCities Values (4,'Norwalk',2)
Insert Into tblCities Values (5,'Tirana',3)
Insert Into tblCities Values (6,'Fier',3)
Insert Into tblCities Values (7,'Hard',4)
Insert Into tblCities Values (8,'Enns',4)
Insert Into tblCities Values (9,'Allahbad',5)
Insert Into tblCities Values (10,'Lucknow',5)
Insert Into tblCities Values (11,'Aurangabad',6)
Insert Into tblCities Values (12,'Akola',6)

Create Procedure spGetCountries
As
Begin
	Select CountryName,CountryID from tblCountries
End

Create Procedure spGetStates @CountryID int
As
Begin
	Select StateName,StateID from tblStates where CountryID = @CountryID
End

Create Procedure spGetCities @StateID int
As
Begin
	Select CityName,CityID from tblCities where StateID = @StateID
End

