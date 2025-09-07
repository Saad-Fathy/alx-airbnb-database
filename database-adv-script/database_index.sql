-- EXPLAIN ANALYZE before indexing to measure baseline performance
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
GROUP BY 
    p.property_id, p.name, p.location;

-- Create index on bookings.user_id for faster JOINs and WHERE clauses
CREATE INDEX idx_bookings_user_id ON bookings (user_id);

-- Create index on bookings.property_id for faster JOINs and GROUP BY clauses
CREATE INDEX idx_bookings_property_id ON bookings (property_id);

-- Create index on bookings.booking_date for potential date-range queries
CREATE INDEX idx_bookings_booking_date ON bookings (booking_date);

-- EXPLAIN ANALYZE after indexing to measure performance improvement
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
GROUP BY 
    p.property_id, p.name, p.location;