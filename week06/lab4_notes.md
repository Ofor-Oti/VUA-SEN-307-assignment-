# VUA-SEN307 Week 6 Practical Notes

**Student:** OFOR OTI  
**Matric Number:** VUG/SEN/24/11717  
**Course:** SEN307 Database Systems  
**Practical:** Week 6, Lab 4 - Data Manipulation Language (DML)

## Referential Integrity Exercise

In Part 4, MySQL returned **Error 1451: Cannot delete or update a parent row: a foreign key constraint fails** when I attempted to delete the department named `Library and Information Science`.

The error occurred because the `Transfer Student` record in the `Student` table still referenced that department through the `dept_id` foreign key. MySQL refused to delete the department because doing so would leave the student record pointing to a department that no longer exists, which would violate referential integrity.

I fixed the problem by first updating the student's `dept_id` to the existing `Software Engineering` department and then deleting `Library and Information Science`.

Another possible fix would be to delete the dependent student record first, if removing that student were appropriate, before deleting the department. Reassigning the student was the better option because it preserved the student record.

## Final Data Checks

The practical produced the required data, including 5 departments, 10 lecturers, 10 courses, 40 enrolments and 11 course allocations.

There are 21 students in the final database because the temporary transfer student remains after being reassigned to Software Engineering.

The data also satisfies the additional requirements:

- SEN307 has more than five enrolled students.
- Two original students have no enrolments.
- SEN307 is allocated to two lecturers.
- Students have a mixture of genders and dates of birth between 2003 and 2007.

## Screenshot Evidence

Screenshots have been saved and submitted in a separate folder.

1. **Error 1451:** Shows the foreign-key constraint error when attempting to delete a department that still has a dependent student record.
2. **Final Row Counts:** Shows the final number of records in all six database tables after completing the practical.