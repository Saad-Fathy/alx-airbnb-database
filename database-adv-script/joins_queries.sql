-- Query 1: INNER JOIN to retrieve bookings and their respective users
SELECT 
    b.booking_id,
    b.booking_date,
    b.property_id,
    u.user_id,
    u.name AS user_name
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id;

-- Query 2: LEFT JOIN to retrieve all properties and their reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.user_id
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id
ORDER BY 
    p.property_id;

-- Query 3: FULL OUTER JOIN to retrieve all users and all bookings
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.booking_date,
    b.property_id
FROM 
    users u
FULL OUTER JOIN 
    bookings b ON u.user_id = b.user_id;