# Database Normalization – Up to 3NF

## First Normal Form (1NF)
- All tables have primary keys.
- Each column holds atomic values (no repeating groups).
- Example: User phone numbers stored in one field, not a list.

## Second Normal Form (2NF)
- All non-key attributes depend fully on the primary key.
- Removed partial dependencies.
- Example: Booking table depends fully on booking_id, not user_id or property_id alone.

## Third Normal Form (3NF)
- Removed transitive dependencies.
- Example: Payment details are in a separate Payments table instead of being inside Bookings.
- Ensures each table represents one concept only:
  - Users → user info
  - Properties → property info
  - Bookings → reservations
  - Reviews → feedback
  - Payments → financial transactions
