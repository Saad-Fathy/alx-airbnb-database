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

How to Use

Ensure access to the Airbnb database with tables: users, bookings, properties, and reviews.
Run the queries in joins_queries.sql, subqueries.sql, and aggregations_and_window_functions.sql using a SQL client (e.g., MySQL, PostgreSQL).
Verify the output to ensure correct join, subquery, aggregation, and window function behavior.

Assumptions

users: Contains user_id, name.
bookings: Contains booking_id, user_id, property_id, booking_date.
properties: Contains property_id, name, location.
reviews: Contains review_id, property_id, user_id, rating (numeric, e.g., 1.0 to 5.0).

Submission

Repository: alx-airbnb-database
Directory: database-adv-script
Files: joins_queries.sql, subqueries.sql, aggregations_and_window_functions.sql, README.md
