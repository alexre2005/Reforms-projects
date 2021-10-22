Extracts of Oracle Database packages
=======================================================
This directory contains extracts of database packages
adjusted for the purpose of migration to Re_Forms 21.

Within this directory the packages are grouped by Oracle Database version.

Installation instructions
=======================================================
  1. Create the subdirectory in 'db' folder, the name should match the name 
     of the database description file (without '.txt' extension).

  2. Copy the necessary files into the created directory.

  3. Add 'pld' entries to the database description file.


Example installation
-------------------------------------------------------
Making use of the dbms_lob package in database description file 'src/db/example.txt' 
would require you to do the following:
  $ mkdir src/db/example
  $ cp extras/db/12c/dbms_lob.pld src/db/example/
  $ echo 'pld: dbms_lob' >> src/db/example.txt
