-- Initial query to retrieve bookings with user, property, and payment details
EXPLAIN
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
    b.booking_date >= '2024-09-07'
    AND b.user_id IS NOT NULL;

-- Create index to optimize LEFT JOIN on payments
CREATE INDEX idx_bookings_payment_id ON bookings (payment_id);

-- Refactored query with index and ORDER BY for optimization
EXPLAIN
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
ORDER BY 
    b.booking_id;