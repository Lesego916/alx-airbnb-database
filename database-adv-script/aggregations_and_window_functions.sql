-- 2.1 Total number of bookings made by each user
SELECT
  u.id AS user_id,
  u.first_name,
  u.last_name,
  COUNT(b.id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b ON b.user_id = u.id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- 2.2 Rank properties by total number of bookings (using window functions)
SELECT
  property_id,
  title,
  total_bookings,
  ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num,
  RANK() OVER (ORDER BY total_bookings DESC) AS rank_by_bookings
FROM (
  SELECT
    p.id AS property_id,
    p.title,
    COUNT(b.id) AS total_bookings
  FROM Properties p
  LEFT JOIN Bookings b ON b.property_id = p.id
  GROUP BY p.id, p.title
) t
ORDER BY total_bookings DESC;
