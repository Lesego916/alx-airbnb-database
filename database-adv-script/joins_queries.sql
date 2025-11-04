-- 0.1 INNER JOIN: all bookings with the users who made them
SELECT
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date,
  b.total_price,
  b.status,
  u.id AS user_id,
  u.first_name,
  u.last_name,
  u.email
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.id;

-- 0.2 LEFT JOIN: all properties and their reviews (includes properties with no reviews)
SELECT
  p.id AS property_id,
  p.title,
  p.location,
  r.id AS review_id,
  r.rating,
  r.comment,
  r.created_at
FROM Properties p
LEFT JOIN Reviews r ON r.booking_id IN (
  SELECT b.id FROM Bookings b WHERE b.property_id = p.id
);

-- Alternative LEFT JOIN using join chain (recommended where Reviews references Booking)
SELECT
  p.id AS property_id,
  p.title,
  p.location,
  r.id AS review_id,
  r.rating,
  r.comment,
  r.created_at
FROM Properties p
LEFT JOIN Bookings b ON b.property_id = p.id
LEFT JOIN Reviews r ON r.booking_id = b.id;

-- 0.3 FULL OUTER JOIN emulation (MySQL) to retrieve all users and all bookings even when unmatched
-- Approach: LEFT JOIN UNION RIGHT JOIN rows not matched by LEFT.
-- LEFT part
SELECT
  u.id AS user_id,
  u.first_name,
  u.last_name,
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date
FROM Users u
LEFT JOIN Bookings b ON b.user_id = u.id
UNION
-- RIGHT-only part: bookings with no user match
SELECT
  u.id AS user_id,
  u.first_name,
  u.last_name,
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date
FROM Users u
RIGHT JOIN Bookings b ON b.user_id = u.id
WHERE u.id IS NULL;
