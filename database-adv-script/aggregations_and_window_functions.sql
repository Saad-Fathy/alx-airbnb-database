-- Query 1: Aggregate query to find total number of bookings per user
SELECT 
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.name;

-- Query 2: Window function to rank properties by total bookings using ROW_NUMBER
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