# ER Diagram – ALX Airbnb Database

## Entities and Attributes

### 1. Users
- id (PK)
- first_name
- last_name
- email
- phone_number
- password
- date_joined

### 2. Properties
- id (PK)
- owner_id (FK → Users.id)
- title
- description
- location
- price_per_night
- created_at

### 3. Bookings
- id (PK)
- user_id (FK → Users.id)
- property_id (FK → Properties.id)
- check_in_date
- check_out_date
- total_price
- status

### 4. Reviews
- id (PK)
- booking_id (FK → Bookings.id)
- user_id (FK → Users.id)
- rating
- comment
- created_at

### 5. Payments
- id (PK)
- booking_id (FK → Bookings.id)
- amount
- payment_method
- payment_date
- status

## Relationships
- One **User** can own multiple **Properties**.
- One **User** can make multiple **Bookings**.
- One **Property** can have multiple **Bookings**.
- One **Booking** can have one **Review** and one **Payment**.
- One **User** can write multiple **Reviews**.
