\echo Set election date

create or replace function election_date_2017() returns timestamp as $$
    DECLARE  
        election_date_2017 timestamp;
    BEGIN  
        return (SELECT TO_DATE('20171107','YYYYMMDD'));
    END;
$$ LANGUAGE plpgsql;

\echo Total eligible voters

create or replace function count_total_eligible() returns int as $$
    DECLARE  
        total_eligible_voters integer;
    BEGIN  
        return (select count(*) from voters_kc_2017);
    END;
$$ LANGUAGE plpgsql;

select count_total_eligible from count_total_eligible();

\echo How many youth (people under 35) were eligible* to vote?
-- Select from voter table where birthday is greater than 35 years ago as of the general election in 2017.

create or replace function count_under35() returns int as $$
    DECLARE  
        under35 integer;
    BEGIN  
        return (select count(*) from voters_kc_2017 where Birthdate > (election_date_2017() - interval '35 years'));
    END;
$$ LANGUAGE plpgsql;

select * from count_under35();

\echo "* Note from Jess: `there may be two relevant numbers here: people legally eligible to vote, and people registered. I suspect the KC data will tell us about people who are registered and people who then voted, and then we'd have to look at census data to get the bigger-picture analysis of how many youth and 50+ were legally eligible to vote. But let's dig into the data & see!"

\echo How many people 50+ were eligible to vote?

-- select from voter table where birthday is less than 50 years ago as of the general election in 2017.
create or replace function count_over50() returns int as $$
    DECLARE  
        over50 integer;
    BEGIN  
        return (select count(*) from voters_kc_2017 where Birthdate < (election_date_2017() - interval '50 years'));
    END;
$$ LANGUAGE plpgsql;

select * from count_over50();

\echo How many total actually voted?

create or replace function count_voted() returns int as $$
    DECLARE  
        count_voted integer;
    BEGIN  
        return (select count(*) from voters_kc_2017 where VOTED = 1);
    END;
$$ LANGUAGE plpgsql;

select * from count_voted();

\echo How many eligible youth actually voted? (Assumes VOTED = 1 means they voted)

create or replace function count_under35_voted() returns int as $$
    DECLARE  
        under35_voted integer;
    BEGIN  
        return (select count(*) from voters_kc_2017 where Birthdate > (election_date_2017() - interval '35 years') and VOTED = 1);
    END;
$$ LANGUAGE plpgsql;

select * from count_under35_voted();

\echo How many eligible over 50 actually voted? (Assumes VOTED = 1 means they voted)

create or replace function count_over50_voted() returns int as $$
    DECLARE  
        over50 integer;
    BEGIN  
        return (select count(*) from voters_kc_2017 where Birthdate < (election_date_2017() - interval '50 years') and VOTED = 1);
    END;
$$ LANGUAGE plpgsql;

select * from count_over50_voted();

\echo What percent of the eligible voting population do those under 35 represent?

select ((select count_under35 from count_under35())::numeric / (select count_total_eligible from count_total_eligible()));

\echo What percent of those who voted are under 35?

select ((select count_under35_voted from count_under35_voted())::numeric / (select count_voted from count_voted()));

\echo What percent of the eligible voting population do those over 50 represent? 

select ((select count_over50 from count_over50())::numeric / (select count_total_eligible from count_total_eligible()));

\echo What percent of those who voted are over 50?

select ((select count_over50_voted from count_over50_voted())::numeric / (select count_who_voted from count_who_voted()));

