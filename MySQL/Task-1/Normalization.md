##### Step-1:

* ###### ***How to remove multi-valued columns:***

Suppose that (Student\_Name,Course\_title) a composite Pk for this Table.



In 1NF we have to fill all row with one single value so we get a separated table(student\_Name,Phone)



1NF ->



* (st\_name,address(city,street,zIp\_code),course\_title,ins\_name,ins\_dept,Dept\_buliding,Grades)
* (student\_Name,Phone).





##### Step-2:

* ###### ***How to remove partial dependencies***

Student\_Address is a composite column and repeated unnecessarily so we have to separate it with its pk that is depend on which is student\_name->



(student\_name,city,street,Zip\_code), ins\_name and ins\_dept depend on course\_title not course and st\_name so this another partial dependency



(course\_title , ins\_name , ins\_dept ,dept\_Building), Grades depends on the both course title and st\_name so this is Total dependency,



2NF ->



* (student\_name,city,street,Zip\_code)
* (course\_title,ins\_name,ins\_dept,Dept\_buliding)
* (student\_Name,Phone)
* (st\_name,course\_title,Grades).





##### Step-3:

* ###### ***How to remove transitive dependencies***

to remove transitive we must ensure there is no non-key columns depends on non-key columns .



here we have a dept\_building depends on ins\_dept so we separate both of them on a separated column and make ins\_dept the PK of the table.



3NF->



* (student\_name,city,street,Zip\_code)
* (student\_Name,Phone)
* (st\_name,course\_title,Grades)
* (course\_title,ins\_name,ins\_dept)
* (ins\_dept,Dept\_buliding)
