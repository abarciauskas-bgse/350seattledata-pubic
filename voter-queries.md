# Youth voter analysis

This describes the methodology for analyzing King County voter participation.

## Create the database

Right now this is specific to 2018 and requires you have a copy of `KCE_CityOfSeattle_112018.csv`

```bash
psql -d 350seattle -f create_voter_table.sql
```

## Running the following will generate the numbers of interest for 2018.

The date of the 2018 election was Nov 6. 

Note: The version of voter-queries-2018.md here is a cleaned up version (removed some sql output).

```bash
psql -d 350seattle -f voter-queries-2018.sql > voter-queries-2018.md
```