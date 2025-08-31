-- Database: AirbnbDB
-- Description: Seed data for the Airbnb-like database, reflecting real-world usage.
-- This script populates all tables with sample data, respecting constraints and relationships.

-- Insert Users (hosts, guests, and an admin)
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440000', 'Alice', 'Smith', 'alice.smith@example.com', 'hash123', '+12345678901', 'host', '2025-08-01 10:00:00'),
    ('550e8400-e29b-41d4-a716-446655440001', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hash456', '+12345678902', 'guest', '2025-08-01 11:00:00'),
    ('550e8400-e29b-41d4-a716-446655440002', 'Carol', 'Williams', 'carol.williams@example.com', 'hash789', '+12345678903', 'both', '2025-08-02 09:00:00'),
    ('550e8400-e29b-41d4-a716-446655440003', 'David', 'Brown', 'david.brown@example.com', 'hash012', '+12345678904', 'admin', '2025-08-02 10:00:00');

-- Insert Locations
INSERT INTO Location (location_id, city, state, country, zip_code)
VALUES
    ('550e8400-e29b-41d4-a716-446655440100', 'New York', 'NY', 'USA', '10001'),
    ('550e8400-e29b-41d4-a716-446655440101', 'Paris', NULL, 'France', '75001'),
    ('550e8400-e29b-41d4-a716-446655440102', 'Tokyo', NULL, 'Japan', '100-0001');

-- Insert Properties (linked to hosts and locations)
INSERT INTO Property (property_id, host_id, location_id, name, description, pricepernight, created_at, updated_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440200', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440100', 'Cozy NYC Loft', 'A stylish loft in downtown Manhattan.', 150.00, '2025-08-03 12:00:00', '2025-08-03 12:00:00'),
    ('550e8400-e29b-41d4-a716-446655440201', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440101', 'Parisian Apartment', 'Charming apartment near the Eiffel Tower.', 200.00, '2025-08-04 14:00:00', '2025-08-04 14:00:00'),
    ('550e8400-e29b-41d4-a716-446655440202', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440102', 'Tokyo Studio', 'Modern studio in Shibuya.', 120.00, '2025-08-05 10:00:00', '2025-08-05 10:00:00');

-- Insert Bookings (linked to properties and guests)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440300', '550e8400-e29b-41d4-a716-446655440200', '550e8400-e29b-41d4-a716-446655440001', '2025-09-01', '2025-09-05', 600.00, 'confirmed', '2025-08-10 15:00:00'),
    ('550e8400-e29b-41d4-a716-446655440301', '550e8400-e29b-41d4-a716-446655440201', '550e8400-e29b-41d4-a716-446655440002', '2025-09-10', '2025-09-12', 400.00, 'pending', '2025-08-11 16:00:00'),
    ('550e8400-e29b-41d4-a716-446655440302', '550e8400-e29b-41d4-a716-446655440202', '550e8400-e29b-41d4-a716-446655440001', '2025-09-15', '2025-09-18', 360.00, 'canceled', '2025-08-12 09:00:00');

-- Insert Payments (linked to bookings)
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('550e8400-e29b-41d4-a716-446655440400', '550e8400-e29b-41d4-a716-446655440300', 600.00, '2025-08-10 15:30:00', 'credit_card'),
    ('550e8400-e29b-41d4-a716-446655440401', '550e8400-e29b-41d4-a716-446655440301', 400.00, '2025-08-11 16:30:00', 'paypal');

-- Insert Reviews (linked to properties and guests)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440500', '550e8400-e29b-41d4-a716-446655440200', '550e8400-e29b-41d4-a716-446655440001', 5, 'Amazing stay, great location!', '2025-09-06 10:00:00'),
    ('550e8400-e29b-41d4-a716-446655440501', '550e8400-e29b-41d4-a716-446655440201', '550e8400-e29b-41d4-a716-446655440002', 4, 'Lovely apartment, but a bit noisy.', '2025-09-13 11:00:00');

-- Insert Messages (between users)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440600', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440000', 'Is the NYC loft available for September?', '2025-08-09 14:00:00'),
    ('550e8400-e29b-41d4-a716-446655440601', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Yes, it’s available! Please book through the platform.', '2025-08-09 14:30:00');