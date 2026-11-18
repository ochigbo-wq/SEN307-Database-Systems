\# SEN307 – Database Systems

\## Week 6 Practical Notes



\*\*Student Name:\*\* OCHIGBO SAMUEL OCHE  

\*\*Matric Number:\*\* VUG/SEN/24/11582  

\*\*Database:\*\* sen307\_vug\_sen\_24\_11582



\### Part 1: Data Population

Successfully populated the database with:

\- 5 departments

\- 10 lecturers

\- 20 original students, including my own student record

\- 10 courses

\- 40 enrolments

\- 11 course allocations



\### Part 2: Data Integrity

Verified that:

\- Student-course enrolments contain no duplicate combinations.

\- At least one course has more than five enrolled students.

\- At least two students have no enrolments.

\- Student genders and dates of birth meet the practical requirements.



\### Part 3: UPDATE Operation

Updated student `20231234` (Ada Obi) from Department ID 1 (Software Engineering) to Department ID 2 (Computer Science). Verified the change using SELECT queries.



\### Part 4: Foreign Key Constraint

Created the temporary department \*\*Library and Information Science\*\* and assigned student `20239999` to it.



Attempted to delete the department while the student still referenced it. MySQL returned:



`ERROR 1451 (23000): Cannot delete or update a parent row`



This demonstrated that the foreign key constraint prevents deletion of a parent record referenced by a child record.



I then reassigned student `20239999` to Software Engineering and successfully deleted the temporary department.



\### Final Database Verification



| Table | Record Count |

|---|---:|

| Department | 5 |

| Lecturer | 10 |

| Student | 21 |

| Course | 10 |

| Enrolment | 40 |

| CourseAllocation | 11 |



\*\*Conclusion:\*\* All Week 6 practical database operations were executed and verified successfully.

