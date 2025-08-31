Airbnb Database Normalization
Overview
This document outlines the normalization process applied to the Airbnb-like database schema to achieve the Third Normal Form (3NF). The original schema from the specification (User, Property, Booking, Payment, Review, Message) was reviewed for redundancies and normalization violations. The primary adjustment was splitting the Property.location attribute into a separate Location table to address 1NF and 3NF issues. The resulting schema ensures data integrity, minimizes redundancy, and maintains functionality.
Normalization Steps
First Normal Form (1NF)
Requirements: No repeating groups or multi-valued attributes; all attributes are atomic; attributes depend on the primary key.
Analysis:

User, Booking, Payment, Review, Message: All attributes are atomic (e.g., email, total_price, rating) and depend on their UUID primary keys. No repeating groups.
Property: The location attribute (VARCHAR) may store composite data (e.g., “New York, NY, USA, 10001”), potentially violating 1NF’s atomicity requirement.

Adjustment:

Created a new Location table to store atomic location data:
location_id (PK, UUID, Indexed)
city (VARCHAR, NOT NULL)
state (VARCHAR, NULL)
country (VARCHAR, NOT NULL)
zip_code (VARCHAR, NULL)


Replaced Property.location with location_id (FK referencing Location.location_id, NOT NULL).
Reasoning: Splitting location ensures atomic attributes, simplifying queries and preventing parsing issues.

Second Normal Form (2NF)
Requirements: Meets 1NF; no partial dependencies (non-key attributes depend on the entire primary key).
Analysis:

All tables (User, Property, Location, Booking, Payment, Review, Message) have single-column UUID primary keys, eliminating partial dependency risks.
Non-key attributes (e.g., first_name, name, total_price) depend fully on their primary keys.

Adjustment: None required, as the schema is already in 2NF.
Third Normal Form (3NF)
Requirements: Meets 2NF; no transitive dependencies (non-key attributes do not depend on other non-key attributes).
Analysis:

User, Booking, Payment, Review, Message: No transitive dependencies. Non-key attributes depend only on their primary keys.
Property: The original location attribute introduced a transitive dependency (e.g., property_id → location → city/state/country). For example, zip_code could determine city, state, and country.

Adjustment:

The Location table eliminates the transitive dependency by storing location data separately, linked via Property.location_id.
Reasoning: This reduces redundancy (e.g., storing “New York” multiple times) and prevents update anomalies (e.g., updating a city name across multiple rows).

Normalized Schema

User (Unchanged)
user_id (PK, UUID, Indexed)
first_name (VARCHAR, NOT NULL)
last_name (VARCHAR, NOT NULL)
email (VARCHAR, UNIQUE, NOT NULL, Indexed)
password_hash (VARCHAR, NOT NULL)
phone_number (VARCHAR, NULL)
role (ENUM: 'guest', 'host', 'admin', NOT NULL)
created_at (


