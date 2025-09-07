-- Create explicit indexes on users.user_id and properties.property_id
CREATE INDEX idx_users_user_id ON users (user_id);
CREATE INDEX idx_properties_property_id ON properties (property_id);

-- Add NOT NULL constraints to bookings partitions
ALTER TABLE bookings_2023 ALTER COLUMN user_id SET NOT NULL;
ALTER TABLE bookings_2023 ALTER COLUMN property_id SET NOT NULL;
ALTER TABLE bookings_2024 ALTER COLUMN user_id SET NOT NULL;
ALTER TABLE bookings_2024 ALTER COLUMN property_id SET NOT NULL;
ALTER TABLE bookings_2025 ALTER COLUMN user_id SET NOT NULL;
ALTER TABLE bookings_2025 ALTER COLUMN property_id SET NOT NULL;
ALTER TABLE bookings_default ALTER COLUMN user_id SET NOT NULL;
ALTER TABLE bookings_default ALTER COLUMN property_id SET NOT NULL;

-- Refined Aggregation Query
EXPLAIN ANALYZE
SELECT 
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
WHERE 
    b.booking_date >= '2024-01-01'
GROUP BY 
    u.user_id, u.name;

-- Refined Window Function Query
EXPLAIN ANALYZE
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.property_id = b.property_id
WHERE 
    b.booking_date >= '2024-01-01'
GROUP BY 
    p.property_id, p.name, p.location;

-- Refined Complex Query
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id
INNER JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.payment_id = pay.payment_id
WHERE 
    b.booking_date >= '2024-09-07';