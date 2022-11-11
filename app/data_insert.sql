COPY states(name)
FROM 'V:\Temp\data_csv\states.csv'
DELIMITER ','
CSV HEADER;

COPY locations(name,state_id)
FROM 'V:\Temp\data_csv\locations.csv'
DELIMITER ','
CSV HEADER;

COPY highways(type,length,start_location_id,end_location_id,cost,build_year,last_renovation_year)
FROM 'V:\Temp\data_csv\highways.csv'
DELIMITER ','
CSV HEADER;

COPY state_highways(state_id,highway_id)
FROM 'V:\Temp\data_csv\state_highways.csv'
DELIMITER ','
CSV HEADER;

COPY problems(description,issue_date,resolved_date,highway_id)
FROM 'V:\Temp\data_csv\problems.csv'
DELIMITER ','
CSV HEADER;

COPY users(username,password,type)
FROM 'V:\Temp\data_csv\users.csv'
DELIMITER ','
CSV HEADER;

COPY construction_companies(name,user_id)
FROM 'V:\Temp\data_csv\construction_companies.csv'
DELIMITER ','
CSV HEADER;

COPY contracts_information(highway_id,company_id,type,construction_status)
FROM 'V:\Temp\data_csv\contracts_information.csv'
DELIMITER ','
CSV HEADER;

COPY tenders(description,proposed_by_company_id,proposed_for_highway_id)
FROM 'V:\Temp\data_csv\tenders.csv'
DELIMITER ','
CSV HEADER;

COPY civil_engineers(name,company_id)
FROM 'V:\Temp\data_csv\civil_engineers.csv'
DELIMITER ','
CSV HEADER;

COPY contract_related_civil_engineers(contract_id,civil_engineer_id)
FROM 'V:\Temp\data_csv\contract_related_civil_engineers.csv'
DELIMITER ','
CSV HEADER;

COPY forums(title,created_by,created_at)
FROM 'V:\Temp\data_csv\forums.csv'
DELIMITER ','
CSV HEADER;

COPY replies(description,user_id,forum_id)
FROM 'V:\Temp\data_csv\replies.csv'
DELIMITER ','
CSV HEADER;

COPY notices(description)
FROM 'V:\Temp\data_csv\notices.csv'
DELIMITER ','
CSV HEADER;

COPY mail_subscribers(email)
FROM 'V:\Temp\data_csv\mail_subscribers.csv'
DELIMITER ','
CSV HEADER;
