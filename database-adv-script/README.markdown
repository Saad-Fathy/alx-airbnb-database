# ALX Airbnb Database - Advanced SQL Queries

This project is part of the ALX Airbnb Database Module, focusing on mastering advanced SQL querying and optimization techniques.

## Directory: database-adv-script

### File: joins_queries.sql
Contains three SQL queries demonstrating different join types:
1. **INNER JOIN**: Retrieves all bookings along with the user details for the users who made those bookings.
2. **LEFT JOIN**: Retrieves all properties and their associated reviews, including properties with no reviews. Results are sorted by `property_id` for consistency.
3. **FULL OUTER JOIN**: Retrieves all users and all bookings, including users without bookings and bookings not linked to users.

### File: subqueries.sql
Contains two SQL queries demonstrating subquery techniques:
1. **Non-Correlated Subquery**: Retrieves all properties with an average rating greater than 4.0, using a subquery to compute the average rating per property.
2. **Correlated Subquery**: Identifies users who have made more than 3 bookings, using a subquery that counts bookings per user.

### File: aggregations_and_window_functions.sql
Contains two SQL queries demonstrating aggregation and window functions:
1. **Aggregation Query**: Uses `COUNT` and `GROUP BY` to find the total number of bookings made by each user, including users with zero bookings.
2. **Window Function Query**: Uses `ROW_NUMBER` to assign a unique sequential rank to properties based on the total number of bookings, with the highest booked properties ranked first.

### File: database_index.sql
Contains three `CREATE INDEX` commands to optimize query performance and two `EXPLAIN ANALYZE` commands to measure the performance of a query before and after indexing:
1. Index on `bookings.user_id`: Optimizes JOINs and WHERE clauses involving `user_id`.
2. Index on `bookings.property_id`: Optimizes JOINs and GROUP BY clauses involving `property_id`.
3. Index on `bookings.booking_date`: Optimizes potential date-range queries.
4. `EXPLAIN ANALYZE` commands: Measure the performance of a query from `aggregations_and_window_functions.sql` before and after creating the `idx_bookings_property_id` index.

### File: perfomance.sql
Contains a complex query retrieving bookings with user, property, and payment details, including a `WHERE` clause with `AND` to filter recent bookings, an index creation command for `bookings.payment_id`, and a refactored query with `EXPLAIN` commands to analyze performance before and after optimization.

### File: index_performance.md
Documents the performance analysis of a query before and after adding an index on `bookings.property_id`, referencing the `EXPLAIN ANALYZE` commands in `database_index.sql` and providing sample query plans and execution times.

### File: optimization_report.md
Documents the performance analysis and optimization of a complex query in `perfomance.sql`, including `EXPLAIN` outputs and the impact of adding an index on `bookings.payment_id`.

### File: partitioning.sql
Contains commands to partition the `bookings` table by range on `booking_date` (partitions for 2023, 2024, 2025, and a default partition), create indexes on each partition, and an `EXPLAIN ANALYZE` command to test performance of a date-range query on the partitioned table.

### File: partition_performance.md
Documents the performance analysis of a date-range query on the `bookings` table before and after partitioning, including sample `EXPLAIN ANALYZE` outputs and observed improvements.

### File: monitor_and_refine.sql
Contains index creation commands for `users.user_id` and `properties.property_id`, `NOT NULL` constraints for `bookings` partitions, and refined versions of three frequently used queries with `EXPLAIN ANALYZE` to monitor and improve performance.

### File: performance_monitoring.md
Documents the performance analysis of three frequently used queries, identifying bottlenecks, implementing optimizations (indexes, query refinements, schema adjustments), and reporting improvements using `EXPLAIN ANALYZE`.

### How to Use
- Ensure access to the Airbnb database with tables: `users`, `bookings`, `properties`, `payments`, and `reviews`.
- Run the queries in `joins_queries.sql`, `subqueries.sql`, `aggregations_and_window_functions.sql`, `perfomance.sql`, and `monitor_and_refine.sql` using a SQL client (e.g., PostgreSQL).
- Apply the indexes in `database_index.sql`, `perfomance.sql`, and `monitor_and_refine.sql`. Set up partitioning in `partitioning.sql`.
- Analyze performance using `index_performance.md`, `optimization_report.md`, `partition_performance.md`, and `performance_monitoring.md` as guides.
- Verify the output to ensure correct join, subquery, aggregation, window function, index, partitioning, and performance behavior.

### Assumptions
- `users`: Contains `user_id` (primary key), `name`.
- `bookings`: Contains `booking_id` (primary key), `user_id` (foreign key, NOT NULL), `property_id` (foreign key, NOT NULL), `booking_date`, `payment_id` (foreign key).
- `properties`: Contains `property_id` (primary key), `name`, `location`.
- `payments`: Contains `payment_id` (primary key), `booking_id` (foreign key), `amount`, `payment_date`.
- `reviews`: Contains `review_id` (primary key), `property_id` (foreign key), `user_id` (foreign key), `rating` (numeric, e.g., 1.0 to 5.0).

### Submission
- **Repository**: `alx-airbnb-database`
- **Directory**: `database-adv-script`
- **Files**: `joins_queries.sql`, `subqueries.sql`, `aggregations_and_window_functions.sql`, `database_index.sql`, `index_performance.md`, `perfomance.sql`, `optimization_report.md`, `partitioning.sql`, `partition_performance.md`, `monitor_and_refine.sql`, `performance_monitoring.md`, `README.md`