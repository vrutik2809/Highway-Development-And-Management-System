set search_path to public;

-- 1. List all the highways that start in Gujarat or end in Gujarat, along with start location, end location and length.
select (
	select l.name
	from highways as h join locations as l
	on h.id = sh.highway_id and h.start_location_id = l.id
) as start_location,(
	select l.name
	from highways as h join locations as l
	on h.id = sh.highway_id and h.end_location_id = l.id
) as end_location,(
	select h.length
	from highways as h
	where h.id = sh.highway_id
)
from state_highways as sh
where sh.state_id = (
	select s.id
	from states as s
	where s.name = 'Gujarat'
);

-- 2. List the total number of highways for each state which starts or ends in that state.
select (
	select s.name
	from states as s
	where s.id = sh.state_id
), count(sh.highway_id) as total_number_of_highways
from state_highways as sh
group by sh.state_id;

-- 3. List all names of locations in Rajasthan state
select l.name
from locations as l
where l.state_id = (
	select s.id
	from states as s
	where s.name = 'Rajasthan'
);

-- 4. 

-- 19. Function for selecting all the problems related to highways with given highway id
drop function if exists fetchAllProblems(int);
create or replace function fetchAllProblems(h_id int)
returns table(
	description varchar,
	issue_date date
)
as
$$
begin
	return query 
	select p.description, p.issue_date
	from problems as p
	where p.highway_id = h_id;
end;
$$
language plpgsql;
