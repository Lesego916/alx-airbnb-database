-- Users
INSERT INTO Users (first_name, last_name, email, phone_number, password)
VALUES
('Grace', 'M', 'grace@example.com', '0712345678', 'hashedpassword1'),
('John', 'Doe', 'john@example.com', '0723456789', 'hashedpassword2');

-- Properties
INSERT INTO Properties (owner_id, title, description, location, price_per_night)
VALUES
(1, 'Cozy Apartment in Cape Town', 'Beautiful ocean view apartment', 'Cape Town', 1200.00),
(2, 'Modern Loft in Johannesburg', 'Spacious loft near Sandton City', 'Johannesburg', 950.00);

-- Bookings
INSERT INTO Bookings (user_id, property_id, check_in_date, check_out_date, total_price, status)
VALUES
(2, 1, '2025-11-01', '2025-11-05', 4800.00, 'Confirmed'),
(1, 2, '2025-12-10', '2025-12-15', 4750.00, 'Pending');

-- Reviews
INSERT INTO Reviews (booking_id, user_id, rating, comment)
VALUES
(1, 2, 5, 'Amazing stay! Highly recommended.'),
(2, 1, 4, 'Great location and clean rooms.');

-- Payments
INSERT INTO Payments (booking_id, amount, payment_method, status)
VALUES
(1, 4800.00, 'Credit Card', 'Completed'),
(2, 4750.00, 'PayPal', 'Pending');
