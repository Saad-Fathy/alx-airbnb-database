-- Drop existing bookings table (or rename as backup)
DROP TABLE IF EXISTS bookings CASCADE;

-- Create parent bookings table (no data, partitioned by booking_date)
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    property_id INTEGER REFERENCES properties(property_id),
    payment_id INTEGER REFERENCES payments(payment_id),
    booking_date DATE NOT NULL
) PARTITION BY RANGE (booking_date);

-- Create partitions for 2023, 2024, 2025, and a default partition
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE bookings_default PARTITION OF bookings DEFAULT;

-- Create indexes on each partition
CREATE INDEX idx_bookings_2023_user_id ON bookings_2023 (user_id);
CREATE INDEX idx_bookings_2023_property_id ON bookings_2023 (property_id);
CREATE INDEX idx_bookings_2023_payment_id ON bookings_2023 (payment_id);
CREATE INDEX idx_bookings_2023_booking_date ON bookings_2023 (booking_date);

CREATE INDEX idx_bookings_2024_user_id ON bookings_2024 (user_id);
CREATE INDEX idx_bookings_2024_property_id ON bookings_2024 (property_id);
CREATE INDEX idx_bookings_2024_payment_id ON bookings_2024 (payment_id);
CREATE INDEX idx_bookings_2024_booking_date ON bookings_2024 (booking_date);

CREATE INDEX idx_bookings_2025_user_id ON bookings_2025 (user_id);
CREATE INDEX idx_bookings_2025_property_id ON bookings_2025 (property_id);
CREATE INDEX idx_bookings_2025_payment_id ON bookings_2025 (payment_id);
CREATE INDEX idx_bookings_2025_booking_date ON bookings_2025 (booking_date);

CREATE INDEX idx_bookings_default_user_id ON bookings_default (user_id);
CREATE INDEX idx_bookings_default_property_id ON bookings_default (property_id);
CREATE INDEX idx_bookings_default_payment_id ON bookings_default (payment_id);
CREATE INDEX idx_bookings_default_booking_date ON bookings_default (booking_date);

-- Test query performance on partitioned table
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.name AS property_name
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id
INNER JOIN 
    properties p ON b.property_id = p.property_id
WHERE 
    b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';