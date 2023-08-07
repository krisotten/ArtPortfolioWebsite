/* 
ANALYSIS OF CONTRIBUTING FACTORS TO STUDENT DROPOUTS
Source of dataset: "Predict students dropout, academic success" on Kaggle
*/
----------------------------------------------------------------------------------------------

/* AGE */

-- List of ages of student dropouts
SELECT Age_at_enrollment
FROM PortfolioProject..StudentAcademicSuccess
WHERE Status_at_end_of_course = 'Dropout'

-- Average age of student dropouts
SELECT AVG(Age_at_enrollment)
FROM PortfolioProject..StudentAcademicSuccess
WHERE Status_at_end_of_course = 'Dropout'

-- Maximum age of student dropouts
SELECT MAX(Age_at_enrollment)
FROM PortfolioProject..StudentAcademicSuccess
WHERE Status_at_end_of_course = 'Dropout'

-- Minimum age of student dropouts
SELECT MIN(Age_at_enrollment)
FROM PortfolioProject..StudentAcademicSuccess
WHERE Status_at_end_of_course = 'Dropout'

----------------------------------------------------------------------------------------------

/* NEGATIVE VS. POSITIVE INFLATION */

-- Percent of dropouts when the inflation rate is negative vs. positive
SELECT 
((SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course = 'Dropout' AND Inflation_rate < 0.0)/(CAST(COUNT(*) AS float)))*100 AS '% of Dropouts in Negative Inflation',
((SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course = 'Dropout' AND Inflation_rate > 0.0)/(CAST(COUNT(*) AS float)))*100 AS '% of Dropouts in Positive Inflation'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Status_at_end_of_course = 'Dropout'

/*
FINDINGS:
The percentage of students who dropped out during periods of positive inflation is significantly higher than the percentage
of students who dropped out during periods of negative inflation with the percentage during positive inflation being 79.45%
and the percentage during negative inflation being 20.55%. This suggests that low economic conditions may influence increases 
in the number of student dropouts.
*/

----------------------------------------------------------------------------------------------

/* STEM RELATED COURSES VS. NON-STEM RELATED COURSES */

-- Identify STEM related fields
SELECT DISTINCT Course AS Courses
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

-- From looking at the results of this query, we find that the STEM related courses are:
-- Biofuel Production Technologies
-- Informatics Engineering
-- Nursing
-- Veterinary Nursing

-- Count of all students in STEM courses
SELECT COUNT(*) AS 'Students in STEM courses'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Course LIKE 'Biofuel Production Technologies'
OR Course LIKE 'Informatics Engineering'
OR Course LIKE 'Nursing'
OR Course LIKE 'Veterinary Nursing'

-- Count of all student drop outs in STEM courses
SELECT COUNT(*) AS 'Dropouts in STEM courses'
FROM PortfolioProject..StudentAcademicSuccess
WHERE (Course LIKE 'Biofuel Production Technologies'
OR Course LIKE 'Informatics Engineering'
OR Course LIKE 'Nursing'
OR Course LIKE 'Veterinary Nursing')
AND Status_at_end_of_course = 'Dropout'

-- Percentage of dropouts in STEM related courses
SELECT (CAST(COUNT(*) AS float) / 
    (SELECT COUNT(*)
    FROM PortfolioProject..StudentAcademicSuccess
    WHERE Course LIKE 'Biofuel Production Technologies'
    OR Course LIKE 'Informatics Engineering'
    OR Course LIKE 'Nursing'
    OR Course LIKE 'Veterinary Nursing'))*100
    AS '% of Dropouts in STEM courses'
FROM PortfolioProject..StudentAcademicSuccess
WHERE (Course LIKE 'Biofuel Production Technologies'
OR Course LIKE 'Informatics Engineering'
OR Course LIKE 'Nursing'
OR Course LIKE 'Veterinary Nursing')
AND Status_at_end_of_course = 'Dropout'

-- Count of all students in non-STEM related courses
SELECT COUNT(*) AS 'Students in non-STEM courses'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Course NOT LIKE 'Biofuel Production Technologies'
AND Course NOT LIKE 'Informatics Engineering'
AND Course NOT LIKE 'Nursing'
AND Course NOT LIKE 'Veterinary Nursing'

-- Count of all student dropouts in non-STEM related courses
SELECT COUNT(*) AS 'Dropouts in non-STEM courses'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Course NOT LIKE 'Biofuel Production Technologies'
AND Course NOT LIKE 'Informatics Engineering'
AND Course NOT LIKE 'Nursing'
AND Course NOT LIKE 'Veterinary Nursing'
AND Status_at_end_of_course = 'Dropout'

-- Percentage of dropouts in non-STEM related courses
SELECT (CAST(COUNT(*) AS float) / 
    (SELECT COUNT(*)
    FROM PortfolioProject..StudentAcademicSuccess
    WHERE Course NOT LIKE 'Biofuel Production Technologies'
    AND Course NOT LIKE 'Informatics Engineering'
    AND Course NOT LIKE 'Nursing'
    AND Course NOT LIKE 'Veterinary Nursing'))*100
    AS '% of Dropouts in non-STEM courses'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Course NOT LIKE 'Biofuel Production Technologies'
AND Course NOT LIKE 'Informatics Engineering'
AND Course NOT LIKE 'Nursing'
AND Course NOT LIKE 'Veterinary Nursing'
AND Status_at_end_of_course = 'Dropout'

/* 
FINDINGS:
Overall, the percentage of student dropouts in non-STEM related courses is higher than the percentage
of student dropouts in STEM related courses with a total percent of 35.36% versus 23.97%.Within the 
dataset, there are more than double the amount of students enrolled in non-STEM related courses as there 
are students enrolled in STEM related courses. This could play a role in the lower percentage of student 
dropouts in non-STEM related courses vs. STEM related courses. 
*/

----------------------------------------------------------------------------------------------

/* MALE VS. FEMALE */

-- Count of all female dropouts
SELECT COUNT(*) AS 'Female Dropouts'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Gender = 'Female'
AND Status_at_end_of_course = 'Dropout'

-- Count of all females in dataset
SELECT COUNT(*) AS 'Female Students'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Gender = 'Female'

-- Percentage of female dropouts
SELECT (CAST(COUNT(*) AS float) / 
    (SELECT COUNT(*)
    FROM PortfolioProject..StudentAcademicSuccess
    WHERE Gender = 'Female'))*100
    AS '% of Female Dropouts'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Gender = 'Female'
AND Status_at_end_of_course = 'Dropout'

-- Count of all male dropouts
SELECT COUNT(*) AS 'Male Dropouts'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Gender = 'Male'
AND Status_at_end_of_course = 'Dropout'

-- Count of all males in dataset
SELECT COUNT(*) AS 'Male Students'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Gender = 'Male'

-- Percentage of male dropouts
SELECT (CAST(COUNT(*) AS float) / 
    (SELECT COUNT(*)
    FROM PortfolioProject..StudentAcademicSuccess
    WHERE Gender = 'Male'))*100
    AS '% of Male Dropouts'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Gender = 'Male'
AND Status_at_end_of_course = 'Dropout'

/* 
FINDINGS:
Overall, the percentage of male dropouts within the dataset is higher than the percentage of female
dropouts with a total percent of 45.05% compared to 25.11%. This is interesting considering that the amount
of females within the dataset is almost double the amount of males within the dataset yet the percentage of
dropouts among males is nearly double that of females. 
*/

----------------------------------------------------------------------------------------------

/* DEBTORS VS. NON-DEBTORS */

-- Total students who are debtors AND behind on paying tuition
SELECT COUNT(*) AS 'Debtors & Behind on Tuition'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'Yes'
AND Tuition_fees_up_to_date = 'No'

-- Dropouts who are debtors AND behind on paying tuition
SELECT COUNT(*) AS 'Debtors & Behind on Tuition'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'Yes'
AND Tuition_fees_up_to_date = 'No'
AND Status_at_end_of_course = 'Dropout'

-- Percentage of dropouts in students who are debtors AND behind on paying tuition
SELECT (CAST(COUNT(*) AS float) / 
    (SELECT COUNT(*)
    FROM PortfolioProject..StudentAcademicSuccess
    WHERE Debtor = 'Yes'
    AND Tuition_fees_up_to_date = 'No'))*100
    AS '% of Dropouts who are Debtors & Behind on Tuition'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'Yes'
AND Tuition_fees_up_to_date = 'No'
AND Status_at_end_of_course = 'Dropout'

-- Total students who are debtors OR behind on paying tuition
SELECT COUNT(*) AS 'Debtors or Behind on Tuition'
FROM PortfolioProject..StudentAcademicSuccess
WHERE (Debtor = 'Yes' AND Tuition_fees_up_to_date = 'Yes')
OR (Tuition_fees_up_to_date = 'No' AND Debtor = 'No')

-- Dropouts who are debtors OR behind on paying tuition
SELECT COUNT(*) AS 'Debtors or Behind on Tuition'
FROM PortfolioProject..StudentAcademicSuccess
WHERE ((Debtor = 'Yes' AND Tuition_fees_up_to_date = 'Yes')
OR (Tuition_fees_up_to_date = 'No' AND Debtor = 'No'))
AND Status_at_end_of_course = 'Dropout'

-- Percentage of dropouts in students who are debtors OR behind on paying tuition
SELECT (CAST(COUNT(*) AS float) / 
    (SELECT COUNT(*)
    FROM PortfolioProject..StudentAcademicSuccess
    WHERE (Debtor = 'Yes' AND Tuition_fees_up_to_date = 'Yes')
    OR (Tuition_fees_up_to_date = 'No' AND Debtor = 'No')))*100
    AS '% of Dropouts in Debtors or Student Behind on Tuition'
FROM PortfolioProject..StudentAcademicSuccess
WHERE ((Debtor = 'Yes' AND Tuition_fees_up_to_date = 'Yes')
OR (Tuition_fees_up_to_date = 'No' AND Debtor = 'No'))
AND Status_at_end_of_course = 'Dropout'

-- Total students who are NOT debtors or behind on paying tuition
SELECT COUNT(*) AS 'Non-Debtors'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'No'
AND Tuition_fees_up_to_date = 'Yes'

-- Total dropouts who are NOT debtors or behind on paying tuition
SELECT COUNT(*) AS 'Non-Debtor Dropouts'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'No'
AND Tuition_fees_up_to_date = 'Yes'
AND Status_at_end_of_course = 'Dropout'

-- Percentage of dropouts in students who are NOT debtors or behind on paying tuition
SELECT (CAST(COUNT(*) AS float) / 
    (SELECT COUNT(*) AS 'Non-Debtors'
    FROM PortfolioProject..StudentAcademicSuccess
    WHERE Debtor = 'No'
    AND Tuition_fees_up_to_date = 'Yes'))*100
    AS '% of Dropouts in Non-Debtors'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'No'
AND Tuition_fees_up_to_date = 'Yes'
AND Status_at_end_of_course = 'Dropout'

/*
FINDINGS: 
Previously, I predicted that the percentage of dropouts among debtors would be higher than that of
non-debtors because financial circumstances can play a large role in student success. The findings
supported my prediction with students who were both dropouts and behind on tuition having the highest
percentage of dropouts at 87.40%. This is compared to students who were either only debtors or 
only behind on tuition with the percentage of dropouts in these students being 62.89%. As predicted,
students who were neither debtors nor behind on tuition had the lowest percentage of dropouts at
23.83%
*/

/* FOLLOW UP Q: What is the age range of students who are debtors/behind on tuition? */

-- Ages of students who are debtors & behind on tuition
SELECT Age_at_enrollment
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'Yes'
AND Tuition_fees_up_to_date = 'No'
ORDER BY 1

-- Average age of students who are debtors & behind on tuition
SELECT AVG(Age_at_enrollment)
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'Yes'
AND Tuition_fees_up_to_date = 'No'

-- Oldest student who is a debtor & behind on tuition
SELECT MAX(Age_at_enrollment)
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'Yes'
AND Tuition_fees_up_to_date = 'No'

-- Youngest student who is a debtor & behind on tuition
SELECT MIN(Age_at_enrollment)
FROM PortfolioProject..StudentAcademicSuccess
WHERE Debtor = 'Yes'
AND Tuition_fees_up_to_date = 'No'

----------------------------------------------------------------------------------------------

/* GRADE AVERAGE 
Does a student’s grade average impact their likelihood to dropout?
*/

-- Grade averages for dropouts
SELECT AVG(Grade_average_1st_sem) AS '1st Sem Grade Average',
AVG(Grade_average_2nd_sem) AS '2nd Sem Grade Average'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Status_at_end_of_course = 'Dropout'

-- Grade averages for non-dropouts
SELECT AVG(Grade_average_1st_sem) AS '1st Sem Grade Average',
AVG(Grade_average_2nd_sem) AS '2nd Sem Grade Average'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Status_at_end_of_course != 'Dropout'

/*
FINDINGS:
Overall, grade averages for non-dropouts are higher than grade averages for dropouts across both
semesters. For non-dropouts, the grade average was rougly 12 for both semesters while dropouts had
a grade average of 7.26 first semester and 5.9 second semester.
*/

----------------------------------------------------------------------------------------------

/* MARITAL STATUS */

-- Percent of married students in dataset
SELECT CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess) AS 'Married Students'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Marital_status = 'Married'

-- Percent of single dropouts
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course='Dropout'))*100
AS '% of Single Dropouts'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Marital_status = 'Single'
AND Status_at_end_of_course = 'Dropout'

-- Percent of married dropouts
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course='Dropout'))*100
AS '% of Married Dropouts'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Marital_status = 'Married'
AND Status_at_end_of_course = 'Dropout'

/*
FINDINGS:
The percentage of dropouts who are single is significantly higher than the percentage of dropouts who are married with
the percentage of single dropouts being 83.32% and the percentage of married dropouts being 12.60%. However, these numbers
are not surprising considering that less than 1% of students in the dataset are married. 
*/

/* FOLLOW UP Q: What is the age range of students who are married? */

-- Ages of students who are married
SELECT Age_at_enrollment AS 'Ages of Married Students'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Marital_status = 'Married'
ORDER BY 1

-- Average age of students who are married
SELECT AVG(Age_at_enrollment) AS 'Average Age of Married Students'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Marital_status = 'Married'

-- Oldest student who is married
SELECT MAX(Age_at_enrollment) AS 'Max Age of Married Students'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Marital_status = 'Married'

-- Youngest student who is married
SELECT MIN(Age_at_enrollment) AS 'Min Age of Married Students'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Marital_status = 'Married'

----------------------------------------------------------------------------------------------

/* DAYTIME VS. EVENING COURSES */

-- Percentage of all students taking classes during the daytime
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess))*100 AS '% of Students with Daytime Attendance'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Daytime_evening_attendance = 'Daytime'

-- Percentage of all students taking classes during the evening
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess))*100 AS '% of Students with Daytime Attendance'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Daytime_evening_attendance = 'Evening'

-- Count of dropouts that attended class during the daytime
SELECT COUNT(*) AS 'Dropouts with Daytime Attendance'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Daytime_evening_attendance = 'Daytime'
AND Status_at_end_of_course = 'Dropout'

-- Percentage of dropouts that attended class during the daytime
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course='Dropout'))*100
AS '% of Dropouts with Daytime Attendance'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Daytime_evening_attendance = 'Daytime'
AND Status_at_end_of_course = 'Dropout'

-- Count of dropouts that attended class during the evening
SELECT COUNT(*) AS 'Dropouts with Evening Attendance'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Daytime_evening_attendance = 'Evening'
AND Status_at_end_of_course = 'Dropout'

-- Percentage of dropouts that attended class during the evening
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course='Dropout'))*100
AS '% of Dropouts with Evening Attendance'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Daytime_evening_attendance = 'Evening'
AND Status_at_end_of_course = 'Dropout'

/*
FINDINGS:
The majority of dropouts attended class during the daytime with 85.43% taking classes during the daytime and only 14.57%
attending classes during the evening. This isn't surprising considering that 89% of students within the dataset attended 
class during the daytime. 
*/

----------------------------------------------------------------------------------------------

/* PARENTS' EDUCATION 
How do students with neither parent having a college degree compare to students with one or both parents having college
degrees when it comes to percentage of dropouts?
 
We will be looking specifically at these values for Mothers_qualification & Fathers_qualification:
    Higher Education - Bachelor's Degree
    Higher Education - Degree
    Higher education - degree (1st cycle)
    Higher Education - Doctorate
    Higher Education - Doctorate (3rd cycle)
    Higher Education - Master (2nd cycle)
    Higher Education - Master's
*/

-- Dropouts with both parents having higher education 
SELECT COUNT(*) AS 'Dropouts with Both Parents Having Higher Ed'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Mothers_qualification LIKE 'Higher Education%'
AND Fathers_qualification LIKE 'Higher Education%'
AND Status_at_end_of_course = 'Dropout'

-- Percent of dropouts with both parents having higher education 
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course='Dropout'))*100
AS '% of Dropouts with Both Parents Having Higher Ed'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Mothers_qualification LIKE 'Higher Education%'
AND Fathers_qualification LIKE 'Higher Education%'
AND Status_at_end_of_course = 'Dropout'

-- Dropouts with only one parent having higher education
SELECT COUNT(*) AS 'Dropouts with One Parents Having Higher Ed'
FROM PortfolioProject..StudentAcademicSuccess
WHERE ((Mothers_qualification LIKE 'Higher Education%'
AND Fathers_qualification NOT LIKE 'Higher Education%')
OR (Mothers_qualification NOT LIKE 'Higher Education%'
AND Fathers_qualification LIKE 'Higher Education%'))
AND Status_at_end_of_course = 'Dropout'

-- Percent of dropouts with only one parent having higher education 
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course='Dropout'))*100
AS '% of Dropouts with One Parents Having Higher Ed'
FROM PortfolioProject..StudentAcademicSuccess
WHERE ((Mothers_qualification LIKE 'Higher Education%'
AND Fathers_qualification NOT LIKE 'Higher Education%')
OR (Mothers_qualification NOT LIKE 'Higher Education%'
AND Fathers_qualification LIKE 'Higher Education%'))
AND Status_at_end_of_course = 'Dropout'

-- Dropouts with neither parent having higher education
SELECT COUNT(*) AS 'Dropouts with Neither Parents Having Higher Ed'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Mothers_qualification NOT LIKE 'Higher Education%'
AND Fathers_qualification NOT LIKE 'Higher Education%'
AND Status_at_end_of_course = 'Dropout'

-- Percent of dropouts with neither parent having higher education 
SELECT (CAST(COUNT(*) AS float)/(SELECT COUNT(*) FROM PortfolioProject..StudentAcademicSuccess WHERE Status_at_end_of_course='Dropout'))*100
AS '% of Dropouts with Neither Parents Having Higher Ed'
FROM PortfolioProject..StudentAcademicSuccess
WHERE Mothers_qualification NOT LIKE 'Higher Education%'
AND Fathers_qualification NOT LIKE 'Higher Education%'
AND Status_at_end_of_course = 'Dropout'

/*
FINDINGS:
I predicted that students with one or both parents having higher education would make up a lower percentage of student
dropouts. These queries support this prediction with the percentage of dropouts having both parents with a background in 
higher education being 5.63% while dropouts with only one parent in higher education had a percentage of 11.26%. Finally,
the majority of dropouts had parents who didn't have a background in higher education with a total percentage of 83.11%.
*/

