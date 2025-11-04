# Performance Monitoring & Refinement

## Tools / Commands to run
-- EXPLAIN (basic)
EXPLAIN SELECT * FROM Bookings WHERE check_in_date BETWEEN '2025-01-01' AND '2025-12-31';

-- EXPLAIN FORMAT=JSON for detailed plan
EXPLAIN FORMAT=JSON SELECT b.id, u.email FROM Bookings b JOIN Users u ON b.user_id = u.id WHERE b.check_in_date BETWEEN '2025-01-01' AND '2025-12-31';

-- EXPLAIN ANALYZE (MySQL 8+)
EXPLAIN ANALYZE SELECT b.id, u.email FROM Bookings b JOIN Users u ON b.user_id = u.id WHERE b.check_in_date BETWEEN '2025-01-01' AND '2025-12-31';

-- SHOW STATUS for profiling information (alternative)
SHOW SESSION STATUS LIKE 'Handler%';

## Typical bottlenecks to look for
- Full table scans on large tables (high rows_examined).
- Large temporary tables on disk.
- Filesort operations caused by ORDER BY without index.

## Typical fixes
- Add appropriate indexes on WHERE / JOIN / ORDER BY columns.
- Limit returned columns; avoid SELECT *.
- Partition large tables by a query-relevant column (e.g., check_in_date).
