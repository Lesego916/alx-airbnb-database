-- 4.1 Initial (naive) query: retrieve bookings with user, property, and payment details
SELECT
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date,
  b.total_price,
  b.status,
  u.id AS user_id,
  u.first_name,
  u.last_name,
  p.id AS property_id,
  p.title AS property_title,
  pay.id AS payment_id,
  pay.amount AS payment_amount,
  pay.status AS payment_status
FROM Bookings b
LEFT JOIN Users u ON b.user_id = u.id
LEFT JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON pay.booking_id = b.id;

-- 4.2 Refactored query: select only required columns, push predicates early, use EXISTS where appropriate
SELECT
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date,
  b.total_price,
  b.status,
  u.id AS user_id,
  CONCAT(u.first_name, ' ', u.last_name) AS user_name,
  p.id AS property_id,
  p.title AS property_title,
  pay.amount AS payment_amount,
  pay.status AS payment_status
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON pay.booking_id = b.id
WHERE b.check_in_date >= '2025-01-01'
ORDER BY b.check_in_date DESC
LIMIT 100;
