create table patients_data (
    Visit_ID INT,                         
    Patient_ID VARCHAR(50),                           -- 
    Folder_number VARCHAR(50),
    Date_of_visit int,
    Age INT,
    Gender VARCHAR(10),
    Diagnosis VARCHAR(255),
    Treatment_type VARCHAR(255),
    Admission_Required VARCHAR(10),
    Denture_on_patients_request VARCHAR(10),
    Type_of_denture VARCHAR(50),
    Treatment_cost int,
    Check_up VARCHAR(10),
    Cost_of_denture int,
    Follow_up_check_up VARCHAR(10),
    Date_of_impression int,
    Date_of_denture_fitting int,
    Patients_satisfaction VARCHAR(50)
);
 -- I CREATED A TABLE A TABLE COS WHEN I IMPORTED THE DATA THROUGH IMPORT DATA WIZARD THE DATASET WAS INCOMPLETE OUT OF 327 ROWS ONLY 245 WAS IMPORTED
-- CHECK THE FILE SECURITY BY 'SHOW VARIABLE LIKE 'SECURE_FILE_PRIV' THEN COPY AND PASTE THE VALUE SHOWN' 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads'
-- THEN RAN THIS SCRIPIT 'SHOW VARIABLES LIKE 'secure_file_priv';
-- CREATE A FOLDER USING THE VALUE''C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'' BY PRESSING WINDOW +R AND PASTE THE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'
-- WHEN THE FILE WAS CREATED  I COPIED THE DATASET GEMBU_PATIENT AND PASTE AT THE ALREDY CREATED FOLDER,
-- UPLOAD THE FILE INTO THE TABLE CREATED COPYONG THE NEW PATH OF THE FILE IE LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gembu_dataset.csv'
-- USING A FOWARD SLASH, THEN LOAD DATAI INFILE, LOAD DATA FROM FILE, THEM INTO THE TABLE CREATED  

SHOW VARIABLES LIKE 'secure_file_priv';

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gembu_dataset.csv'
into table patients_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines (
    Visit_ID,                         
    Patient_ID,                           -- 
   @Folder_number,
    Date_of_visit,
    Age,
    Gender,
    @Diagnosis,
    Treatment_type,
    @Admission_Required,
    @Denture_on_patients_request,
    @Type_of_denture,
    @Treatment_cost,
    @Check_up,
    @Cost_of_denture,
    @Follow_up_check_up,
	@Date_of_impression,
    @Date_of_denture_fitting,
    @Patients_satisfaction)
set
Folder_number= nullif(@Folder_number,''),
Diagnosis=nullif(@Diagnosis,''),
Admission_Required = nullif(@Admission_Require,''),
Denture_on_patients_request= nullif(@Denture_on_patients_request,''),
Type_of_denture=nullif(@Type_of_denture,''),
Treatment_cost=nullif(@Treatment_cost,''),
Check_up=nullif(@Check_up,''),
Cost_of_denture=nullif(@Cost_of_denture,''),
Follow_up_check_up=nullif(@Follow_up_check_up,''),
Date_of_denture_fitting=nullif(@Date_of_denture_fitting,''),
Patients_satisfaction=nullif(@Patients_satisfaction,''),
Date_of_impression=nullif(@Date_of_impression,'');
alter table patients_data
modify column Date_of_visit date;
alter table patients_data
modify column  Date_of_impression  date ;
alter table patients_data
modify column Date_of_denture_fitting date;    

-- CREATE A STAGING TABLE

create table  staging_table_patientsdataset like patients_data;
insert into staging_table_patientsdataset
select * from patients_data

-- STANDARDIZE THE DATASET
-- CAPITALIZE FOLDER NUMBER COLUMN
select upper(folder_number) from patients_data;
update patients_data
set folder_number=upper(folder_number)
update patients_data
set folder_number=upper(folder_number);
 
 update patients_data
 set Gender=upper(Gender);
-- STANDARDIZE DIAGNOSIS--

select concat(upper(substring(diagnosis,1,1)),lower(substring(diagnosis,2)))
as proper_case from patients_data;
update patients_data
set diagnosis=concat(upper(substring(diagnosis,1,1)),lower(substring(diagnosis,2)));
 
 
 select distinct(Diagnosis) from patients_data order by 1;
 select distinct diagnosis from visits_table order by 1
update visits_table
set diagnosis='Cavity and oral lesion'
where diagnosis='Chemical burn(oral lesion)';
 
 update patients_data
 set diagnosis= 'Bounded endentulous space'
 where diagnosis='Extraction'
 
 select diagnosis from patients_data
 where diagnosis regexp 'cavity';

update patients_data
set diagnosis= trim('Edentulism ');
select distinct Diagnosis from patients_data
update patients_data
set treatment_type='Scaling and denture construction'
where visit_id= '153'

select * from patients_data where Diagnosis ='Extraction'
select * from patients_data where diagnosis ='Missing teeth';
select * from patients_data where diagnosis ='Periodontitis/cavity';

-- STANDARIZE TREATMENT TYPE COLUMN
select distinct(Treatment_type) from patients_data order by 1;

update patients_data
set treatment_type=concat(upper(substring(treatment_type,1,1)),lower(substring(treatment_type,2)));

select treatment_type from patients_data where treatment_type regexp '^replacement';
select treatment_type from patients_data where treatment_type regexp ''
select treatment_type from patients_data where treatment_type like '^Extraction/replaceme';
update patients_data
set Treatment_type='Extraction of retained root'
where treatment_type ='Etraction of retained root';

update patients_data
set Treatment_type='Removal of eyelet wire'
where treatment_type='Removing of wire'; 

-- STANDARDZIE DENTURE ON REQUEST BY PATIENTS
select distinct(Denture_on_patients_request) from patients_data;
-- CAPITIALZE THE COLUMN
select upper(Denture_on_patients_request) from patients_data
update patients_data
set Denture_on_patients_request=upper(Denture_on_patients_request);
update patients_data
set Denture_on_patients_request=concat(upper(substring(Denture_on_patients_request,1,1)),lower(substring(Denture_on_patients_request,2)))

-- ADDIMSISION REQUIRED-- 
select treatment_type,Admission_Required from patients_data
where treatment_type regexp '^Incision and drainage/extraction/drugs$';
update patients_data
set Admission_Required='YES'
where treatment_type regexp '^Incision and drainage/extraction/drugs$'
select concat(upper(substring(Admission_Required,1,1)),lower(substring(Admission_Required,2)))
as proper_case from patients_data;
update patients_data
set Admission_Required=concat(upper(substring(Admission_Required,1,1)),lower(substring(Admission_Required,2)))

-- TYPE OF DENTURE
select distinct Type_of_denture from patients_data;

update patients_data
set Type_of_denture=concat(upper(substring(Type_of_denture,1,1)),lower(substring(Type_of_denture,2)));

update Patients_data
set Type_of_denture='Full lower'
where Type_of_denture='Full lower ';

update patients_data
set type_of_denture=NULL
where type_of_denture='Null';

-- DENTURE ON REQUEST--
select distinct(Denture_on_patients_request) from patients_data;

-- CHECK UP 
select distinct(Check_up) from patients_data; 

update patients_data
set check_up=concat(upper(substring(check_up,1,1)),lower(substring(check_up,2)));

update patients_data
set check_up='Yes'
where check_up='Yye';


-- FOLLOW UP CHECK UP
select distinct(Follow_up_check_up) from patients_data;

update patients_data
set Follow_up_check_up=concat(upper(substring(Follow_up_check_up,1,1)),lower(substring(Follow_up_check_up,2)));

update patients_data
set Follow_up_check_up='Yes'
where Follow_up_check_up='Yeaea';

-- PATIENTS SATISFACTION
select distinct(Patients_satisfaction) from patients_data order by 1

alter table patients_data
modify column Patients_satisfaction int;

update patients_data
set Patients_satisfaction=concat(upper(substring(Patients_satisfaction,1,1)),lower(substring(Patients_satisfaction,2)));


alter table patients_data
modify column Patients_satisfaction varchar(25);


update patients_data
set Patients_satisfaction = trim( both '\r' from trim(both'\n' from trim(both '\t' from trim(both ' ' from Patients_satisfaction))));

update patients_data
set Patients_satisfaction=NULL
where Patients_satisfaction in ('');


update patients_data
set Patients_satisfaction='Good'
where Patients_satisfaction in ('Netural','Good ','Netral','Netura;','Netuural');

-- DATE OF VISIT--
-- I HAD TO FORMATE THE DATE OF VISIT  TO DAY-MONTH-YEAR BECAUSE IT WAS IN YEAR MONTH DAY('%Y-%m-%d')
select Date_of_visit, date_format(Date_of_visit,'%d-%m-%Y') as formatted_date from patients_data;
select date_of_visit, date_format(date_of_visit,'%y-%m-%d') as ttttt_date from patients_data;


update patients_data
set date_of_visit=case 
when date_of_visit=  '2012-01-20' then '2020-01-12' 
when Date_of_visit= '2013-01-20' then '2020-01-13'
when Date_of_visit='2014-01-20' then '2020-01-14' 
when Date_of_visit= '2015-01-20'then '2020-01-15'
end
where date_of_visit in ('2012-01-20','2013-01-20','2014-01-20','2015-01-20'); 


select date_format(date_of_visit, '%d-%m-%Y') as formatted_date from patients_data;
update patients_data
set date_of_visit='2020-01-10'
where visit_id =10;
-- I NOTICED THAT IN THE PATINENTSID SOME ID NUMBERS WHERE 'PO11' INSTEAD OF 'POO11' DECIDED TO FORMAT TO THE CORRECT ID NUMBER 

update patients_data2
set patientsid=case 
when PatientsID ='PO11'then 'POO11'
when PatientsID= 'PO12' then 'POO12'
when PatientsID ='PO13' then 'POO13'
when PatientsID= 'PO14'then 'POO14'
when patientsID='PO15' THEN 'POO15'
WHEN PATIENTSID='PO16'THEN 'POO16'
WHEN PATIENTSID='PO17'THEN 'POO17'
WHEN PATIENTSID='PO18'THEN 'POO18'
WHEN PATIENTSID='PO19'THEN 'POO19'
WHEN PATIENTSID='PO20'THEN 'POO20'
end where PatientsID  in ('PO11','PO12','PO13','PO14','PO15','PO16','PO17','PO18','PO19','PO20'); 




-- NORMALIZE THE DATASET INTO VISIT_TABLE AND PATIENTS TABLE

create table patients_data like patients_data2;
insert into patients_data
select * from patients_data2;
-- THE PATIENTS DATA HOLDS THE PATIENTSID(WHICH IS THE PRIMARY KEY),FOLDER NO,AGE AND GENDER
create table patients_table (
    Patient_id varchar(50) not null, 
    Folder_number varchar(50),
    Age float,
    Gender varchar(10),
    primary key (Patient_id)
);
select PatientsID,concat('P',LPAD(SUBSTRING(PATIENTSID,4),3,'0')) FROM patients_data2;
UPDATE patients_data2
SET PatientsID=concat('P',LPAD(SUBSTRING(PATIENTSID,4),3,'0'));

select PatientsID FROM patients_data2
WHERE PatientsID=NULL
UPDATE PATIENTS_DATA2
SET PATIENTSID='POO284'
WHERE VISIT_ID=284;


insert into patients_table
select distinct PatientsID, Folder_number, Age, Gender
from patients_data where PatientsID is not null; 

SELECT DISTINCT PATIENTSID FROM PATIENTS_DATA;


SELECT * FROM PATIENTS_DATA 
WHERE PATIENTSID ='POO243'
UPDATE PATIENTS_DATA
SET GENDER='M'
WHERE VISIT_ID=242;

alter table patients_data
modify age float;
update patients_data
set age=0.038
where visit_id=316;

-- CREATE THE VISIT TABLE
create table visits_table (
    Visit_ID int primary key,
    Patient_ID varchar(50),
    Date_of_visit date,
    Diagnosis varchar(255),
    Treatment_type varchar(255),
    Admission_Required varchar(10),
    Denture_on_patients_request varchar(10),
    Type_of_denture varchar(50),
    Treatment_cost int,
    Check_up varchar(10),
    Cost_of_denture int,
    Follow_up_check_up varchar(10),
    Date_of_impression date,
    Date_of_denture_fitting date,
    Patients_satisfaction varchar(50),
    foreign key (Patient_ID) references patients_table (Patient_ID)
);
insert into visits_table
select Visit_ID, PatientsID,Date_of_visit,Diagnosis, Treatment_type,Admission_Required,Denture_on_patients_request,Type_of_denture, Treatment_cost, Check_up,Cost_of_denture,
Follow_up_check_up, Date_of_impression, Date_of_denture_fitting, Patients_satisfaction from patients_data;
 select * from visits_table;
 
 ALTER TABLE patients_data
ADD COLUMN Ideal_Treatment VARCHAR(255);

 select distinct(diagnosis) from patients_data;
 select distinct(treatment_type) from patients_data;
 
 



SELECT distinct(gender) from patients_table;
update patients_table
set gender ='F'
where gender='H';

-- EXPORATITORY DATA ANALSIS WITH THE DATASE USING THE VISIT  AND PATIENTS TABLE
-- 1) WHAT ARE THE MOST COMMON DENTAL DIAGNOSIS AND HOW DO THEY VARY BT AGE AND GENDER-- 
-- a) -------------------MOST COMMON DENTAL DIAGNOSIS-------------------------
SELECT Diagnosis, COUNT(*) AS total_cases
FROM visits_table
GROUP BY Diagnosis
ORDER BY total_cases DESC;

-- b) ------------------ DENTAL DIAGNOSIS BY GENDER--------OPTION 1---------------------
select count(Diagnosis),Diagnosis, PT.gender as number_of_case_by_gender
from visits_table VT
left join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by PT.Gender,Diagnosis 
order by count(Diagnosis) desc;
-- b) ------------------ DENTAL DIAGNOSIS BY GENDER----OPTION 2-------------------------
select
VT.diagnosis,count(*),
sum(case when PT.gender='F' then 1 else null end) as 'F',
sum(case when pT.gender='M' then 1 else null end) as 'M'
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by Diagnosis order by count(*) desc;

-- c) ------------------ DENTAL DIAGNOSIS BY AGE-----------------------------
select
case
 when age <=4 then 'Infants'
 when age <=12 then 'Children'
 when age <=19 then 'Adolesent'
 when age <=39 then 'Young Adult'
 when age <=59 then 'Middle age'
 when age <=79 then 'Senior'
 else 'Elderly'
 end as Age_grading,count(Diagnosis),Diagnosis 
from visits_table VT
left join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by age_grading, Diagnosis
order by count(Diagnosis) desc;

-- d)-------------------- DENTAL DIAGNOSIS BY AGE AND GENDER----OPTION 1-------------------------
select PT.gender,
case  when age <=4 then 'Infants'
 when age <=12 then 'Children'
 when age <=19 then 'Adolesent'
 when age <=39 then 'Young Adult'
 when age <=59 then 'Middle age'
 when age <=79 then 'Senior'
 else 'Elderly'
 end as Age_grading,count(Diagnosis),Diagnosis 
from visits_table VT
left join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by Gender,age_grading,Diagnosis 
order by count(Diagnosis) desc;



-- 2a) WHAT ARE THE MOST PROVIDED TEATMENT TYPE
select treatment_type, count(treatment_type)
from visits_table
group by Treatment_type
order by count(Treatment_type) desc;


-- b) IS THERE A RELATIONSHIP BETWEEN TREATMENT TYPE AND DIAGNOSIS
select 
Diagnosis,count(*),
sum(case when Treatment_type='Filling and ohi' then 1 else null end) as 'Filling and ohi',
sum(case when Treatment_type='Relining ' then 1 else null end) as 'Relining ',
sum(case when Treatment_type='Scaling and ohi' then 1 else null end) as 'Scaling and ohi',
sum(case when Treatment_type='Imf using eyelet wire' then 1 else null end ) as'Imf using eyelet wire',
sum(case when treatment_type ='Incision and drainage/extraction/drugs' then 1 else null end) as 'Incision and drainage/extraction/drugs',
sum(case when treatment_type ='Extraction and ohi'then 1 else null end) as 'Extraction and ohi',
sum(case when Treatment_type='Scaling and extraction' then 1 else null end) as 'Scaling and extraction',
sum(case when Treatment_type='Scaling and filling' then 1 else null end) as'Scaling and filling',
sum(case when Treatment_type='Removing of suture'then 1 else null  end ) as 'Removing of suture',
sum(case when Treatment_type='Rferral'then 1 else null end) as 'Rferral',
sum(case when Treatment_type='Extraction and filling' then 1 else null end)as 'Extraction and filling',
sum(case when Treatment_type='Extraction/addition' then 1 else null end) as 'Extraction/addition',
sum(case when treatment_type='Removal and cleaning of denture' then 1 else null end) as'Removal and cleaning of denture',
sum(case when Treatment_type='Extraction of retained root'then 1 else 0 end) as'Extraction of retained root',
sum(case when Treatment_type='Repair' then 1 else null end ) as 'Repair',
sum(case when treatment_type ='Construction of new denture' then 1 else null end ) as 'Construction of new denture',
sum(case when Treatment_type='Gold crown fixing'then 1 else null end ) as 'Gold crown fixing',
sum(case when treatment_type='Scaling/replacement'then 1 else null end ) as 'Scaling/replacement',
sum(case when Treatment_type='Cover with compsite resin'then 1 else null end) as 'Cover with compsite resin',
sum(case when Treatment_type='Denture construction' then 1 else null end) as'Denture construction',
sum(case when Treatment_type='Removal of eyelet wire'then 1 else null end) as 'Removal of eyelet wire',
sum(case when Treatment_type='Rebasing'then 1 else null end) as 'Rebasing',
sum(case when Treatment_type ='Reimplatation' then 1 else null end ) as 'Reimplatation',
sum(case when Treatment_type='Extraction/drugs/ohi'then 1 else null end) as 'Extraction/drugs/ohi',
sum(case when Treatment_type='Remove denture/clean denture/drugs/ohi' then 1 else null end ) as 'Remove denture/clean denture/drugs/ohi',
sum(case when Treatment_type='Drugs/ohi'then 1 else null end) as 'Drugs/ohi',
sum(case when Treatment_type='Ohi'then 1 else null end ) as 'Ohi',
sum(case when Treatment_cost='Construction of night guard 'then 1 else null end) as 'Construction of night guard ',
sum(case when Treatment_type='Cleaning dentute/durgs/ohi'then 1 else null end) as 'Cleaning dentute/durgs/ohi',
sum( case when treatment_type='Extraction and replacement' then 1 else null end) as 'Extraction and replacement',
sum(case when Treatment_type='Scaling/extraction/ohi' then 1 else null end) as 'Scaling/extraction/ohi',
sum( case when Treatment_type='Scaling and denture construction' then 1 else null end) as 'Scaling and denture construction',
sum( case when Treatment_type='Addition' then 1 else null end) as 'Addition',
sum(case when Treatment_type='Scaling/extraction/replacement' then 1 else null end )as'Scaling/extraction/replacement',
sum(case when Treatment_type='Filling/drugs' then 1 else null end) as 'Filling/drugs',
sum(case when Treatment_type='Scaling/extraction of lossed teeth/ohi/drugs' then 1 else null end)'Scaling/extraction of lossed teeth/ohi/drugs',
sum(case when Treatment_type='Scaling/extraction/drugs/ohi' then 1 else null end) as 'Scaling/extraction/drugs/ohi',
sum(case when Treatment_type='Scaling/removal of lossed teeth' then 1 else null end) as 'Scaling/removal of lossed teeth',
sum(case when Treatment_type='Scaling/filling/extraction' then 1 else null end) as 'Scaling/filling/extraction',
sum( case when treatment_type='Extraction/space mainters' then 1 else null end) as 'Extraction/space mainters',
sum(case when Treatment_type='3rd molar extraction'then 1 else null end) as '3rd molar extraction',
sum(case when Treatment_type='Cleaning/suturing' then 1 else null end) as 'Cleaning/suturing',
sum(case when Treatment_type='Rejected treatment' then 1 else null end ) as'Rejected treatment',
sum(case when Treatment_type ='Extraction/ohi' then 1 else null end) as 'Extraction/ohi',
sum(case when treatment_type ='Removing denture/scaling/drugs'then 1 else null end) as 'Removing denture/scaling/drugs',
sum(case when Treatment_type='Ohi/durgs'then 1 else null end) as 'Ohi/durgs',
sum( case when Treatment_type='Scaling/drugs/ohi'then 1 else null end) as 'Scaling/drugs/ohi'
from visits_table group by Diagnosis order by count(*) desc;
-- b) IS THERE A RELATIONSHIP BETWEEN TREATMENT TYPE AND DIAGNOSIS-- OPTION 2--
select diagnosis,treatment_type,count(*) as 'relationship between diagnosis and treatment type'
from visits_table group by Diagnosis,Treatment_type
order by count(*) desc;

-- c) HOW OFTEN ARE DENTURE REQUESTED BY A PATIENTS AND WHICH TYPE OF DENTURE
select Denture_on_patients_request, Type_of_denture, count(*) 
from visits_table where Denture_on_patients_request='yes'
group by Denture_on_patients_request, Type_of_denture
order by count(*);

-- 3) WHICH CONDTIONS REQUIRE FREQUNETLY ADMISSION THE MOST
select Diagnosis,Admission_Required,count(*) from visits_table
where Admission_Required='Yes'
group by Diagnosis order by count(*) desc;


-- 4) WHAT IS THE AVERAGE TREATMENT COST PER PATIENTS
select ceiling( avg(Treatment_cost))  from visits_table;

-- 4b)  SUM OF COST OF TREATMENT
select sum(treatment_cost) from visits_table;

-- 4c) WHAT IS THE SUM OF COST OF DENTURE COMPARED TO OTHER TREARMENT
select round(sum(case when Cost_of_denture is not null then Cost_of_denture end )) as_sum_cost_of_denture,
round (sum(case when Cost_of_denture is null then treatment_cost end)) as sum_cost_of_other_treatment
from visits_table; 

-- 5) HOW DOES COST VARIES ACROSS TEATMENT
select Treatment_type,sum(Treatment_cost) from visits_table
group by Treatment_type order by sum(Treatment_cost) desc;

 -- 6) HOW DOES COST VARIES ACROSS THE DIFFERENT AGE GRADING
with age_grading as
(select
case
when age <=4 then 'Infants'
when age <=12 then 'Children'
when age <=19 then 'Adolesent'
when age <=39 then 'Young Adult'
when age <=59 then 'Middle age'
when age <=79 then 'Senior'
else 'Elderly'
end  age_grading,sum(treatment_cost) as total_cost
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
where age is not null
group by age_grading)
select age_grading,total_cost,sum(total_cost) over(order by age_grading) as runnng_total from age_grading order by total_cost desc; 
-- 6) HOW DOES COST VARIES ACROSS THE DIFFERENT AGE GRADING OPTION 2
select
case
when age <=4 then 'Infants'
when age <=12 then 'Children'
when age <=19 then 'Adolesent'
when age <=39 then 'Young Adult'
when age <=59 then 'Middle age'
when age <=79 then 'Senior'
else 'Elderly'
end  age_grading,count(*),sum(treatment_cost) as total_cost
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
where age is not null
group by age_grading
order by sum(Treatment_cost) desc;

-- 7) WHAT IS THE RATE OF REOCCURING PATIENTS
with patients_visit as(
select PT.patient_id,count(distinct visit_id) as num_of_patients_visit
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by PT.Patient_id)
select count(case when num_of_patients_visit > 1 then 1 end)  *100/count(*) as rate_of_reoccuring_patients,
count(case when num_of_patients_visit > 1 then 1 end) as reocurring_patients,
count(*) as total_patients from patients_visit;


-- 8) HOW MANY PATIENTS RETURN FOR THEIR CHECK
select count(distinct patient_id),follow_up_check_up
from visits_table where Follow_up_check_up='yes'
group by check_up,follow_up_check_up order by count(distinct patient_id) desc;


-- 9) WHICH DIAGNOSIS IS ASSOCIATED WITH HIGHER FOLLOW UP RATES
select diagnosis, Follow_up_check_up,count(*)
from visits_table where Follow_up_check_up='yes'
group by Diagnosis order by count(*) desc;


-- 10) HOW DOES THE NUMBER OF VISIT CHANGE OVER TIME
select date_format(VT.date_of_visit,'%Y-%m') as visit_month,
count(VT.visit_id) as num_of_visit_per_patient,count(distinct PT.Patient_id) as count_of_patient
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by visit_month
order by num_of_visit_per_patient desc ;

-- 11) ARE THERE SEASONAL SPIKES IN DENTAL VISIT MONTHLY
select month(date_of_visit) as month_number,
monthname(date_of_visit) as month_name,
count(visit_id) as num_of_patients_visit
from visits_table
group by month_name,month_number
order by num_of_patients_visit desc;

-- 12) ARE THERE SEASONAL SPIKES IN DENTAL VISIT QUARTERLY
select quarter(date_of_visit) as quarter_number,
count(visit_id) as number_of_visit
from visits_table
group by quarter_number
order by number_of_visit desc;

-- 13) WHAT TREATMENT TYPE CONUSUMe THE MOST RESOURESES 
select treatment_type,sum(treatment_cost)
from visits_table group by Treatment_type
order by sum(Treatment_cost) desc;

-- 14) WHAT PROPOTION OF PATIENTS REQUUIRES DENTURE
select 
count(distinct case when Denture_on_patients_request='yes' then patient_id end) * 100/count(distinct patient_id) as denture_request_rate,
count(distinct case when Denture_on_patients_request='yes' then patient_id end) as patients_Who_requested_denture,
count(distinct patient_id) as total_patient from visits_table;

-- 14a) HOW DOES THIS VARIES IN GENDER
select PT.gender,
count(distinct case when  Denture_on_patients_request='yes' then VT.patient_id end) * 100/count(distinct VT.patient_id) as denture_request_rate,
count(distinct case when Denture_on_patients_request='yes' then VT.patient_id end) as patients_Who_requested_denture,
count(distinct VT.patient_id) as total_patient
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by PT.gender;

-- b) HOW DOES QUESTION 14 VARIES WITH THE DIFFRENT AGE GRADING
select 
case
when age <=4 then 'Infants'
when age <=12 then 'Children'
when age <=19 then 'Adolesent'
when age <=39 then 'Young Adult'
when age <=59 then 'Middle age'
when age <=79 then 'Senior'
else 'Elderly'
end  age_grading,
count(distinct case when  Denture_on_patients_request='yes' then VT.patient_id end) * 100/count(distinct VT.patient_id) as denture_request_rate,
count(distinct case when Denture_on_patients_request='yes' then VT.patient_id end) as patients_Who_requested_denture,
count(distinct VT.patient_id) as total_patient
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by age_grading
order by total_patient desc;


-- 15) ARE YOUNGER PATIENTS MORE LIKELY TO REQUEST PARTIAL WHILE OLDER PATIENTA REQUEST FULL DENTURE
Select 
case
when age <=4 then 'Infants'
when age <=12 then 'Children'
when age <=19 then 'Adolesent'
when age <=39 then 'Young Adult'
when age <=59 then 'Middle age'
when age <=79 then 'Senior'
else 'Elderly'
end  age_grading,VT.Type_of_denture,count(*) as total_request
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by age_grading,VT.Type_of_denture
order by total_request desc;

-- 15b) ARE YOUNGER PATIENTS MORE LIKELY TO REQUEST PARTIAL WHILE OLDER PATIENTA REQUEST FULL DENTURE OPTION 2
Select 
case
when age <=4 then 'Infants'
when age <=12 then 'Children'
when age <=19 then 'Adolesent'
when age <=39 then 'Young Adult'
when age <=59 then 'Middle age'
when age <=79 then 'Senior'
else 'Elderly'
end  age_grading,
sum(case when VT.Type_of_denture='partial'then 1 else null end) as partial_denture_request,
sum(case when VT.Type_of_denture like '%full%'then 1 else null end) as full_denture_request,
count(*) as total_denture_request
from visits_table VT
join patients_table PT
on VT.Patient_ID=PT.Patient_id
group by age_grading,VT.Type_of_denture
order by total_denture_request desc;

-- 16) WHAT IS THE AVERAGE TIME GAP BETWEEN DATE OF IMPRESSION AND DATE OF DENTURE FITTING
select round(avg(datediff(Date_of_denture_fitting,Date_of_impression)))as avg_time_gap
from visits_table where Date_of_denture_fitting is not null and Date_of_impression is not null;

-- 16b) WHAT IS THE MINIMUM AND MAXIMUM TIME GAP BETWEEN DATE OF IMPRESSION AND DATE OF DENTURE FITTING
select max(datediff(Date_of_denture_fitting,Date_of_impression)) as mix_date_gap,
min(datediff(Date_of_denture_fitting,Date_of_impression)) as min_date_gap
from visits_table where Date_of_denture_fitting is not null and Date_of_impression is not null;

-- 17 WHAT IS THE AVERAGE COST OF DENTURE COMPARED TO OTHER FORMS OF TREATMRNT TYPE
select round(avg(case when Cost_of_denture is not null then Cost_of_denture end )) as_avg_cost_of_denture,
round (avg(case when Cost_of_denture is null then treatment_cost end)) as avg_cost_of_other_treatment
from visits_table; 

-- 18) WHAT PERCENTAGE OF PATIENTS REPORTS BEING 'GOOD',PEMDING,VERY SATISFIED,SATISFIEG
select Patients_satisfaction,count(PT.patient_id) as num_of_patients,
ceiling(
       count(PT.patient_id)*100/(select count(PT.patient_id) from visits_table VT join patients_table PT
on VT.Patient_ID=PT.Patient_id))  as percentage_count from visits_table VT join patients_table PT
on VT.Patient_ID=PT.Patient_id where Patients_satisfaction in('Satisfied','Pending','Very satisfied','Okay')
group by Patients_satisfaction order by percentage_count desc;

-- 18b)  IS SATISFCATION LINKED TO TREATMENT TYPE, COST  OF DENTURE OR DENTURE FITTING SUCCESS
with denture_success as (	
						 select distinct Patient_id,
                         Treatment_type,
                         cost_of_denture,
                         patients_satisfaction,
                         case
                             when date_of_impression is not null and Date_of_denture_fitting is not null then 'denture_fitting_sucess'
                             when date_of_impression is not null and Date_of_denture_fitting is null then 'impression only'
                             else 'no denture attemped'
                             end as denture_satatus
from visits_table where Patients_satisfaction is not null)
select Treatment_type, denture_satatus,Patients_satisfaction,count(*) as num_of_visit,sum(cost_of_denture) as sum_of_denture
from denture_success group by treatment_type ,denture_satatus,Patients_satisfaction
order by sum_of_denture desc;

-- 18c) DOES DENTURE FITTING SUCCESS(WITH DATE OF IMPRESSION AND DATE OF FITTING) CORRELATE WITH HIGHER SATISIFACTION COMPARE WITH OTHER TREATMENT TYPE
with treatment as (
					select visit_id,PT.patient_id,patients_satisfaction,
                    case 
                    when date_of_impression is not null and date_of_denture_fitting is not null then 'denture fittinf sucess'
                    when date_of_impression is not null and date_of_denture_fitting is null then 'impression only'
                    else 'other treatment'
                    end as types_of_treatment
                    from visits_table VT join patients_table PT
                    on VT.Patient_ID=PT.Patient_id where Patients_satisfaction is not null)
select types_of_treatment, patients_satisfaction,count(*) as num_visit,ceiling(count(*)*100/sum(count(*)) over( partition by types_of_treatment)) as satisfcation_rate
from treatment group by types_of_treatment, patients_satisfaction order by satisfcation_rate desc;


						
