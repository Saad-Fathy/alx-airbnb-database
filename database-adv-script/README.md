ALX Airbnb Database - Advanced SQL Queries
This project is part of the ALX Airbnb Database Module, focusing on mastering advanced SQL querying and optimization techniques.
Directory: database-adv-script
File: joins_queries.sql
Contains three SQL queries demonstrating different join types:

INNER JOIN: Retrieves all bookings along with the user details for the users who made those bookings.
LEFT JOIN: Retrieves all properties and their associated reviews, including properties with no reviews. Results are sorted by property_id for consistency.
FULL OUTER JOIN: Retrieves all users and all bookings, including users without bookings and bookings not linked to users.

File: subqueries.sql
Contains two SQL queries demonstrating subquery techniques:

Non-Correlated Subquery: Retrieves all properties with an average rating greater than 4.0, using a subquery to compute the average rating per property.
Correlated Subquery: Identifies users who have made more than 3 bookings, using a subquery that counts bookings per user.

File: aggregations_and_window_functions.sql
Contains two SQL queries demonstrating aggregation and window functions:

Aggregation Query: Uses COUNT and GROUP BY to find the total number of bookings made by each user, including users with zero bookings.
Window Function Query: Uses ROW_NUMBER to assign a unique sequential rank to properties based on the total number of bookings, with the highest booked properties ranked first.

File: database_index.sql
Contains three CREATE INDEX commands to optimize query performance and two EXPLAIN ANALYZE commands to measure the performance of a query before and after indexing:

Index on bookings.user_id: Optimizes JOINs and WHERE clauses involving user_id.
Index on bookings.property_id: Optimizes JOINs and GROUP BY clauses involving property_id.
Index on bookings.booking_date: Optimizes potential date-range queries.
EXPLAIN ANALYZE commands: Measure the performance of a query from aggregations_and_window_functions.sql before and after creating the idx_bookings_property_id index.

File: index_performance.md
Documents the performance analysis of a query before and after adding an index on bookings.property_id, referencing the EXPLAIN ANALYZE commands in database_index.sql and providing sample query plans and execution times.
How to Use

Ensure access to the Airbnb database with tables: users, bookings, properties, and reviews.
Run the queries in joins_queries.sql, subqueries.sql, and aggregations_and_window_functions.sql using a SQL client (e.g., MySQL, PostgreSQL).
Apply the indexes and run the EXPLAIN ANALYZE commands in database_index.sql to measure performance. Refer to index_performance.md for sample analysis.
Verify the output to ensure correct join, subquery, aggregation, window function, and index behavior.

Assumptions

users: Contains user_id (primary key), name.
bookings: Contains booking_id (primary key), user_id (foreign key), property_id (foreign key), booking_date.
properties: Contains property_id (primary key), name, location.
reviews: Contains review_id (primary key), property_id (foreign key), user_id (foreign key), rating (numeric, e.g., 1.0 to 5.0).

Submission

Repository: alx-airbnb-database
Directory: database-adv-script
Files: joins_queries.sql, subqueries.sql, aggregations_and_window_functions.sql, database_index.sql, index_performance.md, README.md
