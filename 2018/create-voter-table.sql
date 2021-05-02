-- psql -d 350seattle -f 2018/create-voter-table.sql
drop table if exists voters_kc_2018;
create table voters_kc_2018 (
    VoterID integer,
    StatusCode text,
    FirstName text,
    MiddleName text,
    LastName text,
    NameSuffix text,
    ResidenceAddress text,
    ResidenceUnitType text,
    ResidenceUnitNumber text,
    ResidenceCity text,
    ResidenceState char(2),
    ResidenceZipCode char(10),
    PrecinctID text,
    PrecinctPortion text,
    PrecinctName text,
    OriginalRegistrationDate timestamp,
    Gender char(1),
    Birthdate timestamp,
    MailAddress1 text,
    MailAddress2 text,
    MailAddress3 text,
    MailAddress4 text,
    DistrictName1 text,
    DistrictName2 text,
    DistrictName3 text,
    DistrictName4 text,
    DistrictName5 text,
    DistrictName6 text,
    ElectionDesc_1 text,
    Voted int
);

COPY 
    voters_kc_2018(VoterID, StatusCode, FirstName, MiddleName, LastName, NameSuffix, ResidenceAddress, ResidenceUnitType, ResidenceUnitNumber, ResidenceCity, ResidenceState, ResidenceZipCode, PrecinctID, PrecinctPortion, PrecinctName, OriginalRegistrationDate, Gender, Birthdate, MailAddress1, MailAddress2, MailAddress3, MailAddress4, DistrictName1, DistrictName2, DistrictName3, DistrictName4, DistrictName5, DistrictName6, ElectionDesc_1, Voted)
FROM '../data/KCE_CityOfSeattle_112018.csv' DELIMITER ',' CSV HEADER;
