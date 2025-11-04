# Query Optimization Report

## Query analyzed
- Initial query: join Bookings, Users, Properties, Payments (see perfomance.sql)

## Observations & changes applied
- Reduced selected columns to only needed fields.
- Ensured joins use indexed columns (Booking.user_id, Booking.property_id, Payments.booking_id).
- Added WHERE predicate to limit date range and applied ORDER BY + LIMIT to reduce result set.
- Replaced LEFT JOIN with JOIN for Users/Properties where presence is required to allow optimizer to use inner-join plans.

## Suggested indexes (if not present)
CREATE INDEX idx_bookings_checkin ON Bookings(check_in_date);
CREATE INDEX idx_bookings_user ON Bookings(user_id);
CREATE INDEX idx_bookings_property ON Bookings(property_id);
CREATE INDEX idx_payments_booking ON Payments(booking_id);

## How to measure
- Use EXPLAIN and EXPLAIN ANALYZE pre- and post- changes.
- Compare rows examined and execution time.
