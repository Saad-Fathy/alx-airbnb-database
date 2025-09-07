# ALX Airbnb Database - Advanced SQL Joins

This project is part of the ALX Airbnb Database Module, focusing on mastering SQL joins for complex querying.

## File: joins_queries.sql

This file contains three SQL queries demonstrating the use of different join types:

1. **INNER JOIN**: Retrieves all bookings along with the user details for the users who made those bookings.
2. **LEFT JOIN**: Retrieves all properties and their associated reviews, including properties with no reviews.
3. **FULL OUTER JOIN**: Retrieves all users and all bookings, including users without bookings and bookings not linked to users.

### How to Use
- Ensure you have access to the Airbnb database with tables: `users`, `bookings`, `properties`, and `reviews`.
- Run the queries in `joins_queries.sql` using a SQL client (e.g., MySQL, PostgreSQL).
- Verify the output to ensure correct join behavior.

### Assumptions
- `users`: Contains `user_id`, `name`.
- `bookings`: Contains `booking_id`, `user_id`, `property_id`, `booking_date`.
- `properties`: Contains `property_id`, `name`, `location`.
- `reviews`: Contains `review_id`, `property_id`, `user_id`, `rating`.

### Submission
- Repository: `alx-airbnb-database`
- Directory: `database-adv-script`
- Files: `joins_queries.sql`, `README.md`