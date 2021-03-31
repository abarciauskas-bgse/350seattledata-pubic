# Youth voter analysis

This describes the methodology for analyzing King County voter participation.

## Create the database

Right now this is specific to 2018 and requires you have a copy of `KCE_CityOfSeattle_11[2017|2018|2019].csv`

```bash
cd 2019
psql -d 350seattle -f create-voter-table.sql
```

## Running the following will generate the numbers of interest for 2018.

The date of the 2017 general election was Nov 7.
The date of the 2018 election was Nov 6.
The date of the 2019 election was Nov 5. 

Note: The version of voter-queries-2018.md here is a cleaned up version (removed some sql output).

```bash
cd 2019/
psql -d 350seattle -f voter-queries-2019.sql > voter-queries-2019.md
```