set search_path to public;

-- 1. List all names of locations in Rajasthan state.  
select l.name
from locations as l
where l.state_id = (
	select s.id
	from states as s
	where s.name = 'Rajasthan'
);

-- 2. List all contracts of renovation type.
select *
from contracts_information
where type = 'renovation';

-- 3. List all civil engineers related to the company with company id 26.
select *
from civil_engineers
where company_id = 26;

-- 4. List all civil engineers related to the contract with civil engineer id 25.
select *
from contract_related_civil_engineers
where civil_engineer_id = 25;

-- 5. List all related forums created by the user with user id 7.
select *
from forums
where created_by = 7;

-- 6. List all replies related to the forums with forum id 3.
select *
from replies
where forum_id = 3;

-- 7. List all users of type ‘govt_auth’.
select *
from users
where type = 'govt_auth';

-- 8. List all contracts where construction status is ‘running’.
select *
from contracts_information
where construction_status = 'running';

-- 9. List all tenders proposed by the company with company id 39.
select *
from tenders
where proposed_by_company_id = 39;

-- 10. List all highways whose length is greater than 500km.
select *
from highways
where length > 500;

-- 11. List all the highways that start in Gujarat or end in Gujarat, along with start location, end location and length.
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

-- 12. List the total number of highways for each state which starts or ends in that state.
select (
	select s.name
	from states as s
	where s.id = sh.state_id
), count(sh.highway_id) as total_number_of_highways
from state_highways as sh
group by sh.state_id;

-- 13. List all replies description along with username of user who replied it and title of the forum on which user has replied
select r.description,(
	select u.username
	from users as u
	where u.id = r.user_id
)as replied_by,(
	select f.title
	from forums as f
	where f.id = r.forum_id
)as replied_on
from replies as r;

-- 14. List all contracts along with company_name involved in it.
select ci.id,ci.type,ci.construction_status,c.name
from contracts_information as ci join construction_companies as c
on ci.company_id = c.id;

-- 15. List all contract related civil engineers along with their name and company they are working in it.
select cr.contract_id, ce.name,(
	select c.name
	from construction_companies as c
	where c.id = ce.company_id
)
from contract_related_civil_engineers as cr join civil_engineers as ce
on cr.civil_engineer_id = ce.id;

-- 16. List all locations along with their state name
select l.name as location_name, s.name as state_name
from states as s join locations as l
on s.id = l.state_id;

-- 17. List each company name along with the total number of contracts they have done and if they have not done any contract then show it as 0.
select c.name,(
	select count(ci.id)
	from contracts_information as ci
	where ci.company_id = c.id
) as total_number_of_contracts
from construction_companies as c;

-- 18. List total number of tenders proposed for each highways
select t.proposed_for_highway_id as highway_id, count(t.id) as total_number_of_tenders
from tenders as t
group by t.proposed_for_highway_id;

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

select * from fetchAllProblems(29);

-- 20. Trigger which checks whether resolved date for a particular problem is greater than issue date or not before inserting a problem.
drop function if exists resolvedDateValidator() cascade;
create or replace function resolvedDateValidator()
returns trigger
as
$$
begin
	if(new.resolved_date < new.issue_date)
	then raise exception 'Resolved date should be greater than issue date';
	end if;
	return new;
end;
$$
language plpgsql;

drop trigger if exists validateResolvedDate on problems;
create or replace trigger validateResolvedDate
before insert
on problems
for each row
execute function resolvedDateValidator();

insert into problems(description,issue_date,resolved_date,highway_id)
values ('test',now(),'2018-04-05',43);