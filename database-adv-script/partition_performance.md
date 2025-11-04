# Partitioning Report

## Partition strategy
- Partitioned Bookings by YEAR(check_in_date) into yearly partitions.

## Test queries
- Query for a single year:
EXPLAIN ANALYZE SELECT COUNT(*) FROM Bookings WHERE check_in_date BETWEEN '2025-01-01' AND '2025-12-31';

- Query across years:
EXPLAIN ANALYZE SELECT COUNT(*) FROM Bookings WHERE check_in_date BETWEEN '2023-01-01' AND '2025-12-31';

## Expected improvements
- Queries limited to a specific year should scan fewer partitions (partition pruning).
- Reduced I/O and faster response times for date-range queries.

## Notes
- Measure with EXPLAIN ANAYLZE before and after partitioning; compare rows examined and total execution time.
