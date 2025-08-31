Airbnb Database ERD
Overview
This Entity-Relationship (ER) diagram represents the database design for an Airbnb-like application, based on the provided specification. It includes six entities (User, Property, Booking, Payment, Review, Message) with their attributes, constraints, and relationships. The diagram uses crow’s foot notation to clearly define one-to-many and one-to-one relationships. Indexes are noted to optimize query performance.
Entities and Attributes

User

user_id (PK, UUID, Indexed): Unique identifier for a user.
first_name (VARCHAR, NOT NULL): User’s first name.
last_name (VARCHAR, NOT NULL): User’s last name.
email (VARCHAR, UNIQUE, NOT NULL, Indexed): User’s email address.
password_hash (VARCHAR, NOT NULL): Hashed password for security.
phone_number (VARCHAR, NULL): User’s phone number.
role (ENUM: 'guest', 'host', 'admin', NOT NULL): User’s role.
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Record creation time.
Constraints: Unique constraint on email; non-null constraints on first_name, last_name, email, password_hash, role.


Property

property_id (PK, UUID, Indexed): Unique identifier for a property.
host_id (FK referencing User(user_id), NOT NULL): ID of the host.
name (VARCHAR, NOT NULL): Property name.
description (TEXT, NOT NULL): Property description.
location (VARCHAR, NOT NULL): Property location.
pricepernight (DECIMAL, NOT NULL): Price per night.
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Record creation time.
updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP): Record update time.
Constraints: Foreign key constraint on host_id; non-null constraints on name, description, location, pricepernight.


Booking

booking_id (PK, UUID, Indexed): Unique identifier for a booking.
property_id (FK referencing Property(property_id), NOT NULL, Indexed): ID of the booked property.
user_id (FK referencing User(user_id), NOT NULL): ID of the guest.
start_date (DATE, NOT NULL): Check-in date.
end_date (DATE, NOT NULL): Check-out date.
total_price (DECIMAL, NOT NULL): Total booking price.
status (ENUM: 'pending', 'confirmed', 'canceled', NOT NULL): Booking status.
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Record creation time.
Constraints: Foreign key constraints on property_id and user_id; status restricted to 'pending', 'confirmed', or 'canceled'.


Payment

payment_id (PK, UUID, Indexed): Unique identifier for a payment.
booking_id (FK referencing Booking(booking_id), NOT NULL, Indexed): ID of the associated booking.
amount (DECIMAL, NOT NULL): Payment amount.
payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Payment timestamp.
payment_method (ENUM: 'credit_card', 'paypal', 'stripe', NOT NULL): Payment method.
Constraints: Foreign key constraint on booking_id; non-null constraints on amount, payment_method.


Review

review_id (PK, UUID, Indexed): Unique identifier for a review.
property_id (FK referencing Property(property_id), NOT NULL, Indexed): ID of the reviewed property.
user_id (FK referencing User(user_id), NOT NULL): ID of the guest who wrote the review.
rating (INTEGER, NOT NULL, CHECK: rating >= 1 AND rating <= 5): Rating score.
comment (TEXT, NOT NULL): Review comment.
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Record creation time.
Constraints: Foreign key constraints on property_id and user_id; rating constrained to 1–5; non-null constraint on comment.


Message

message_id (PK, UUID, Indexed): Unique identifier for a message.
sender_id (FK referencing User(user_id), NOT NULL): ID of the sender.
recipient_id (FK referencing User(user_id), NOT NULL): ID of the recipient.
message_body (TEXT, NOT NULL): Message content.
sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Message timestamp.
Constraints: Foreign key constraints on sender_id and recipient_id; non-null constraint on message_body.



Relationships

User → Property: One-to-Many (One user can host multiple properties; each property has one host).
Property → Booking: One-to-Many (One property can have multiple bookings; each booking is for one property).
User → Booking: One-to-Many (One user can make multiple bookings; each booking is made by one guest).
Booking → Payment: One-to-One (Each booking has one payment; each payment is tied to one booking).
Property → Review: One-to-Many (One property can have multiple reviews; each review is for one property).
User → Review: One-to-Many (One user can write multiple reviews; each review is written by one guest).
User → Message (Sender): One-to-Many (One user can send multiple messages; each message has one sender).
User → Message (Recipient): One-to-Many (One user can receive multiple messages; each message has one recipient).

Indexes

Automatic Indexes: Primary keys (user_id, property_id, booking_id, payment_id, review_id, message_id).
Additional Indexes:
User.email: For fast user lookups.
Booking.property_id: For efficient booking queries by property.
Payment.booking_id: For quick payment-booking joins.
Review.property_id: For efficient review retrieval by property.



Diagram Creation
The ERD was created using Draw.io with crow’s foot notation to represent relationships. Indexes are noted in the diagram. The diagram is saved as airbnb_erd.png in the ERD/ directory.