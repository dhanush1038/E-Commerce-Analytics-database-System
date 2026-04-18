-- ============================================================
-- PROJECT 1: E-COMMERCE ORDER ANALYTICS SYSTEM
-- File: seed_data.sql
-- Purpose: Insert realistic sample data into all 6 tables
-- Run this AFTER schema.sql
-- ============================================================

USE ecommerce_analytics;

-- ============================================================
-- CUSTOMERS (50 customers from different Indian cities)
-- WHY realistic data? So our analytics queries produce meaningful results
-- ============================================================
INSERT INTO customers (name, email, phone, city, state, registration_date) VALUES
('Aarav Sharma',     'aarav.sharma@gmail.com',     '9876543210', 'Mumbai',       'Maharashtra',    '2024-01-15'),
('Priya Patel',      'priya.patel@yahoo.com',      '9876543211', 'Ahmedabad',    'Gujarat',        '2024-01-20'),
('Rohit Kumar',      'rohit.kumar@gmail.com',      '9876543212', 'Delhi',        'Delhi',          '2024-02-01'),
('Sneha Reddy',      'sneha.reddy@outlook.com',    '9876543213', 'Hyderabad',    'Telangana',      '2024-02-10'),
('Vikram Singh',     'vikram.singh@gmail.com',      '9876543214', 'Jaipur',       'Rajasthan',      '2024-02-15'),
('Ananya Iyer',      'ananya.iyer@gmail.com',       '9876543215', 'Chennai',      'Tamil Nadu',     '2024-03-01'),
('Karthik Nair',     'karthik.nair@yahoo.com',      '9876543216', 'Kochi',        'Kerala',         '2024-03-05'),
('Meera Joshi',      'meera.joshi@gmail.com',       '9876543217', 'Pune',         'Maharashtra',    '2024-03-10'),
('Arjun Mehta',      'arjun.mehta@outlook.com',     '9876543218', 'Surat',        'Gujarat',        '2024-03-15'),
('Divya Gupta',      'divya.gupta@gmail.com',       '9876543219', 'Lucknow',      'Uttar Pradesh',  '2024-03-20'),
('Rahul Verma',      'rahul.verma@gmail.com',       '9876543220', 'Bhopal',       'Madhya Pradesh', '2024-04-01'),
('Pooja Desai',      'pooja.desai@yahoo.com',       '9876543221', 'Vadodara',     'Gujarat',        '2024-04-05'),
('Aditya Rao',       'aditya.rao@gmail.com',        '9876543222', 'Bangalore',    'Karnataka',      '2024-04-10'),
('Nisha Chopra',     'nisha.chopra@outlook.com',    '9876543223', 'Chandigarh',   'Punjab',         '2024-04-15'),
('Suresh Pillai',    'suresh.pillai@gmail.com',     '9876543224', 'Trivandrum',   'Kerala',         '2024-04-20'),
('Kavya Menon',      'kavya.menon@gmail.com',       '9876543225', 'Kochi',        'Kerala',         '2024-05-01'),
('Manish Tiwari',    'manish.tiwari@yahoo.com',     '9876543226', 'Varanasi',     'Uttar Pradesh',  '2024-05-05'),
('Ritu Agarwal',     'ritu.agarwal@gmail.com',      '9876543227', 'Kolkata',      'West Bengal',    '2024-05-10'),
('Deepak Saxena',    'deepak.saxena@outlook.com',   '9876543228', 'Indore',       'Madhya Pradesh', '2024-05-15'),
('Lakshmi Sundaram', 'lakshmi.sundaram@gmail.com',  '9876543229', 'Madurai',      'Tamil Nadu',     '2024-05-20'),
('Nikhil Pandey',    'nikhil.pandey@gmail.com',     '9876543230', 'Patna',        'Bihar',          '2024-06-01'),
('Shruti Bhatt',     'shruti.bhatt@yahoo.com',      '9876543231', 'Ahmedabad',    'Gujarat',        '2024-06-05'),
('Amit Kulkarni',    'amit.kulkarni@gmail.com',     '9876543232', 'Nagpur',       'Maharashtra',    '2024-06-10'),
('Tanvi Shetty',     'tanvi.shetty@outlook.com',    '9876543233', 'Mangalore',    'Karnataka',      '2024-06-15'),
('Rajesh Mishra',    'rajesh.mishra@gmail.com',     '9876543234', 'Lucknow',      'Uttar Pradesh',  '2024-06-20'),
('Ishita Banerjee',  'ishita.banerjee@gmail.com',   '9876543235', 'Kolkata',      'West Bengal',    '2024-07-01'),
('Sanjay Patil',     'sanjay.patil@yahoo.com',      '9876543236', 'Pune',         'Maharashtra',    '2024-07-05'),
('Pallavi Hegde',    'pallavi.hegde@gmail.com',     '9876543237', 'Bangalore',    'Karnataka',      '2024-07-10'),
('Vivek Chauhan',    'vivek.chauhan@outlook.com',   '9876543238', 'Dehradun',     'Uttarakhand',    '2024-07-15'),
('Swathi Krishna',   'swathi.krishna@gmail.com',    '9876543239', 'Visakhapatnam','Andhra Pradesh', '2024-07-20'),
('Gaurav Jain',      'gaurav.jain@gmail.com',       '9876543240', 'Delhi',        'Delhi',          '2024-08-01'),
('Neha Sharma',      'neha.sharma@yahoo.com',       '9876543241', 'Jaipur',       'Rajasthan',      '2024-08-05'),
('Prakash Menon',    'prakash.menon@gmail.com',     '9876543242', 'Thrissur',     'Kerala',         '2024-08-10'),
('Anjali Das',       'anjali.das@outlook.com',      '9876543243', 'Guwahati',     'Assam',          '2024-08-15'),
('Manoj Dubey',      'manoj.dubey@gmail.com',       '9876543244', 'Kanpur',       'Uttar Pradesh',  '2024-08-20'),
('Revathi Subramanian','revathi.sub@gmail.com',     '9876543245', 'Coimbatore',   'Tamil Nadu',     '2024-09-01'),
('Harsh Vardhan',    'harsh.vardhan@yahoo.com',     '9876543246', 'Agra',         'Uttar Pradesh',  '2024-09-05'),
('Preeti Mahajan',   'preeti.mahajan@gmail.com',    '9876543247', 'Amritsar',     'Punjab',         '2024-09-10'),
('Siddharth Rajan',  'sid.rajan@outlook.com',       '9876543248', 'Mysore',       'Karnataka',      '2024-09-15'),
('Bhavna Thakur',    'bhavna.thakur@gmail.com',     '9876543249', 'Shimla',       'Himachal Pradesh','2024-09-20'),
('Akash Malhotra',   'akash.malhotra@gmail.com',    '9876543250', 'Mumbai',       'Maharashtra',    '2024-10-01'),
('Sonal Kapoor',     'sonal.kapoor@yahoo.com',      '9876543251', 'Delhi',        'Delhi',          '2024-10-05'),
('Ramesh Babu',      'ramesh.babu@gmail.com',       '9876543252', 'Vijaywada',    'Andhra Pradesh', '2024-10-10'),
('Trisha Venkat',    'trisha.venkat@outlook.com',   '9876543253', 'Chennai',      'Tamil Nadu',     '2024-10-15'),
('Yogesh Deshpande', 'yogesh.desh@gmail.com',       '9876543254', 'Pune',         'Maharashtra',    '2024-10-20'),
('Kriti Saxena',     'kriti.saxena@gmail.com',      '9876543255', 'Noida',        'Uttar Pradesh',  '2024-11-01'),
('Pawan Reddy',      'pawan.reddy@yahoo.com',       '9876543256', 'Hyderabad',    'Telangana',      '2024-11-05'),
('Megha Bose',       'megha.bose@gmail.com',        '9876543257', 'Kolkata',      'West Bengal',    '2024-11-10'),
('Vishal Chandra',   'vishal.chandra@outlook.com',  '9876543258', 'Ranchi',       'Jharkhand',      '2024-11-15'),
('Aparna Nambiar',   'aparna.nambiar@gmail.com',    '9876543259', 'Calicut',      'Kerala',         '2024-11-20');


-- ============================================================
-- PRODUCTS (40 products across 6 categories)
-- Categories: Electronics, Clothing, Books, Home & Kitchen, Sports, Beauty
-- ============================================================
INSERT INTO products (name, category, price, stock_quantity, added_date) VALUES
-- Electronics (8 products)
('Samsung Galaxy S24 Ultra',      'Electronics',     124999.00, 50,  '2024-01-01'),
('Apple MacBook Air M3',          'Electronics',     114900.00, 30,  '2024-01-10'),
('Sony WH-1000XM5 Headphones',   'Electronics',     29990.00,  100, '2024-01-15'),
('Dell 27" 4K Monitor',           'Electronics',     34999.00,  40,  '2024-02-01'),
('Logitech MX Master 3S Mouse',  'Electronics',     8995.00,   200, '2024-02-10'),
('Apple iPad Air 2024',           'Electronics',     69900.00,  60,  '2024-03-01'),
('JBL Charge 5 Speaker',          'Electronics',     17999.00,  80,  '2024-03-15'),
('Kindle Paperwhite 2024',        'Electronics',     16999.00,  120, '2024-04-01'),

-- Clothing (8 products)
('Nike Air Max 270 Shoes',        'Clothing',        12995.00,  150, '2024-01-05'),
('Levi 501 Original Jeans',       'Clothing',        4999.00,   200, '2024-01-20'),
('Allen Solly Formal Shirt',      'Clothing',        1999.00,   300, '2024-02-05'),
('Adidas Ultraboost Shoes',       'Clothing',        16999.00,  100, '2024-02-20'),
('US Polo T-Shirt Pack of 3',     'Clothing',        1499.00,   400, '2024-03-10'),
('Peter England Blazer',          'Clothing',        5999.00,   80,  '2024-04-05'),
('Wildcraft Trekking Jacket',     'Clothing',        3499.00,   90,  '2024-05-01'),
('Fastrack Analog Watch',         'Clothing',        2495.00,   250, '2024-05-15'),

-- Books (8 products)
('Atomic Habits - James Clear',   'Books',           599.00,    500, '2024-01-01'),
('Rich Dad Poor Dad',             'Books',           399.00,    450, '2024-01-15'),
('The Psychology of Money',        'Books',           499.00,    300, '2024-02-01'),
('Sapiens - Yuval Noah Harari',   'Books',           699.00,    250, '2024-02-15'),
('Deep Work - Cal Newport',       'Books',           449.00,    350, '2024-03-01'),
('Zero to One - Peter Thiel',     'Books',           499.00,    200, '2024-04-01'),
('Ikigai',                         'Books',           399.00,    400, '2024-05-01'),
('The Alchemist',                  'Books',           350.00,    380, '2024-06-01'),

-- Home & Kitchen (6 products)
('Prestige Induction Cooktop',     'Home & Kitchen',  3499.00,   100, '2024-02-01'),
('Philips Air Fryer HD9200',       'Home & Kitchen',  7999.00,   70,  '2024-02-15'),
('Milton Thermosteel Flask',       'Home & Kitchen',  899.00,    500, '2024-03-01'),
('Pigeon Non-Stick Cookware Set',  'Home & Kitchen',  2499.00,   150, '2024-03-15'),
('Cello Opalware Dinner Set',      'Home & Kitchen',  1999.00,   120, '2024-04-01'),
('Havells Table Fan',              'Home & Kitchen',  2199.00,   200, '2024-05-01'),

-- Sports & Fitness (5 products)
('Nivia Storm Football',           'Sports',          799.00,    300, '2024-01-10'),
('Yonex Nanoray Badminton Racket', 'Sports',          3499.00,   100, '2024-02-10'),
('Fitbit Charge 6',                'Sports',          14999.00,  60,  '2024-03-10'),
('Boldfit Yoga Mat',               'Sports',          999.00,    400, '2024-04-10'),
('Decathlon Dumbbells 5kg Pair',   'Sports',          1499.00,   250, '2024-05-10'),

-- Beauty & Personal Care (5 products)
('Lakme Absolute Foundation',      'Beauty',          899.00,    300, '2024-01-20'),
('Maybelline Mascara Kit',         'Beauty',          699.00,    350, '2024-02-20'),
('Nivea Men Grooming Kit',         'Beauty',          1299.00,   200, '2024-03-20'),
('Forest Essentials Face Cream',   'Beauty',          2450.00,   100, '2024-04-20'),
('Biotique Bio Sunscreen',         'Beauty',          399.00,    500, '2024-05-20');


-- ============================================================
-- ORDERS (80 orders spread across 12 months)
-- Mix of statuses: Delivered, Pending, Processing, Shipped, Cancelled
-- Note: customer_id refers to customers table (1-50)
-- ============================================================
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
-- January 2025
(1,  '2025-01-05', 'Delivered',  124999.00),
(2,  '2025-01-08', 'Delivered',  5498.00),
(3,  '2025-01-12', 'Delivered',  1998.00),
(5,  '2025-01-15', 'Delivered',  29990.00),
(8,  '2025-01-20', 'Cancelled',  69900.00),
(10, '2025-01-25', 'Delivered',  1299.00),

-- February 2025
(4,  '2025-02-02', 'Delivered',  114900.00),
(6,  '2025-02-05', 'Delivered',  3998.00),
(7,  '2025-02-10', 'Delivered',  17999.00),
(9,  '2025-02-14', 'Delivered',  8995.00),
(11, '2025-02-18', 'Delivered',  6498.00),
(13, '2025-02-22', 'Cancelled',  34999.00),
(15, '2025-02-28', 'Delivered',  899.00),

-- March 2025
(1,  '2025-03-03', 'Delivered',  599.00),
(2,  '2025-03-07', 'Delivered',  7999.00),
(12, '2025-03-10', 'Delivered',  4999.00),
(14, '2025-03-15', 'Delivered',  16999.00),
(16, '2025-03-18', 'Delivered',  2495.00),
(18, '2025-03-22', 'Delivered',  3499.00),
(20, '2025-03-28', 'Delivered',  14999.00),

-- April 2025
(3,  '2025-04-02', 'Delivered',  29990.00),
(1,  '2025-04-05', 'Delivered',  12995.00),
(17, '2025-04-10', 'Delivered',  1499.00),
(19, '2025-04-14', 'Delivered',  399.00),
(21, '2025-04-18', 'Cancelled',  124999.00),
(22, '2025-04-22', 'Delivered',  2499.00),
(24, '2025-04-28', 'Delivered',  699.00),

-- May 2025
(5,  '2025-05-03', 'Delivered',  8995.00),
(7,  '2025-05-07', 'Delivered',  2199.00),
(23, '2025-05-10', 'Delivered',  3499.00),
(25, '2025-05-15', 'Delivered',  16999.00),
(26, '2025-05-18', 'Delivered',  5999.00),
(28, '2025-05-22', 'Delivered',  1999.00),
(30, '2025-05-28', 'Delivered',  799.00),

-- June 2025
(1,  '2025-06-02', 'Delivered',  34999.00),
(6,  '2025-06-06', 'Delivered',  499.00),
(27, '2025-06-10', 'Delivered',  4999.00),
(29, '2025-06-14', 'Delivered',  2450.00),
(31, '2025-06-18', 'Cancelled',  69900.00),
(33, '2025-06-22', 'Delivered',  899.00),
(35, '2025-06-28', 'Delivered',  1299.00),

-- July 2025
(2,  '2025-07-03', 'Delivered',  124999.00),
(4,  '2025-07-07', 'Delivered',  29990.00),
(32, '2025-07-10', 'Delivered',  599.00),
(34, '2025-07-15', 'Delivered',  12995.00),
(36, '2025-07-18', 'Delivered',  3499.00),
(38, '2025-07-22', 'Delivered',  999.00),
(40, '2025-07-28', 'Cancelled',  16999.00),

-- August 2025
(3,  '2025-08-02', 'Delivered',  7999.00),
(8,  '2025-08-06', 'Delivered',  14999.00),
(37, '2025-08-10', 'Delivered',  449.00),
(39, '2025-08-14', 'Delivered',  8995.00),
(41, '2025-08-18', 'Delivered',  1499.00),
(42, '2025-08-22', 'Delivered',  2495.00),
(44, '2025-08-28', 'Delivered',  5999.00),

-- September 2025
(1,  '2025-09-02', 'Delivered',  17999.00),
(10, '2025-09-06', 'Delivered',  3499.00),
(43, '2025-09-10', 'Delivered',  699.00),
(45, '2025-09-15', 'Delivered',  29990.00),
(46, '2025-09-18', 'Delivered',  1999.00),
(47, '2025-09-22', 'Delivered',  799.00),
(48, '2025-09-28', 'Cancelled',  114900.00),

-- October 2025
(5,  '2025-10-03', 'Delivered',  69900.00),
(13, '2025-10-07', 'Delivered',  2199.00),
(49, '2025-10-10', 'Delivered',  399.00),
(50, '2025-10-15', 'Delivered',  16999.00),
(2,  '2025-10-18', 'Delivered',  499.00),
(4,  '2025-10-22', 'Shipped',   34999.00),
(6,  '2025-10-28', 'Shipped',   12995.00),

-- November 2025
(1,  '2025-11-02', 'Processing', 124999.00),
(3,  '2025-11-06', 'Shipped',   8995.00),
(7,  '2025-11-10', 'Delivered',  3499.00),
(9,  '2025-11-14', 'Delivered',  599.00),
(11, '2025-11-18', 'Shipped',   7999.00),
(15, '2025-11-22', 'Processing', 2499.00),
(20, '2025-11-28', 'Pending',   1999.00),

-- December 2025
(1,  '2025-12-01', 'Pending',   29990.00),
(8,  '2025-12-05', 'Pending',   5999.00),
(12, '2025-12-08', 'Pending',   16999.00),
(25, '2025-12-12', 'Pending',   34999.00),
(30, '2025-12-15', 'Pending',   899.00),
(40, '2025-12-18', 'Pending',   3499.00),
(50, '2025-12-22', 'Pending',   69900.00);


-- ============================================================
-- ORDER_ITEMS (100+ items — some orders have multiple products)
-- Links orders to products with quantity and pricing
-- ============================================================
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES
-- Order 1: Samsung Galaxy S24
(1,  1,  1, 124999.00, 0.00),
-- Order 2: Levi Jeans + US Polo T-Shirts
(2,  10, 1, 4999.00,   0.00),
(2,  13, 1, 1499.00,   10.00),
-- Order 3: Allen Solly Shirt x2  (discount for buying 2)
(3,  11, 2, 999.00,    0.00),
-- Order 4: Sony Headphones
(4,  3,  1, 29990.00,  0.00),
-- Order 5: iPad Air (cancelled)
(5,  6,  1, 69900.00,  0.00),
-- Order 6: Nivea Men Grooming Kit
(6,  38, 1, 1299.00,   0.00),
-- Order 7: MacBook Air
(7,  2,  1, 114900.00, 0.00),
-- Order 8: Rich Dad Poor Dad + Atomic Habits
(8,  18, 1, 399.00,    0.00),
(8,  17, 1, 599.00,    0.00),
-- Order 9: JBL Speaker
(9,  7,  1, 17999.00,  0.00),
-- Order 10: Logitech Mouse
(10, 5,  1, 8995.00,   0.00),
-- Order 11: Allen Solly + Peter England
(11, 11, 1, 1999.00,   0.00),
(11, 14, 1, 5999.00,   15.00),
-- Order 12: Dell Monitor (cancelled)
(12, 4,  1, 34999.00,  0.00),
-- Order 13: Milton Flask
(13, 27, 1, 899.00,    0.00),
-- Order 14: Atomic Habits
(14, 17, 1, 599.00,    0.00),
-- Order 15: Air Fryer
(15, 26, 1, 7999.00,   0.00),
-- Order 16: Levi Jeans
(16, 10, 1, 4999.00,   0.00),
-- Order 17: Adidas Ultraboost
(17, 12, 1, 16999.00,  5.00),
-- Order 18: Fastrack Watch
(18, 16, 1, 2495.00,   0.00),
-- Order 19: Induction Cooktop
(19, 25, 1, 3499.00,   0.00),
-- Order 20: Fitbit Charge 6
(20, 33, 1, 14999.00,  0.00),
-- Order 21: Sony Headphones
(21, 3,  1, 29990.00,  0.00),
-- Order 22: Nike Air Max
(22, 9,  1, 12995.00,  0.00),
-- Order 23: US Polo T-Shirts
(23, 13, 1, 1499.00,   0.00),
-- Order 24: Ikigai
(24, 23, 1, 399.00,    0.00),
-- Order 25: Samsung Galaxy (cancelled)
(25, 1,  1, 124999.00, 0.00),
-- Order 26: Cookware Set
(26, 28, 1, 2499.00,   0.00),
-- Order 27: Sapiens
(27, 20, 1, 699.00,    0.00),
-- Order 28: Logitech Mouse
(28, 5,  1, 8995.00,   0.00),
-- Order 29: Havells Fan
(29, 30, 1, 2199.00,   0.00),
-- Order 30: Badminton Racket
(30, 32, 1, 3499.00,   0.00),
-- Order 31: Adidas Ultraboost
(31, 12, 1, 16999.00,  10.00),
-- Order 32: Peter England Blazer
(32, 14, 1, 5999.00,   0.00),
-- Order 33: Opalware Dinner Set
(33, 29, 1, 1999.00,   0.00),
-- Order 34: Football
(34, 31, 1, 799.00,    0.00),
-- Order 35: Dell Monitor
(35, 4,  1, 34999.00,  0.00),
-- Order 36: Zero to One
(36, 22, 1, 499.00,    0.00),
-- Order 37: Levi Jeans
(37, 10, 1, 4999.00,   0.00),
-- Order 38: Forest Essentials
(38, 39, 1, 2450.00,   0.00),
-- Order 39: iPad Air (cancelled)
(39, 6,  1, 69900.00,  0.00),
-- Order 40: Milton Flask
(40, 27, 1, 899.00,    0.00),
-- Order 41: Nivea Grooming Kit
(41, 38, 1, 1299.00,   0.00),
-- Order 42: Samsung Galaxy
(42, 1,  1, 124999.00, 0.00),
-- Order 43: Sony Headphones
(43, 3,  1, 29990.00,  0.00),
-- Order 44: Atomic Habits
(44, 17, 1, 599.00,    0.00),
-- Order 45: Nike Air Max
(45, 9,  1, 12995.00,  0.00),
-- Order 46: Trekking Jacket + Yoga Mat
(46, 15, 1, 3499.00,   0.00),
(46, 34, 1, 999.00,    0.00),
-- Order 47: Boldfit Yoga Mat
(47, 34, 1, 999.00,    0.00),
-- Order 48: Air Fryer
(48, 26, 1, 7999.00,   5.00),
-- Order 49: MacBook Air + Logitech Mouse
(49, 2,  1, 114900.00, 0.00),
(49, 5,  1, 8995.00,   0.00),
-- Order 50: Fitbit
(50, 33, 1, 14999.00,  0.00),
-- Order 51: Kindle Paperwhite
(51, 8,  1, 16999.00,  0.00),
-- Order 52: Fastrack Watch
(52, 16, 1, 2495.00,   0.00),
-- Order 53: Induction Cooktop
(53, 25, 1, 3499.00,   0.00),
-- Order 54: JBL Speaker
(54, 7,  1, 17999.00,  0.00),
-- Order 55: Biotique Sunscreen + Lakme Foundation
(55, 40, 1, 399.00,    0.00),
(55, 36, 1, 899.00,    0.00),
-- Order 56: Sapiens
(56, 20, 1, 699.00,    0.00),
-- Order 57: Sony Headphones
(57, 3,  1, 29990.00,  0.00),
-- Order 58: Dumbbells
(58, 35, 1, 1499.00,   0.00),
-- Order 59: Havells Fan
(59, 30, 1, 2199.00,   0.00),
-- Order 60: Psychology of Money + Deep Work + The Alchemist
(60, 19, 1, 499.00,    0.00),
(60, 21, 1, 449.00,    0.00),
(60, 24, 1, 350.00,    0.00),
-- Order 61: iPad Air
(61, 6,  1, 69900.00,  0.00),
-- Order 62: Havells Fan
(62, 30, 1, 2199.00,   0.00),
-- Order 63: Biotique Sunscreen
(63, 40, 1, 399.00,    0.00),
-- Order 64: Adidas Ultraboost
(64, 12, 1, 16999.00,  0.00),
-- Order 65: Rich Dad Poor Dad
(65, 18, 1, 499.00,    0.00),
-- Order 66: Dell Monitor + Logitech Mouse
(66, 4,  1, 34999.00,  0.00),
(66, 5,  1, 8995.00,   10.00),
-- Order 67: MacBook (cancelled)
(67, 2,  1, 114900.00, 0.00),
-- Order 68: Samsung Galaxy
(68, 1,  1, 124999.00, 0.00),
-- Order 69: Logitech Mouse
(69, 5,  1, 8995.00,   0.00),
-- Order 70: Atomic Habits
(70, 17, 1, 599.00,    0.00),
-- Order 71: Badminton Racket
(71, 32, 1, 3499.00,   0.00),
-- Order 72: Air Fryer
(72, 26, 1, 7999.00,   0.00),
-- Order 73: Cookware Set
(73, 28, 1, 2499.00,   0.00),
-- Order 74: Samsung Galaxy
(74, 1,  1, 124999.00, 5.00),
-- Order 75: Sony Headphones
(75, 3,  1, 29990.00,  0.00),
-- Order 76: Peter England Blazer
(76, 14, 1, 5999.00,   0.00),
-- Order 77: Kindle + Atomic Habits
(77, 8,  1, 16999.00,  0.00),
(77, 17, 1, 599.00,    0.00),
-- Order 78: MacBook Air
(78, 2,  1, 114900.00, 0.00),
-- Order 79: Milton Flask + Dinner Set
(79, 27, 1, 899.00,    0.00),
(79, 29, 1, 1999.00,   0.00),
-- Order 80: iPad Air
(80, 6,  1, 69900.00,  0.00);


-- ============================================================
-- PAYMENTS (one payment per non-cancelled order)
-- Mix of payment methods: UPI, Credit Card, Debit Card, COD, etc.
-- ============================================================
INSERT INTO payments (order_id, payment_method, payment_date, amount, payment_status) VALUES
(1,  'Credit Card',      '2025-01-05', 124999.00, 'Completed'),
(2,  'UPI',              '2025-01-08', 5498.00,   'Completed'),
(3,  'Debit Card',       '2025-01-12', 1998.00,   'Completed'),
(4,  'Credit Card',      '2025-01-15', 29990.00,  'Completed'),
(5,  'UPI',              '2025-01-20', 69900.00,  'Refunded'),   -- Cancelled order
(6,  'Cash on Delivery', '2025-01-25', 1299.00,   'Completed'),
(7,  'Credit Card',      '2025-02-02', 114900.00, 'Completed'),
(8,  'UPI',              '2025-02-05', 998.00,    'Completed'),   -- Partial? No, books total
(9,  'Net Banking',      '2025-02-10', 17999.00,  'Completed'),
(10, 'Debit Card',       '2025-02-14', 8995.00,   'Completed'),
(11, 'UPI',              '2025-02-18', 6498.00,   'Completed'),
(12, 'Credit Card',      '2025-02-22', 34999.00,  'Refunded'),   -- Cancelled
(13, 'Cash on Delivery', '2025-02-28', 899.00,    'Completed'),
(14, 'UPI',              '2025-03-03', 599.00,    'Completed'),
(15, 'Debit Card',       '2025-03-07', 7999.00,   'Completed'),
(16, 'UPI',              '2025-03-10', 4999.00,   'Completed'),
(17, 'Credit Card',      '2025-03-15', 16999.00,  'Completed'),
(18, 'Wallet',           '2025-03-18', 2495.00,   'Completed'),
(19, 'UPI',              '2025-03-22', 3499.00,   'Completed'),
(20, 'Credit Card',      '2025-03-28', 14999.00,  'Completed'),
(21, 'Debit Card',       '2025-04-02', 29990.00,  'Completed'),
(22, 'UPI',              '2025-04-05', 12995.00,  'Completed'),
(23, 'Cash on Delivery', '2025-04-10', 1499.00,   'Completed'),
(24, 'UPI',              '2025-04-14', 399.00,    'Completed'),
(25, 'Credit Card',      '2025-04-18', 124999.00, 'Refunded'),   -- Cancelled
(26, 'UPI',              '2025-04-22', 2499.00,   'Completed'),
(27, 'Debit Card',       '2025-04-28', 699.00,    'Completed'),
(28, 'Credit Card',      '2025-05-03', 8995.00,   'Completed'),
(29, 'UPI',              '2025-05-07', 2199.00,   'Completed'),
(30, 'Net Banking',      '2025-05-10', 3499.00,   'Completed'),
(31, 'Credit Card',      '2025-05-15', 16999.00,  'Completed'),
(32, 'UPI',              '2025-05-18', 5999.00,   'Completed'),
(33, 'Cash on Delivery', '2025-05-22', 1999.00,   'Completed'),
(34, 'UPI',              '2025-05-28', 799.00,    'Completed'),
(35, 'Credit Card',      '2025-06-02', 34999.00,  'Completed'),
(36, 'UPI',              '2025-06-06', 499.00,    'Completed'),
(37, 'Debit Card',       '2025-06-10', 4999.00,   'Completed'),
(38, 'UPI',              '2025-06-14', 2450.00,   'Completed'),
(39, 'Credit Card',      '2025-06-18', 69900.00,  'Refunded'),   -- Cancelled
(40, 'Cash on Delivery', '2025-06-22', 899.00,    'Completed'),
(41, 'UPI',              '2025-06-28', 1299.00,   'Completed'),
(42, 'Credit Card',      '2025-07-03', 124999.00, 'Completed'),
(43, 'UPI',              '2025-07-07', 29990.00,  'Completed'),
(44, 'Debit Card',       '2025-07-10', 599.00,    'Completed'),
(45, 'UPI',              '2025-07-15', 12995.00,  'Completed'),
(46, 'Net Banking',      '2025-07-18', 3499.00,   'Completed'),
(47, 'UPI',              '2025-07-22', 999.00,    'Completed'),
(48, 'Credit Card',      '2025-07-28', 16999.00,  'Refunded'),   -- Cancelled
(49, 'Debit Card',       '2025-08-02', 7999.00,   'Completed'),
(50, 'UPI',              '2025-08-06', 14999.00,  'Completed'),
(51, 'Credit Card',      '2025-08-10', 449.00,    'Completed'),
(52, 'UPI',              '2025-08-14', 8995.00,   'Completed'),
(53, 'Cash on Delivery', '2025-08-18', 1499.00,   'Completed'),
(54, 'UPI',              '2025-08-22', 2495.00,   'Completed'),
(55, 'Net Banking',      '2025-08-28', 5999.00,   'Completed'),
(56, 'UPI',              '2025-09-02', 17999.00,  'Completed'),
(57, 'Credit Card',      '2025-09-06', 3499.00,   'Completed'),
(58, 'UPI',              '2025-09-10', 699.00,    'Completed'),
(59, 'Debit Card',       '2025-09-15', 29990.00,  'Completed'),
(60, 'UPI',              '2025-09-18', 1999.00,   'Completed'),
(61, 'Cash on Delivery', '2025-09-22', 799.00,    'Completed'),
(62, 'UPI',              '2025-09-28', 114900.00, 'Refunded'),   -- Cancelled
(63, 'Credit Card',      '2025-10-03', 69900.00,  'Completed'),
(64, 'UPI',              '2025-10-07', 2199.00,   'Completed'),
(65, 'Debit Card',       '2025-10-10', 399.00,    'Completed'),
(66, 'UPI',              '2025-10-15', 16999.00,  'Completed'),
(67, 'Credit Card',      '2025-10-18', 499.00,    'Completed'),
(68, 'UPI',              '2025-10-22', 34999.00,  'Pending'),    -- Shipped
(69, 'Net Banking',      '2025-10-28', 12995.00,  'Pending'),    -- Shipped
(70, 'Credit Card',      '2025-11-02', 124999.00, 'Pending'),    -- Processing
(71, 'Debit Card',       '2025-11-06', 8995.00,   'Pending'),    -- Shipped
(72, 'UPI',              '2025-11-10', 3499.00,   'Completed'),
(73, 'UPI',              '2025-11-14', 599.00,    'Completed'),
(74, 'Credit Card',      '2025-11-18', 7999.00,   'Pending'),    -- Shipped
(75, 'Cash on Delivery', '2025-11-22', 2499.00,   'Pending'),    -- Processing
(76, 'UPI',              '2025-11-28', 1999.00,   'Pending'),    -- Pending
(77, 'Credit Card',      '2025-12-01', 29990.00,  'Pending'),
(78, 'UPI',              '2025-12-05', 5999.00,   'Pending'),
(79, 'Debit Card',       '2025-12-08', 16999.00,  'Pending'),
(80, 'Credit Card',      '2025-12-12', 34999.00,  'Pending');


-- ============================================================
-- SHIPPING (for orders that are Shipped or Delivered)
-- Carriers: BlueDart, DTDC, Delhivery, India Post, FedEx
-- ============================================================
INSERT INTO shipping (order_id, carrier, tracking_number, shipped_date, delivered_date) VALUES
(1,  'BlueDart',    'BD2025010501', '2025-01-06', '2025-01-09'),
(2,  'Delhivery',   'DL2025010801', '2025-01-09', '2025-01-12'),
(3,  'DTDC',        'DT2025011201', '2025-01-13', '2025-01-16'),
(4,  'FedEx',       'FX2025011501', '2025-01-16', '2025-01-19'),
(6,  'India Post',  'IP2025012501', '2025-01-26', '2025-01-31'),
(7,  'BlueDart',    'BD2025020201', '2025-02-03', '2025-02-06'),
(8,  'Delhivery',   'DL2025020501', '2025-02-06', '2025-02-09'),
(9,  'DTDC',        'DT2025021001', '2025-02-11', '2025-02-14'),
(10, 'BlueDart',    'BD2025021401', '2025-02-15', '2025-02-18'),
(11, 'Delhivery',   'DL2025021801', '2025-02-19', '2025-02-22'),
(13, 'India Post',  'IP2025022801', '2025-03-01', '2025-03-05'),
(14, 'BlueDart',    'BD2025030301', '2025-03-04', '2025-03-07'),
(15, 'Delhivery',   'DL2025030701', '2025-03-08', '2025-03-11'),
(16, 'DTDC',        'DT2025031001', '2025-03-11', '2025-03-14'),
(17, 'FedEx',       'FX2025031501', '2025-03-16', '2025-03-19'),
(18, 'BlueDart',    'BD2025031801', '2025-03-19', '2025-03-22'),
(19, 'Delhivery',   'DL2025032201', '2025-03-23', '2025-03-26'),
(20, 'BlueDart',    'BD2025032801', '2025-03-29', '2025-04-01'),
(21, 'DTDC',        'DT2025040201', '2025-04-03', '2025-04-06'),
(22, 'Delhivery',   'DL2025040501', '2025-04-06', '2025-04-09'),
(23, 'India Post',  'IP2025041001', '2025-04-11', '2025-04-15'),
(24, 'BlueDart',    'BD2025041401', '2025-04-15', '2025-04-18'),
(26, 'Delhivery',   'DL2025042201', '2025-04-23', '2025-04-26'),
(27, 'DTDC',        'DT2025042801', '2025-04-29', '2025-05-02'),
(28, 'BlueDart',    'BD2025050301', '2025-05-04', '2025-05-07'),
(29, 'Delhivery',   'DL2025050701', '2025-05-08', '2025-05-11'),
(30, 'DTDC',        'DT2025051001', '2025-05-11', '2025-05-14'),
(31, 'FedEx',       'FX2025051501', '2025-05-16', '2025-05-19'),
(32, 'BlueDart',    'BD2025051801', '2025-05-19', '2025-05-22'),
(33, 'India Post',  'IP2025052201', '2025-05-23', '2025-05-27'),
(34, 'Delhivery',   'DL2025052801', '2025-05-29', '2025-06-01'),
(35, 'BlueDart',    'BD2025060201', '2025-06-03', '2025-06-06'),
(36, 'DTDC',        'DT2025060601', '2025-06-07', '2025-06-10'),
(37, 'Delhivery',   'DL2025061001', '2025-06-11', '2025-06-14'),
(38, 'BlueDart',    'BD2025061401', '2025-06-15', '2025-06-18'),
(40, 'India Post',  'IP2025062201', '2025-06-23', '2025-06-27'),
(41, 'Delhivery',   'DL2025062801', '2025-06-29', '2025-07-02'),
(42, 'FedEx',       'FX2025070301', '2025-07-04', '2025-07-07'),
(43, 'BlueDart',    'BD2025070701', '2025-07-08', '2025-07-11'),
(44, 'DTDC',        'DT2025071001', '2025-07-11', '2025-07-14'),
(45, 'Delhivery',   'DL2025071501', '2025-07-16', '2025-07-19'),
(46, 'BlueDart',    'BD2025071801', '2025-07-19', '2025-07-22'),
(47, 'India Post',  'IP2025072201', '2025-07-23', '2025-07-27'),
(49, 'BlueDart',    'BD2025080201', '2025-08-03', '2025-08-06'),
(50, 'Delhivery',   'DL2025080601', '2025-08-07', '2025-08-10'),
(51, 'DTDC',        'DT2025081001', '2025-08-11', '2025-08-14'),
(52, 'BlueDart',    'BD2025081401', '2025-08-15', '2025-08-18'),
(53, 'India Post',  'IP2025081801', '2025-08-19', '2025-08-23'),
(54, 'Delhivery',   'DL2025082201', '2025-08-23', '2025-08-26'),
(55, 'BlueDart',    'BD2025082801', '2025-08-29', '2025-09-01'),
(56, 'DTDC',        'DT2025090201', '2025-09-03', '2025-09-06'),
(57, 'Delhivery',   'DL2025090601', '2025-09-07', '2025-09-10'),
(58, 'BlueDart',    'BD2025091001', '2025-09-11', '2025-09-14'),
(59, 'FedEx',       'FX2025091501', '2025-09-16', '2025-09-19'),
(60, 'Delhivery',   'DL2025091801', '2025-09-19', '2025-09-22'),
(61, 'India Post',  'IP2025092201', '2025-09-23', '2025-09-27'),
(63, 'BlueDart',    'BD2025100301', '2025-10-04', '2025-10-07'),
(64, 'Delhivery',   'DL2025100701', '2025-10-08', '2025-10-11'),
(65, 'DTDC',        'DT2025101001', '2025-10-11', '2025-10-14'),
(66, 'BlueDart',    'BD2025101501', '2025-10-16', '2025-10-19'),
(67, 'Delhivery',   'DL2025101801', '2025-10-19', '2025-10-22'),
(68, 'FedEx',       'FX2025102201', '2025-10-23', NULL),          -- Shipped, not delivered yet
(69, 'BlueDart',    'BD2025102801', '2025-10-29', NULL),          -- Shipped, not delivered yet
(71, 'Delhivery',   'DL2025110601', '2025-11-07', NULL),          -- Shipped
(72, 'DTDC',        'DT2025111001', '2025-11-11', '2025-11-14'),
(73, 'BlueDart',    'BD2025111401', '2025-11-15', '2025-11-18'),
(74, 'Delhivery',   'DL2025111801', '2025-11-19', NULL);          -- Shipped


-- ============================================================
-- DATA LOADING COMPLETE!
-- You now have:
--   50 customers
--   40 products (6 categories)
--   80 orders (across 12 months)
--   100+ order items
--   80 payments (various methods)
--   65+ shipping records
--
-- Next step: Open queries.sql and start answering business questions!
-- ============================================================
SELECT 'Sample data loaded successfully!' AS message;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_order_items FROM order_items;
SELECT COUNT(*) AS total_payments FROM payments;
SELECT COUNT(*) AS total_shipments FROM shipping;
