-- 1.1 Non-correlated subquery: properties where average rating > 4.0
SELECT
  p.id AS property_id,
  p.title,
  p.location,
  avg_ratings.avg_rating
FROM Properties p
JOIN (
  SELECT
    b.property_id,
    AVG(r.rating) AS avg_rating
  FROM Reviews r
  JOIN Bookings b ON r.booking_id = b.id
  GROUP BY b.property_id
) avg_ratings ON avg_ratings.property_id = p.id
WHERE avg_ratings.avg_rating > 4.0;

-- 1.2 Correlated subquery: users who have made more than 3 bookings
SELECT
  u.id AS user_id,
  u.first_name,
  u.last_name,
  (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.id
  ) AS bookings_count
FROM Users u
WHERE (
  SELECT COUNT(*)
  FROM Bookings b
  WHERE b.user_id = u.id
) > 3;
