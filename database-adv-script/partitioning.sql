-- 5.1 Example approach to partition the Bookings table by YEAR(check_in_date).
-- NOTE: MySQL requires certain constraints for partitioning. Often easiest approach: create a new partitioned table and copy data.

-- Create partitioned table (structure must match the original Bookings table)
CREATE TABLE Bookings_partitioned (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status VARCHAR(50) DEFAULT 'Pending',
  -- keep foreign keys if desired (some engines restrict partitioning with foreign keys)
  INDEX idx_user (user_id),
  INDEX idx_property (property_id),
  INDEX idx_checkin (check_in_date)
)
PARTITION BY RANGE ( YEAR(check_in_date) ) (
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION p2025 VALUES LESS THAN (2026),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Copy data from existing Bookings table
INSERT INTO Bookings_partitioned (id, user_id, property_id, check_in_date, check_out_date, total_price, status)
SELECT id, user_id, property_id, check_in_date, check_out_date, total_price, status FROM Bookings;

-- (Optional) rename tables after verification
-- RENAME TABLE Bookings TO Bookings_old, Bookings_partitioned TO Bookings;
