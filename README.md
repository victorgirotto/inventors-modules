Inventors' Workshops - Modules
==============================

## Setting up the project
0. Open the solution file on Visual Studio
0. Rebuild the whole project twice (it'll give an error message the first time)

## Setting up the database
0. Run the SQL script "DBSetup.sql" under /database on your local SQL database
0. Go to /src/inventors-modules. Make a copy of the file ConnectionStrings.example.config and rename it to ConnectionStrings.private.config
0. Open the ConnectionStrings.private.config file. Here, you have to setup 4 attributes of the "add" element: server (e.g. localhost), user id (e.g. admin), password (e.g. 1234), and database (e.g. dbName).