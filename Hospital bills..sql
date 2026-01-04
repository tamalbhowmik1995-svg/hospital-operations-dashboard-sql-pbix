show databases;
create database database6;
use database6;
select * from doctors;
select * from patient;
select * from billings;
select * from appointments;
select * from treatments;
--Doctors Morethan 10 Years Experiance--
select first_name, last_name, specialization, years_experience
from doctors
where years_experience > 10;
--Show all Register Patients in Last 6 Month--
select first_name, last_name, registration_date
from patient
where registration_date >= curdate() - interval 6 Month;
--Appointment Details with Doctors--
select a.appointment_id, p.first_name, p.last_name, d.first_name, d.last_name, a.appointment_date, a.appointment_time, a.status
from appointments a
join patient p on a.patient_id=p.patient_id
join doctors d on a.doctor_id=d.doctor_id;
--Treatment Given to Each Patient--
select p.first_name, p.last_name, t.treatment_type, b.amount, t.description, t.treatment_date
from patient p
join appointments a on a.patient_id=p.patient_id
join treatments t on a.appointment_id=t.appointment_id
join billings b on b.treatment_id=t.treatment_id;
--Total Treatment Cost per Patient--
select p.first_name, p.last_name,
round(sum(b.amount), 2) as Total_Cost
from patient p
join billings b on b.patient_id=b.patient_id
group by p.first_name, p.last_name
order by Total_Cost desc;
--Number of Appointment Handeled by Each Doctor--
select d.first_name, d.last_name,
count(a.appointment_id) as Total_Appointments
from doctors d
join appointments a on a.doctor_id=d.doctor_id
group by d.first_name, d.last_name
order by Total_Appointments desc;
--Patient with Pending and Failed bills--
select p.first_name, p.last_name, b.payment_status
from patient p
join billings b on p.patient_id=b.patient_id
where b.payment_status in ('Pending', 'Failed');
--Payment Method wise Billing Count--
select payment_method, count(*) as Total_Payment
from billings
group by Payment_method
order by Total_Payment desc;
--Doctor Who Treted morethan 20 Patient--
select d.first_name, d.last_name, count(distinct a.patient_id) as Patient_Count
from doctors d
join appointments a on d.doctor_id=a.doctor_id
group by d.first_name, d.last_name
having Patient_Count > 20;
--Most Expensive Treatment--
select treatment_type, cost
from treatments
order by cost desc
limit 1;
--Patient Never had an Appontment--
select first_name, last_name
from patient
where patient_id not in (select distinct patient_id from appointments);
--Rank Doctors by Total Revenue Generated--
select d.first_name, d.last_name, sum(b.amount) as Revenue,
rank() over (order by sum(b.amount) desc) as Revenue_Rank
from doctors d
join appointments a on d.doctor_id=a.doctor_id
join treatments t on t.appointment_id=a.appointment_id
join billings b on b.treatment_id=t.treatment_id
group by d.first_name, d.last_name;
--Monthly Revenue Report--
select date_format(t.treatment_date, '%Y-%m') as month,
sum(b.amount) as Total_Revenue
from treatments t
join billings b on b.treatment_id=t.treatment_id
group by month
order by month;
--Highest Value Patients--
select p.first_name, p.last_name, round(sum(b.amount),2) as Total_Amount
from patient p
join appointments a on p.patient_id=a.patient_id
join treatments t on a.appointment_id=t.appointment_id
join billings b on b.treatment_id=t.treatment_id
group by p.first_name, p.last_name
having Total_Amount > 30000;
--Brunch Wise Doctors Performance--
select d.hospital_branch,
round(sum(b.amount),2) as Branch_Revenue
from doctors d
join appointments a on d.doctor_id=a.doctor_id
join treatments t on t.appointment_id=a.appointment_id
join billings b on b.treatment_id=t.treatment_id
group by d.hospital_branch
order by Branch_Revenue desc;
--Peak Appointment Days--
select appointment_date,
count(*) as Appointment_count
from appointments
group by appointment_date
order by Appointment_count desc;
--Revenue Contribution By Doctors--
select d.first_name, d.last_name, round(sum(b.amount),2) as Revenue
from doctors d
join appointments a on a.doctor_id=a.doctor_id
join treatments t on a.appointment_id=t.appointment_id
join billings b on b.treatment_id=t.treatment_id
group by d.first_name, d.last_name
order by sum(b.amount) desc;
--Repeate Patient Rate--
select
count(*) as Repeat_Patients
from(select patient_id
from appointments
group by patient_id
having count(*) > 1)
rp;
--Average Revenue Per Patients--
select round(sum(b.amount)/count(distinct p.patient_id),2) as Average_Revenue_Patient
from patient p
join appointments a on p.patient_id=a.patient_id
join treatments t on a.appointment_id=t.appointment_id
join billings b on b.treatment_id=t.treatment_id;
--Most Common treatment--
select treatment_type, count(*) as Common_Treatment
from treatments
group by treatment_type
order by Common_Treatment desc;
--Most Insurance Provider--
select insurance_provider, count(*) as Top_Provider
from patient 
group by insurance_Provider
order by Top_Provider desc;

