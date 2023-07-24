-- DATA CLEANING STUDENT ACADEMIC SUCCESS DATASET
-- Source of dataset: "Predict students dropout, academic success" on Kaggle
/*
Values in this dataset are represented as numbers corresponding to certain categories. Throughout the following queries,
I will be replacing these numbers with the correct value in order to make the data more clear. 
*/
------------------------------------------------------------------
/*
MARITAL_STATUS:
1 – single 
2 – married 
3 – widower 
4 – divorced 
5 – facto union 
6 – legally separated
*/

-- Update statements 
UPDATE PortfolioProject..StudentAcademicSuccess
SET Marital_status = CASE Marital_status
WHEN CAST(1 AS NVARCHAR) THEN 'single'
WHEN CAST(2 AS NVARCHAR) THEN 'married'
WHEN CAST(3 AS NVARCHAR) THEN 'divorced'
WHEN CAST(4 AS NVARCHAR) THEN 'facto union'
WHEN CAST(5 AS NVARCHAR) THEN 'legally separated'
ELSE Marital_status
END

-- Confirm values were updated correctly
SELECT DISTINCT Marital_status
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
APPLICATION_MODE:
1 - 1st phase - general contingent 
2 - Ordinance No. 612/93 
3 - 1st phase - special contingent (Azores Island) 
4 - Holders of other higher courses 
5 - Ordinance No. 854-B/99 
6 - International student (bachelor) 
7 - 1st phase - special contingent (Madeira Island) 
8 - 2nd phase - general contingent 
9 - 3rd phase - general contingent 
10 - Ordinance No. 533-A/99, item b2) (Different Plan) 
11 - Ordinance No. 533-A/99, item b3 (Other Institution) 
12 - Over 23 years old 
13 - Transfer 
14 - Change of course 
15 - Technological specialization diploma holders 
16 - Change of institution/course 
17 - Short cycle diploma holders 
18 - Change of institution/course (International)
*/

-- Update Statements
UPDATE PortfolioProject..StudentAcademicSuccess
SET Application_mode = CASE Application_mode
WHEN CAST(1 AS NVARCHAR) THEN '1st phase - general contingent'
WHEN CAST(2 AS NVARCHAR) THEN 'Ordinance No. 612/93'
WHEN CAST(3 AS NVARCHAR) THEN '1st phase - special contingent (Azores Island)'
WHEN CAST(4 AS NVARCHAR) THEN 'Holders of other higher courses'
WHEN CAST(5 AS NVARCHAR) THEN 'Ordinance No. 854-B/99'
WHEN CAST(6 AS NVARCHAR) THEN 'International student (bachelor)'
WHEN CAST(7 AS NVARCHAR) THEN '1st phase - special contingent (Madeira Island)'
WHEN CAST(8 AS NVARCHAR) THEN '2nd phase - general contingent'
WHEN CAST(9 AS NVARCHAR) THEN '3rd phase - general contingent'
WHEN CAST(10 AS NVARCHAR) THEN 'Ordinance No. 533-A/99, item b2) (Different Plan)'
WHEN CAST(11 AS NVARCHAR) THEN 'Ordinance No. 533-A/99, item b3 (Other Institution)'
WHEN CAST(12 AS NVARCHAR) THEN 'Over 23 years old'
WHEN CAST(13 AS NVARCHAR) THEN 'Transfer'
WHEN CAST(14 AS NVARCHAR) THEN 'Change of course'
WHEN CAST(15 AS NVARCHAR) THEN 'Technological specialization diploma holders'
WHEN CAST(16 AS NVARCHAR) THEN 'Change of institution/course'
WHEN CAST(17 AS NVARCHAR) THEN 'Short cycle diploma holders'
WHEN CAST(18 AS NVARCHAR) THEN 'Change of institution/course (International)'
ELSE Application_mode
END

-- Confirm values have been updated
SELECT DISTINCT Application_mode
FROM PortfolioProject..StudentAcademicSuccess
GROUP BY Application_mode
ORDER BY 1 

------------------------------------------------------------------

/*
COURSE:
1 - Biofuel Production Technologies
2 - Animation and Multimedia Design
3 - Social Service (evening attendance)
4 - Agronomy
5 - Communication Design
6 - Veterinary Nursing
7 - Informatics Engineering
8 - Equinculture
9 - Management
10 - Social Service
11 - Tourism
12 - Nursing
13 - Oral Hygiene
14 - Advertising and Marketing Management
15 - Journalism and Communication
16 - Basic Education
17 - Management (evening attendance)
*/

--Update Statements
UPDATE PortfolioProject..StudentAcademicSuccess
SET Course = CASE Course
WHEN CAST(1 AS NVARCHAR) THEN 'Biofuel Production Technologies'
WHEN CAST(2 AS NVARCHAR) THEN 'Animation and Multimedia Design'
WHEN CAST(3 AS NVARCHAR) THEN 'Social Service (evening attendance)'
WHEN CAST(4 AS NVARCHAR) THEN 'Agronomy'
WHEN CAST(5 AS NVARCHAR) THEN 'Communication Design'
WHEN CAST(6 AS NVARCHAR) THEN 'Veterinary Nursing'
WHEN CAST(7 AS NVARCHAR) THEN 'Informatics Engineering'
WHEN CAST(8 AS NVARCHAR) THEN 'Equinculture'
WHEN CAST(9 AS NVARCHAR) THEN 'Management'
WHEN CAST(10 AS NVARCHAR) THEN 'Social Service'
WHEN CAST(11 AS NVARCHAR) THEN 'Tourism'
WHEN CAST(12 AS NVARCHAR) THEN 'Nursing'
WHEN CAST(13 AS NVARCHAR) THEN 'Oral Hygiene'
WHEN CAST(14 AS NVARCHAR) THEN 'Advertising and Marketing Management'
WHEN CAST(15 AS NVARCHAR) THEN 'Journalism and Communication'
WHEN CAST(16 AS NVARCHAR) THEN 'Basic Education'
WHEN CAST(17 AS NVARCHAR) THEN 'Management (evening attendance)'
ELSE Course
END

-- Confirm values have been updated
SELECT DISTINCT Course 
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
DAYTIME_EVENING_ATTENDANCE:
1 – daytime
0 - evening
*/

-- Update Statements
UPDATE PortfolioProject..StudentAcademicSuccess
SET Daytime_evening_attendance = CASE Daytime_evening_attendance
WHEN CAST(0 AS NVARCHAR) THEN 'Evening'
WHEN CAST(1 AS NVARCHAR) THEN 'Daytime'
ELSE Daytime_evening_attendance
END

-- Confirm values have been updated correctly
SELECT DISTINCT Daytime_evening_attendance
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
PREVIOUS_QUALIFICATION:
1 - Secondary education
2 - Higher education - bachelor's degree
3 - Higher education - degree
4 - Higher education - master's
5 - Higher education - doctorate
6 - Frequency of higher education
7 - 12th year of schooling - not completed
8 - 11th year of schooling - not completed
9 - Other - 11th year of schooling
10 - 10th year of schooling
11 - 10th year of schooling - not completed
12 - Basic education 3rd cycle (9th/10th/11th year) or equiv.
13 - Basic education 2nd cycle (6th/7th/8th year) or equiv.
14 - Technological specialization course
15 - Higher education - degree (1st cycle)
16 - Professional higher technical course
17 - Higher education - master (2nd cycle)
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET Previous_qualification = CASE Previous_qualification
WHEN CAST(1 AS NVARCHAR) THEN 'Secondary education'
WHEN CAST(2 AS NVARCHAR) THEN 'Higher education - bachelor''s degree'
WHEN CAST(3 AS NVARCHAR) THEN 'Higher education - degree'
WHEN CAST(4 AS NVARCHAR) THEN 'Higher education - master''s'
WHEN CAST(5 AS NVARCHAR) THEN 'Higher education - doctorate'
WHEN CAST(6 AS NVARCHAR) THEN 'Frequency of higher education'
WHEN CAST(7 AS NVARCHAR) THEN '12th year of schooling - not completed'
WHEN CAST(8 AS NVARCHAR) THEN '11th year of schooling - not completed'
WHEN CAST(9 AS NVARCHAR) THEN 'Other - 11th year of schooling'
WHEN CAST(10 AS NVARCHAR) THEN '10th year of schooling'
WHEN CAST(11 AS NVARCHAR) THEN '10th year of schooling - not completed'
WHEN CAST(12 AS NVARCHAR) THEN 'Basic education 3rd cycle (9th/10th/11th year) or equiv.'
WHEN CAST(13 AS NVARCHAR) THEN 'Basic education 2nd cycle (6th/7th/8th year) or equiv.'
WHEN CAST(14 AS NVARCHAR) THEN 'Technological specialization course'
WHEN CAST(15 AS NVARCHAR) THEN 'Higher education - degree (1st cycle)'
WHEN CAST(16 AS NVARCHAR) THEN 'Professional higher technical course'
WHEN CAST(17 AS NVARCHAR) THEN 'Higher education - master (2nd cycle)'
ELSE Previous_qualification
END

-- Check that values were updated correctly 
SELECT DISTINCT Previous_qualification
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
NATIONALITY:
1 - Portuguese
2 - German
3 - Spanish
4 - Italian
5 - Dutch
6 - English
7 - Lithuanian
8 - Angolan
9 - Cape Verdean
10 - Guinean
11 - Mozambican
12 - Santomean
13 - Turkish
14 - Brazilian
15 - Romanian
16 - Moldova (Republic of)
17 - Mexican
18 - Ukrainian
19 - Russian
20 - Cuban
21 - Colombian
*/

-- Update statements
UPDATE PortfolioProject..StudentAcademicSuccess
SET Nationality = CASE Nationality
WHEN CAST(1 AS NVARCHAR) THEN 'Portuguese'
WHEN CAST(2 AS NVARCHAR) THEN 'German'
WHEN CAST(3 AS NVARCHAR) THEN 'Spanish'
WHEN CAST(4 AS NVARCHAR) THEN 'Italian'
WHEN CAST(5 AS NVARCHAR) THEN 'Dutch'
WHEN CAST(6 AS NVARCHAR) THEN 'English'
WHEN CAST(7 AS NVARCHAR) THEN 'Lithuanian'
WHEN CAST(8 AS NVARCHAR) THEN 'Angolan'
WHEN CAST(9 AS NVARCHAR) THEN 'Cape Verdean'
WHEN CAST(10 AS NVARCHAR) THEN 'Guinean'
WHEN CAST(11 AS NVARCHAR) THEN 'Mozambican'
WHEN CAST(12 AS NVARCHAR) THEN 'Santomean'
WHEN CAST(13 AS NVARCHAR) THEN 'Turkish'
WHEN CAST(14 AS NVARCHAR) THEN 'Brazilian'
WHEN CAST(15 AS NVARCHAR) THEN 'Romanian'
WHEN CAST(16 AS NVARCHAR) THEN 'Moldova (Republic of)'
WHEN CAST(17 AS NVARCHAR) THEN 'Mexican'
WHEN CAST(18 AS NVARCHAR) THEN 'Ukrainian'
WHEN CAST(19 AS NVARCHAR) THEN 'Russian'
WHEN CAST(20 AS NVARCHAR) THEN 'Cuban'
WHEN CAST(21 AS NVARCHAR) THEN 'Colombian'
ELSE Nationality
END

-- Confirm values have been updated correctly
SELECT DISTINCT Nationality
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
MOTHERS_QUALIFICATION:
1 - Secondary Education - 12th Year of Schooling or Eq.
2 - Higher Education - Bachelor's Degree
3 - Higher Education - Degree
4 - Higher Education - Master's
5 - Higher Education - Doctorate
6 - Frequency of Higher Education
7 - 12th Year of Schooling - Not Completed 
8 - 11th Year of Schooling - Not Completed 
9 - 7th Year (Old) 
10 - Other - 11th Year of Schooling 
11 - 10th Year of Schooling 
12 - General commerce course 
13 - Basic Education 3rd Cycle (9th/10th/11th Year) or Equiv. 
14 - Technical-professional course 
15 - 7th year of schooling 
16 - 2nd cycle of the general high school course 
17 - 9th Year of Schooling - Not Completed 
18 - 8th year of schooling 
19 - Unknown 
20 - Can't read or write 
21 - Can read without having a 4th year of schooling 
22 - Basic education 1st cycle (4th/5th year) or equiv. 
23 - Basic Education 2nd Cycle (6th/7th/8th Year) or Equiv. 
24 - Technological specialization course 
25 - Higher education - degree (1st cycle) 
26 - Specialized higher studies course 
27 - Professional higher technical course 
28 - Higher Education - Master (2nd cycle) 
29 - Higher Education - Doctorate (3rd cycle)
*/

-- Update statements
UPDATE PortfolioProject..StudentAcademicSuccess
SET Mothers_qualification = CASE Mothers_qualification
WHEN CAST(1 AS NVARCHAR) THEN 'Secondary Education - 12th Year of Schooling or Eq.'
WHEN CAST(2 AS NVARCHAR) THEN 'Higher Education - Bachelor''s Degree'
WHEN CAST(3 AS NVARCHAR) THEN 'Higher Education - Degree'
WHEN CAST(4 AS NVARCHAR) THEN 'Higher Education - Master''s'
WHEN CAST(5 AS NVARCHAR) THEN 'Higher Education - Doctorate'
WHEN CAST(6 AS NVARCHAR) THEN 'Frequency of Higher Education'
WHEN CAST(7 AS NVARCHAR) THEN '12th Year of Schooling - Not Completed'
WHEN CAST(8 AS NVARCHAR) THEN '11th Year of Schooling - Not Completed'
WHEN CAST(9 AS NVARCHAR) THEN '7th Year (Old)'
WHEN CAST(10 AS NVARCHAR) THEN 'Other - 11th Year of Schooling'
WHEN CAST(11 AS NVARCHAR) THEN '10th Year of Schooling'
WHEN CAST(12 AS NVARCHAR) THEN 'General commerce course'
WHEN CAST(13 AS NVARCHAR) THEN 'Basic Education 3rd Cycle (9th/10th/11th Year) or Equiv.'
WHEN CAST(14 AS NVARCHAR) THEN 'Technical-professional course'
WHEN CAST(15 AS NVARCHAR) THEN '7th year of schooling'
WHEN CAST(16 AS NVARCHAR) THEN '2nd cycle of the general high school course'
WHEN CAST(17 AS NVARCHAR) THEN '9th Year of Schooling - Not Completed'
WHEN CAST(18 AS NVARCHAR) THEN '8th year of schooling'
WHEN CAST(19 AS NVARCHAR) THEN 'Unknown'
WHEN CAST(20 AS NVARCHAR) THEN 'Can''t read or write'
WHEN CAST(21 AS NVARCHAR) THEN 'Can read without having a 4th year of schooling'
WHEN CAST(22 AS NVARCHAR) THEN 'Basic education 1st cycle (4th/5th year) or equiv.'
WHEN CAST(23 AS NVARCHAR) THEN 'Basic Education 2nd Cycle (6th/7th/8th Year) or Equiv.'
WHEN CAST(24 AS NVARCHAR) THEN 'Technological specialization course'
WHEN CAST(25 AS NVARCHAR) THEN 'Higher education - degree (1st cycle)'
WHEN CAST(26 AS NVARCHAR) THEN 'Specialized higher studies course'
WHEN CAST(27 AS NVARCHAR) THEN 'Professional higher technical course'
WHEN CAST(28 AS NVARCHAR) THEN 'Higher Education - Master (2nd cycle)'
WHEN CAST(29 AS NVARCHAR) THEN 'Higher Education - Doctorate (3rd cycle)'
ELSE Mothers_qualification
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Mothers_qualification
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
FATHERS_QUALIFICATION:
1 - Secondary Education - 12th Year of Schooling or Eq.
2 - Higher Education - Bachelor's Degree
3 - Higher Education - Degree
4 - Higher Education - Master's
5 - Higher Education - Doctorate
6 - Frequency of Higher Education
7 - 12th Year of Schooling - Not Completed 
8 - 11th Year of Schooling - Not Completed 
9 - 7th Year (Old) 
10 - Other - 11th Year of Schooling 
11 - 2nd year complementary high school course 
12 - 10th Year of Schooling 
13 - General commerce course 
14 - Basic Education 3rd Cycle (9th/10th/11th Year) or Equiv. 
15 - Complementary High School Course 
16 - Technical-professional course 
17 - Complementary High School Course - not concluded 
18 - 7th year of schooling 
19 - 2nd cycle of the general high school course 
20 - 9th Year of Schooling - Not Completed 
21 - 8th year of schooling 
22 - General Course of Administration and Commerce 
23 - Supplementary Accounting and Administration 
24 - Unknown 
25 - Can't read or write 
26 - Can read without having a 4th year of schooling 
27 - Basic education 1st cycle (4th/5th year) or equiv. 
28 - Basic Education 2nd Cycle (6th/7th/8th Year) or Equiv. 
29 - Technological specialization course 
30 - Higher education - degree (1st cycle) 
31 - Specialized higher studies course 
32 - Professional higher technical course 
33 - Higher Education - Master (2nd cycle) 
34 - Higher Education - Doctorate (3rd cycle)
*/

-- Update statements
UPDATE PortfolioProject..StudentAcademicSuccess
SET Fathers_qualification = CASE Fathers_qualification
WHEN CAST(1 AS NVARCHAR) THEN 'Secondary Education - 12th Year of Schooling or Eq.'
WHEN CAST(2 AS NVARCHAR) THEN 'Higher Education - Bachelor''s Degree'
WHEN CAST(3 AS NVARCHAR) THEN 'Higher Education - Degree'
WHEN CAST(4 AS NVARCHAR) THEN 'Higher Education - Master''s'
WHEN CAST(5 AS NVARCHAR) THEN 'Higher Education - Doctorate'
WHEN CAST(6 AS NVARCHAR) THEN 'Frequency of Higher Education'
WHEN CAST(7 AS NVARCHAR) THEN '12th Year of Schooling - Not Completed'
WHEN CAST(8 AS NVARCHAR) THEN '11th Year of Schooling - Not Completed'
WHEN CAST(9 AS NVARCHAR) THEN '7th Year (Old)'
WHEN CAST(10 AS NVARCHAR) THEN '2nd year complementary high school course'
WHEN CAST(11 AS NVARCHAR) THEN 'Other - 11th Year of Schooling'
WHEN CAST(12 AS NVARCHAR) THEN '10th Year of Schooling'
WHEN CAST(13 AS NVARCHAR) THEN 'General commerce course'
WHEN CAST(14 AS NVARCHAR) THEN 'Basic Education 3rd Cycle (9th/10th/11th Year) or Equiv.'
WHEN CAST(15 AS NVARCHAR) THEN 'Complementary High School Course '
WHEN CAST(16 AS NVARCHAR) THEN 'Technical-professional course'
WHEN CAST(17 AS NVARCHAR) THEN 'Complementary High School Course - not concluded'
WHEN CAST(18 AS NVARCHAR) THEN '7th year of schooling'
WHEN CAST(19 AS NVARCHAR) THEN '2nd cycle of the general high school course'
WHEN CAST(20 AS NVARCHAR) THEN '9th Year of Schooling - Not Completed'
WHEN CAST(21 AS NVARCHAR) THEN '8th year of schooling'
WHEN CAST(22 AS NVARCHAR) THEN 'General Course of Administration and Commerce'
WHEN CAST(23 AS NVARCHAR) THEN 'Supplementary Accounting and Administration'
WHEN CAST(24 AS NVARCHAR) THEN 'Unknown'
WHEN CAST(25 AS NVARCHAR) THEN 'Can''t read or write'
WHEN CAST(26 AS NVARCHAR) THEN 'Can read without having a 4th year of schooling'
WHEN CAST(27 AS NVARCHAR) THEN 'Basic education 1st cycle (4th/5th year) or equiv.'
WHEN CAST(28 AS NVARCHAR) THEN 'Basic Education 2nd Cycle (6th/7th/8th Year) or Equiv.'
WHEN CAST(29 AS NVARCHAR) THEN 'Technological specialization course'
WHEN CAST(30 AS NVARCHAR) THEN 'Higher education - degree (1st cycle)'
WHEN CAST(31 AS NVARCHAR) THEN 'Specialized higher studies course'
WHEN CAST(32 AS NVARCHAR) THEN 'Professional higher technical course'
WHEN CAST(33 AS NVARCHAR) THEN 'Higher Education - Master (2nd cycle)'
WHEN CAST(34 AS NVARCHAR) THEN 'Higher Education - Doctorate (3rd cycle)'
ELSE Fathers_qualification
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Fathers_qualification
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
MOTHERS_OCCUPATION:
1 - Student
2 - Representatives of the Legislative Power and Executive Bodies, Directors, Directors and Executive Managers
3 - Specialists in Intellectual and Scientific Activities
4 - Intermediate Level Technicians and Professions
5 - Administrative staff
6 - Personal Services, Security and Safety Workers and Sellers
7 - Farmers and Skilled Workers in Agriculture, Fisheries and Forestry
8 - Skilled Workers in Industry, Construction and Craftsmen
9 - Installation and Machine Operators and Assembly Workers
10 - Unskilled Workers
11 - Armed Forces Professions
12 - Other Situation
13 - (blank)
14 - Health professionals
15 - teachers
16 - Specialists in information and communication technologies (ICT)
17 - Intermediate level science and engineering technicians and professions
18 - Technicians and professionals, of intermediate level of health
19 - Intermediate level technicians from legal, social, sports, cultural and similar services
20 - Office workers, secretaries in general and data processing operators
21 - Data, accounting, statistical, financial services and registry-related operators
22 - Other administrative support staff
23 - personal service workers
24 - sellers
25 - Personal care workers and the like
26 - Skilled construction workers and the like, except electricians
27 - Skilled workers in printing, precision instrument manufacturing, jewelers, artisans and the like
28 - Workers in food processing, woodworking, clothing and other industries and crafts
29 - cleaning workers
30 - Unskilled workers in agriculture, animal production, fisheries and forestry
31 - Unskilled workers in extractive industry, construction, manufacturing and transport
32 - Meal preparation assistants
*/

-- Update statements
UPDATE PortfolioProject..StudentAcademicSuccess
SET Mothers_occupation = CASE Mothers_occupation
WHEN CAST(1 AS NVARCHAR) THEN 'Student'
WHEN CAST(2 AS NVARCHAR) THEN 'Representatives of the Legislative Power and Executive Bodies, Directors, Directors and Executive Managers'
WHEN CAST(3 AS NVARCHAR) THEN 'Specialists in Intellectual and Scientific Activities'
WHEN CAST(4 AS NVARCHAR) THEN 'Intermediate Level Technicians and Professions'
WHEN CAST(5 AS NVARCHAR) THEN 'Administrative staff'
WHEN CAST(6 AS NVARCHAR) THEN 'Personal Services, Security and Safety Workers and Sellers'
WHEN CAST(7 AS NVARCHAR) THEN 'Farmers and Skilled Workers in Agriculture, Fisheries and Forestry'
WHEN CAST(8 AS NVARCHAR) THEN 'Skilled Workers in Industry, Construction and Craftsmen'
WHEN CAST(9 AS NVARCHAR) THEN 'Installation and Machine Operators and Assembly Workers'
WHEN CAST(10 AS NVARCHAR) THEN 'Unskilled Workers'
WHEN CAST(11 AS NVARCHAR) THEN 'Armed Forces Professions'
WHEN CAST(12 AS NVARCHAR) THEN 'Other Situation'
WHEN CAST(13 AS NVARCHAR) THEN NULL
WHEN CAST(14 AS NVARCHAR) THEN 'Health professionals'
WHEN CAST(15 AS NVARCHAR) THEN 'Teachers'
WHEN CAST(16 AS NVARCHAR) THEN 'Specialists in information and communication technologies (ICT)'
WHEN CAST(17 AS NVARCHAR) THEN 'Intermediate level science and engineering technicians and professions'
WHEN CAST(18 AS NVARCHAR) THEN 'Technicians and professionals, of intermediate level of health'
WHEN CAST(19 AS NVARCHAR) THEN 'Intermediate level technicians from legal, social, sports, cultural and similar services'
WHEN CAST(20 AS NVARCHAR) THEN 'Office workers, secretaries in general and data processing operators'
WHEN CAST(21 AS NVARCHAR) THEN 'Data, accounting, statistical, financial services and registry-related operators'
WHEN CAST(22 AS NVARCHAR) THEN 'Other administrative support staff'
WHEN CAST(23 AS NVARCHAR) THEN 'Personal service workers'
WHEN CAST(24 AS NVARCHAR) THEN 'Sellers'
WHEN CAST(25 AS NVARCHAR) THEN 'Personal care workers and the like'
WHEN CAST(26 AS NVARCHAR) THEN 'Skilled construction workers and the like, except electricians'
WHEN CAST(27 AS NVARCHAR) THEN 'Skilled workers in printing, precision instrument manufacturing, jewelers, artisans and the like'
WHEN CAST(28 AS NVARCHAR) THEN 'Workers in food processing, woodworking, clothing and other industries and crafts'
WHEN CAST(29 AS NVARCHAR) THEN 'Cleaning workers'
WHEN CAST(30 AS NVARCHAR) THEN 'Unskilled workers in agriculture, animal production, fisheries and forestry'
WHEN CAST(31 AS NVARCHAR) THEN 'Unskilled workers in extractive industry, construction, manufacturing and transport'
WHEN CAST(32 AS NVARCHAR) THEN 'Meal preparation assistants'
ELSE Mothers_occupation
END

-- Confirm that values have been update correctly
SELECT DISTINCT Mothers_occupation
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
FATHERS_OCCUPATION:
1 - Student
2 - Representatives of the Legislative Power and Executive Bodies, Directors, Directors and Executive Managers
3 - Specialists in Intellectual and Scientific Activities
4 - Intermediate Level Technicians and Professions
5 - Administrative staff
6 - Personal Services, Security and Safety Workers and Sellers
7 - Farmers and Skilled Workers in Agriculture, Fisheries and Forestry
8 - Skilled Workers in Industry, Construction and Craftsmen
9 - Installation and Machine Operators and Assembly Workers
10 - Unskilled Workers
11 - Armed Forces Professions
12 - Other Situation
13 - (blank)
14 - Armed Forces Officers
15 - Armed Forces Sergeants
16 - Other Armed Forces personnel
17 - Directors of administrative and commercial services
18 - Hotel, catering, trade and other services directors
19 - Specialists in the physical sciences, mathematics, engineering and related techniques
20 - Health professionals
21 - teachers 
22 - Specialists in finance, accounting, administrative organization, public and commercial relations 
23 - Intermediate level science and engineering technicians and professions 
24 - Technicians and professionals, of intermediate level of health 
25 - Intermediate level technicians from legal, social, sports, cultural and similar services 
26 - Information and communication technology technicians 
27 - Office workers, secretaries in general and data processing operators 
28 - Data, accounting, statistical, financial services and registry-related operators 
29 - Other administrative support staff 
30 - personal service workers 
31 - sellers 
32 - Personal care workers and the like 
33 - Protection and security services personnel 
34 - Market-oriented farmers and skilled agricultural and animal production workers 
35 - Farmers, livestock keepers, fishermen, hunters and gatherers, subsistence 
36 - Skilled construction workers and the like, except electricians 
37 - Skilled workers in metallurgy, metalworking and similar 
38 - Skilled workers in electricity and electronics 
39 - Workers in food processing, woodworking, clothing and other industries and crafts 
40 - Fixed plant and machine operators 
41 - assembly workers 
42 - Vehicle drivers and mobile equipment operators 
43 - Unskilled workers in agriculture, animal production, fisheries and forestry 
44 - Unskilled workers in extractive industry, construction, manufacturing and transport 
45 - Meal preparation assistants 
46 - Street vendors (except food) and street service providers
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET Fathers_occupation = CASE Fathers_occupation
WHEN CAST(1 AS NVARCHAR) THEN 'Student'
WHEN CAST(2 AS NVARCHAR) THEN 'Representatives of the Legislative Power and Executive Bodies, Directors, Directors and Executive Managers'
WHEN CAST(3 AS NVARCHAR) THEN 'Specialists in Intellectual and Scientific Activities'
WHEN CAST(4 AS NVARCHAR) THEN 'Intermediate Level Technicians and Professions'
WHEN CAST(5 AS NVARCHAR) THEN 'Administrative staff'
WHEN CAST(6 AS NVARCHAR) THEN 'Personal Services, Security and Safety Workers and Sellers'
WHEN CAST(7 AS NVARCHAR) THEN 'Farmers and Skilled Workers in Agriculture, Fisheries and Forestry'
WHEN CAST(8 AS NVARCHAR) THEN 'Skilled Workers in Industry, Construction and Craftsmen'
WHEN CAST(9 AS NVARCHAR) THEN 'Installation and Machine Operators and Assembly Workers'
WHEN CAST(10 AS NVARCHAR) THEN 'Unskilled Workers'
WHEN CAST(11 AS NVARCHAR) THEN 'Armed Forces Professions'
WHEN CAST(12 AS NVARCHAR) THEN 'Other Situation'
WHEN CAST(13 AS NVARCHAR) THEN NULL
WHEN CAST(14 AS NVARCHAR) THEN 'Armed Forces Officers'
WHEN CAST(15 AS NVARCHAR) THEN 'Armed Forces Sergeants'
WHEN CAST(16 AS NVARCHAR) THEN 'Other Armed Forces personnel'
WHEN CAST(17 AS NVARCHAR) THEN 'Directors of administrative and commercial services'
WHEN CAST(18 AS NVARCHAR) THEN 'Hotel, catering, trade and other services directors'
WHEN CAST(19 AS NVARCHAR) THEN 'Specialists in the physical sciences, mathematics, engineering and related techniques'
WHEN CAST(20 AS NVARCHAR) THEN 'Health professionals'
WHEN CAST(21 AS NVARCHAR) THEN 'Teachers'
WHEN CAST(22 AS NVARCHAR) THEN 'Specialists in information and communication technologies (ICT)'
WHEN CAST(23 AS NVARCHAR) THEN 'Intermediate level science and engineering technicians and professions'
WHEN CAST(24 AS NVARCHAR) THEN 'Technicians and professionals, of intermediate level of health'
WHEN CAST(25 AS NVARCHAR) THEN 'Intermediate level technicians from legal, social, sports, cultural and similar services'
WHEN CAST(26 AS NVARCHAR) THEN 'Information and communication technology technicians'
WHEN CAST(27 AS NVARCHAR) THEN 'Office workers, secretaries in general and data processing operators'
WHEN CAST(28 AS NVARCHAR) THEN 'Data, accounting, statistical, financial services and registry-related operators'
WHEN CAST(29 AS NVARCHAR) THEN 'Other administrative support staff'
WHEN CAST(30 AS NVARCHAR) THEN 'Personal service workers'
WHEN CAST(31 AS NVARCHAR) THEN 'Sellers'
WHEN CAST(32 AS NVARCHAR) THEN 'Personal care workers and the like'
WHEN CAST(33 AS NVARCHAR) THEN 'Protection and security services personnel'
WHEN CAST(34 AS NVARCHAR) THEN 'Market-oriented farmers and skilled agricultural and animal production workers'
WHEN CAST(35 AS NVARCHAR) THEN 'Farmers, livestock keepers, fishermen, hunters and gatherers, subsistence'
WHEN CAST(36 AS NVARCHAR) THEN 'Skilled construction workers and the like, except electricians'
WHEN CAST(37 AS NVARCHAR) THEN 'Skilled workers in metallurgy, metalworking and similar '
WHEN CAST(38 AS NVARCHAR) THEN 'Skilled workers in electricity and electronics'
WHEN CAST(39 AS NVARCHAR) THEN 'Workers in food processing, woodworking, clothing and other industries and crafts'
WHEN CAST(40 AS NVARCHAR) THEN 'Fixed plant and machine operators'
WHEN CAST(41 AS NVARCHAR) THEN 'Assembly workers'
WHEN CAST(42 AS NVARCHAR) THEN 'Vehicle drivers and mobile equipment operators'
WHEN CAST(43 AS NVARCHAR) THEN 'Unskilled workers in agriculture, animal production, fisheries and forestry'
WHEN CAST(44 AS NVARCHAR) THEN 'Unskilled workers in extractive industry, construction, manufacturing and transport'
WHEN CAST(45 AS NVARCHAR) THEN 'Meal preparation assistants'
WHEN CAST(46 AS NVARCHAR) THEN 'Street vendors (except food) and street service providers'
ELSE Fathers_occupation
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Fathers_occupation
FROM PortfolioProject..StudentAcademicSuccess
ORDER BY 1

------------------------------------------------------------------

/*
DISPLACED:
1 - yes
0 - no
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET Displaced = CASE Displaced
WHEN CAST(0 AS NVARCHAR) THEN 'No'
WHEN CAST(1 AS NVARCHAR) THEN 'Yes'
ELSE Displaced
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Displaced
FROM PortfolioProject..StudentAcademicSuccess

------------------------------------------------------------------

/*
EDUCATIONAL_SPECIAL_NEEDS:
1 - yes
0 - no
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET Educational_special_needs = CASE Educational_special_needs
WHEN CAST(0 AS NVARCHAR) THEN 'No'
WHEN CAST(1 AS NVARCHAR) THEN 'Yes'
ELSE Educational_special_needs
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Educational_special_needs
FROM PortfolioProject..StudentAcademicSuccess

------------------------------------------------------------------

/*
DEBTOR:
1 - yes
0 - no
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET Debtor = CASE Debtor
WHEN CAST(0 AS NVARCHAR) THEN 'No'
WHEN CAST(1 AS NVARCHAR) THEN 'Yes'
ELSE Debtor
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Debtor
FROM PortfolioProject..StudentAcademicSuccess

------------------------------------------------------------------

/*
TUITION_FEES_UP_TO_DATE:
1 - yes
0 - no
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET Tuition_fees_up_to_date = CASE Tuition_fees_up_to_date
WHEN CAST(0 AS NVARCHAR) THEN 'No'
WHEN CAST(1 AS NVARCHAR) THEN 'Yes'
ELSE Tuition_fees_up_to_date
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Tuition_fees_up_to_date
FROM PortfolioProject..StudentAcademicSuccess

------------------------------------------------------------------

/*
GENDER:
1 - male
0 - female
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET Gender = CASE Gender
WHEN CAST(0 AS NVARCHAR) THEN 'Female'
WHEN CAST(1 AS NVARCHAR) THEN 'Male'
ELSE Gender
END

-- Confirm that values have been updated correctly
SELECT DISTINCT Gender
FROM PortfolioProject..StudentAcademicSuccess

------------------------------------------------------------------

/*
INTERNATIONAL:
1 - yes
0 - no
*/

-- Update statement
UPDATE PortfolioProject..StudentAcademicSuccess
SET International = CASE International
WHEN CAST(0 AS NVARCHAR) THEN 'No'
WHEN CAST(1 AS NVARCHAR) THEN 'Yes'
ELSE International
END

-- Confirm that values have been updated correctly
SELECT DISTINCT International
FROM PortfolioProject..StudentAcademicSuccess
