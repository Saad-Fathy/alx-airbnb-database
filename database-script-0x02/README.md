Airbnb Database Seed Data
Overview
This directory (database-script-0x02) contains the SQL script to populate the Airbnb-like database with sample data, as part of the ALX Airbnb Database Module. The script (seed.sql) inserts realistic data into the User, Location, Property, Booking, Payment, Review, and Message tables, simulating real-world usage while respecting all constraints and relationships from the schema (Task 2).
Files

seed.sql: Contains INSERT statements to populate all tables with sample data.
README.md: This file, describing the seed data and its purpose.

Seed Data Details
The seed data simulates a small Airbnb-like system with:

Users: 4 users (1 host, 1 guest, 1 with both roles, 1 admin).
Locations: 3 locations (New York, Paris, Tokyo).
Properties: 3 properties listed by hosts in different locations.
Bookings: 3 bookings with different statuses (confirmed, pending, canceled).
Payments: 2 payments linked to confirmed and pending bookings.
Reviews: 2 reviews for properties by guests.
Messages: 2 messages between a guest and a host regarding a property.

Data Characteristics

Realism: Data reflects real-world scenarios (e.g., valid dates, realistic prices, meaningful comments).
Constraints: Respects NOT NULL, UNIQUE, CHECK, and ENUM constraints (e.g., rating between 1–5, status as 'pending'/'confirmed'/'canceled').
Referential Integrity: Foreign keys (e.g., host_id, booking_id) reference valid primary keys.
UUIDs: Hardcoded for consistency in this script (in production, generated via gen_random_uuid()).

Usage
Run schema.sql (from Task 2) first, then seed.sql in a PostgreSQL database:
psql -U <username> -d <database> -f database-script-0x01/schema.sql
psql -U <username> -d <database> -f database-script-0x02/seed.sql

Submission

Directory: database-script-0x02
Files: seed.sql, README.md
Repository: alx-airbnb-database
