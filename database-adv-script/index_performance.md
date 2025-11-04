# Indexing & Performance — Commands and Notes

## Suggested indexes (create in SQL)
-- Indexes for Users
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_date_joined ON Users(date_joined);

-- Indexes for Bookings
CREATE INDEX idx_bookings_user ON Bookings(user_id);
CREATE INDEX idx_bookings_property ON Bookings(property_id);
CREATE INDEX idx_bookings_checkin ON Bookings(check_in_date);
CREATE INDEX idx_bookings_checkout ON Bookings(check_out_date);

-- Indexes for Properties
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_owner ON Properties(owner_id);

-- Indexes for Reviews
CREATE INDEX idx_reviews_booking ON Reviews(booking_id);

## Example performance checks (run BEFORE and AFTER index creation)
-- Explain a sample heavy query:
EXPLAIN FORMAT=JSON
SELECT b.id, b.check_in_date, u.id AS user_id, u.email
FROM Bookings b
JOIN Users u ON b.user_id = u.id
WHERE b.check_in_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Use ANALYZE (MySQL 8+)
ANALYZE TABLE Bookings;
ANALYZE TABLE Users;

-- Example EXPLAIN ANALYZE (MySQL 8.0.18+)
EXPLAIN ANALYZE
SELECT b.id, b.check_in_date, u.id AS user_id, u.email
FROM Bookings b
JOIN Users u ON b.user_id = u.id
WHERE b.check_in_date BETWEEN '2025-01-01' AND '2025-12-31';
