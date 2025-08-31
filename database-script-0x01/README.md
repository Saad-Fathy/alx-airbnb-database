Airbnb Database Schema
Overview
This directory (database-script-0x01) contains the SQL Data Definition Language (DDL) script for the Airbnb-like database schema, as part of the ALX Airbnb Database Module. The schema is normalized to the Third Normal Form (3NF) and includes tables, constraints, and indexes as specified. The script creates tables for User, Location, Property, Booking, Payment, Review, and Message, supporting core functionalities like user management, property listings, bookings, payments, reviews, and messaging.
Files

schema.sql: Contains CREATE TABLE statements for all entities, with primary keys, foreign keys, constraints (NOT NULL, UNIQUE, CHECK), and indexes for optimal performance.
README.md: This file, describing the schema and its purpose.

Schema Details
Tables

User: Stores user information (hosts, guests, admins).

Primary Key: user_id (UUID, Indexed)
Constraints: UNIQUE on email; NOT NULL on first_name, last_name, email, password_hash, role; ENUM for role ('guest', 'host', 'admin').
Index: email for fast lookups.


Location: Stores location data (split from Property.location for normalization).

Primary Key: location_id (UUID, Indexed)
Constraints: NOT NULL on city, country.


Property: Represents property listings.

Primary Key: property_id (UUID, Indexed)
Foreign Keys: host_id (User), location_id (Location)
Constraints: NOT NULL on name, description, pricepernight; CHECK pricepernight > 0.


Booking: Manages bookings made by guests.

Primary Key: booking_id (UUID, Indexed)
Foreign Keys: property_id (Property), user_id (User)
Constraints: NOT NULL on start_date, end_date, total_price, status; CHECK total_price > 0, end_date > start_date; ENUM for status ('pending', 'confirmed', 'canceled').
Index: property_id for efficient queries.


Payment: Tracks payments for bookings.

Primary Key: payment_id (UUID, Indexed)
Foreign Key: booking_id (Booking, UNIQUE)
Constraints: NOT NULL on amount, payment_method; CHECK amount > 0; ENUM for payment_method ('credit_card', 'paypal', 'stripe').
Index: booking_id for joins.


Review: Stores guest reviews for properties.

Primary Key: review_id (UUID, Indexed)
Foreign Keys: property_id (Property), user_id (User)
Constraints: NOT NULL on rating, comment; CHECK rating >= 1 AND rating <= 5.
Index: property_id for review retrieval.


Message: Handles messaging between users.

Primary Key: message_id (UUID, Indexed)
Foreign Keys: sender_id (User), recipient_id (User)
Constraints: NOT NULL on message_body.



Design Choices

UUID Primary Keys: Used as per the specification for scalability and uniqueness.
ENUMs: Implemented as VARCHAR with CHECK constraints for compatibility (e.g., role, status, payment_method).
Foreign Keys: Use ON DELETE CASCADE for dependent records (e.g., deleting a User removes their Properties) and ON DELETE RESTRICT for Location to prevent deleting referenced locations.
Indexes: Added as specified (email, property_id, booking_id, review_id) to optimize common queries.
Normalization: The Location table ensures 3NF by eliminating the transitive dependency in Property.location.

Usage
Run schema.sql in a PostgreSQL database to create the schema:
psql -U <username> -d <database> -f schema.sql

Submission

Directory: database-script-0x01
Files: schema.sql, README.md
Repository: alx-airbnb-database
