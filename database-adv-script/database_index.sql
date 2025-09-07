-- Create index on bookings.user_id for faster JOINs and WHERE clauses
CREATE INDEX idx_bookings_user_id ON bookings (user_id);

-- Create index on bookings.property_id for faster JOINs and GROUP BY clauses
CREATE INDEX idx_bookings_property_id ON bookings (property_id);

-- Create index on bookings.booking_date for potential date-range queries
CREATE INDEX idx_bookings_booking_date ON bookings (booking_date);