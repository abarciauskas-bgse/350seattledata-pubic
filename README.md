# Youth voter analysis

This describes the methodology for analyzing King County voter participation, specifically the markdown files in each subdirectory answer questions about what percentage of registered voters voted in the age groups of under 35 and over 50.

## Create the database

This analysis assumes copies of voter data having the filename `KCE_CityOfSeattle_11[2017|2018|2019].csv`

```bash
cd <year>/
psql -d 350seattle -f create-voter-table.sql
```

## Running the following will generate the numbers of interest for `<year>`.

We use the last date of ballot submission for a given year by which to calculate the age of the voters.

* The date of the 2017 general election was Nov 7.
* The date of the 2018 election was Nov 6.
* The date of the 2019 election was Nov 5. 

Note: The version of `<year>/voter-queries-<year>.md` is a cleaned up version (reformatted  sql output).

```bash
cd <year>/
psql -d 350seattle -f voter-queries-<year>.sql > voter-queries-<year>.md
```
