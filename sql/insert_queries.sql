-- Products
INSERT INTO products (id, created_at, updated_at, description, name, price, sku)
VALUES
  (1, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Wireless noise-cancelling headphones', 'Bluetooth Headphones', 199.99, 'BH-1001'),
  (2, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Stainless steel water bottle, 750ml', 'Eco Water Bottle', 29.99, 'EWB-750'),
  (3, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Ergonomic office chair with lumbar support', 'Office Chair Pro', 349.50, 'OCP-2023'),
  (4, '2025-07-03 08:40:00', '2025-07-03 08:40:00', '4K Ultra HD Smart TV, 55-inch', 'Smart TV 55', 599.99, 'STV-5501'),
  (5, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Lightweight running shoes, size 9', 'Runner X Shoes', 89.99, 'RXS-009'),
  (6, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Cordless vacuum cleaner with HEPA filter', 'Vacuum Pro', 249.99, 'VCP-300'),
  (7, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Ceramic non-stick frying pan, 12-inch', 'Chef Pan', 49.99, 'CPN-120'),
  (8, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Smart thermostat with Wi-Fi', 'Smart Thermostat', 129.99, 'STH-101'),
  (9, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Portable Bluetooth speaker, waterproof', 'SoundWave Speaker', 79.99, 'SWS-200'),
  (10, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Electric kettle, 1.7L', 'Quick Boil Kettle', 39.99, 'QBK-170'),
  (11, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Adjustable standing desk, 48-inch', 'StandUp Desk', 299.99, 'SUD-480'),
  (12, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Wireless gaming mouse with RGB', 'Gamer Mouse', 59.99, 'GMX-500'),
  (13, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'LED desk lamp with USB port', 'BrightLight Lamp', 34.99, 'BLL-200'),
  (14, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Air purifier with HEPA filter', 'CleanAir Purifier', 149.99, 'CAP-300'),
  (15, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Stainless steel coffee maker, 12-cup', 'BrewMaster Coffee', 89.99, 'BMC-120'),
  (16, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Yoga mat, non-slip, 6mm', 'Zen Yoga Mat', 24.99, 'ZYM-006'),
  (17, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Smartwatch with heart rate monitor', 'FitTrack Smartwatch', 129.99, 'FTS-100'),
  (18, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Backpack with laptop compartment', 'TravelPro Backpack', 69.99, 'TPB-200'),
  (19, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Electric toothbrush with timer', 'SmileBright Brush', 49.99, 'SBB-100'),
  (20, '2025-07-03 08:40:00', '2025-07-03 08:40:00', 'Microwave oven, 1.1 cu ft', 'QuickHeat Microwave', 109.99, 'QHM-110');

-- Locations
INSERT INTO locations (id, created_at, updated_at, address, contact_email, contact_person, contact_phone, name)
VALUES
  (1, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '123 Main St, New York, NY 10001', 'nywarehouse@company.com', 'John Smith', '+1-212-555-0101', 'New York Warehouse'),
  (2, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '456 Oak Ave, Los Angeles, CA 90001', 'lawarehouse@company.com', 'Emma Johnson', '+1-323-555-0202', 'Los Angeles Warehouse'),
  (3, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '789 Pine Rd, Chicago, IL 60601', 'chiwarehouse@company.com', 'Michael Brown', '+1-312-555-0303', 'Chicago Warehouse'),
  (4, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '101 Maple Dr, Houston, TX 77002', 'houwarehouse@company.com', 'Sarah Davis', '+1-713-555-0404', 'Houston Warehouse'),
  (5, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '202 Birch Ln, Miami, FL 33101', 'miawarehouse@company.com', 'David Wilson', '+1-305-555-0505', 'Miami Warehouse'),
  (6, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '303 Cedar St, Seattle, WA 98101', 'seawarehouse@company.com', 'Lisa Taylor', '+1-206-555-0606', 'Seattle Warehouse'),
  (7, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '404 Elm St, Boston, MA 02108', 'boswarehouse@company.com', 'James Anderson', '+1-617-555-0707', 'Boston Warehouse'),
  (8, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '505 Spruce Ct, Atlanta, GA 30301', 'atwarehouse@company.com', 'Emily Martinez', '+1-404-555-0808', 'Atlanta Warehouse'),
  (9, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '606 Walnut Ave, Denver, CO 80201', 'denwarehouse@company.com', 'Robert Lee', '+1-303-555-0909', 'Denver Warehouse'),
  (10, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '707 Ash Rd, Phoenix, AZ 85001', 'phxwarehouse@company.com', 'Jennifer Clark', '+1-602-555-1010', 'Phoenix Warehouse'),
  (11, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '808 Laurel St, San Francisco, CA 94101', 'sfwarehouse@company.com', 'William White', '+1-415-555-1111', 'San Francisco Warehouse'),
  (12, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '909 Chestnut Dr, Dallas, TX 75201', 'dalwarehouse@company.com', 'Sophia Harris', '+1-214-555-1212', 'Dallas Warehouse'),
  (13, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1010 Magnolia Ln, Portland, OR 97201', 'porwarehouse@company.com', 'Thomas Lewis', '+1-503-555-1313', 'Portland Warehouse'),
  (14, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1111 Sycamore Ave, Austin, TX 78701', 'auswarehouse@company.com', 'Olivia Walker', '+1-512-555-1414', 'Austin Warehouse'),
  (15, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1212 Poplar St, Philadelphia, PA 19101', 'phlwarehouse@company.com', 'Daniel Young', '+1-215-555-1515', 'Philadelphia Warehouse'),
  (16, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1313 Willow Rd, Minneapolis, MN 55401', 'minwarehouse@company.com', 'Ava King', '+1-612-555-1616', 'Minneapolis Warehouse'),
  (17, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1414 Hazel Ct, Charlotte, NC 28201', 'cltwarehouse@company.com', 'Charles Green', '+1-704-555-1717', 'Charlotte Warehouse'),
  (18, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1515 Fir St, San Diego, CA 92101', 'sdwarehouse@company.com', 'Mia Adams', '+1-619-555-1818', 'San Diego Warehouse'),
  (19, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1616 Cedarwood Dr, Nashville, TN 37201', 'nshwarehouse@company.com', 'Ethan Scott', '+1-615-555-1919', 'Nashville Warehouse'),
  (20, '2025-07-03 08:42:00', '2025-07-03 08:42:00', '1717 Pinewood Ave, Las Vegas, NV 89101', 'lvwarehouse@company.com', 'Isabella Baker', '+1-702-555-2020', 'Las Vegas Warehouse');

-- Statuses
INSERT INTO statuses (id, created_at, updated_at, color_code, description, is_active, name)
VALUES
  (1, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#00FF00', 'In stock and available', true, 'Available'),
  (2, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#FF0000', 'Out of stock', false, 'Out of Stock'),
  (3, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#FFFF00', 'Awaiting restock', true, 'Pending Restock'),
  (4, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#FFA500', 'Reserved for order', true, 'Reserved'),
  (5, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#FF4500', 'Damaged items', true, 'Damaged'),
  (6, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#4682B4', 'Under inspection', true, 'Inspection'),
  (7, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#800080', 'Quarantined for review', true, 'Quarantine'),
  (8, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#008000', 'Received from supplier', true, 'Received'),
  (9, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#DC143C', 'Shipped to customer', true, 'Shipped'),
  (10, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#FFD700', 'In transit to warehouse', true, 'In Transit'),
  (11, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#6A5ACD', 'On hold for quality check', true, 'On Hold'),
  (12, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#20B2AA', 'Allocated for production', true, 'Allocated'),
  (13, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#9932CC', 'Returned by customer', true, 'Returned'),
  (14, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#228B22', 'Ready for dispatch', true, 'Ready'),
  (15, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#FF69B4', 'Awaiting supplier confirmation', true, 'Awaiting Confirmation'),
  (16, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#4169E1', 'Processed for return', true, 'Processed Return'),
  (17, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#9ACD32', 'Stock count verified', true, 'Verified'),
  (18, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#B22222', 'Discontinued item', false, 'Discontinued'),
  (19, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#00CED1', 'In quality assurance', true, 'Quality Assurance'),
  (20, '2025-07-03 08:44:00', '2025-07-03 08:44:00', '#8B008B', 'Pending disposal', true, 'Pending Disposal');

INSERT INTO category_entity (category_id, category_description, category_name)
VALUES
  ('CAT001', 'Electronics and gadgets', 'Electronics'),
  ('CAT002', 'Home and kitchen appliances', 'Home Appliances'),
  ('CAT003', 'Furniture for home and office', 'Furniture'),
  ('CAT004', 'Sporting goods and fitness equipment', 'Sports & Fitness'),
  ('CAT005', 'Personal care and hygiene products', 'Personal Care'),
  ('CAT006', 'Audio and sound equipment', 'Audio Equipment'),
  ('CAT007', 'Lighting and electrical fixtures', 'Lighting'),
  ('CAT008', 'Outdoor and camping gear', 'Outdoor Gear'),
  ('CAT009', 'Office supplies and stationery', 'Office Supplies'),
  ('CAT010', 'Kitchenware and utensils', 'Kitchenware'),
  ('CAT011', 'Fitness accessories and wearables', 'Fitness Accessories'),
  ('CAT012', 'Home decor and textiles', 'Home Decor'),
  ('CAT013', 'Computer hardware and accessories', 'Computer Hardware'),
  ('CAT014', 'Health and wellness products', 'Wellness'),
  ('CAT015', 'Travel and luggage', 'Travel Gear'),
  ('CAT016', 'Security and surveillance equipment', 'Security Systems'),
  ('CAT017', 'Pet supplies and accessories', 'Pet Supplies'),
  ('CAT018', 'Automotive parts and accessories', 'Automotive'),
  ('CAT019', 'Gardening tools and supplies', 'Gardening'),
  ('CAT020', 'Toys and recreational products', 'Toys & Recreation');

INSERT INTO supplier (supplier_id, company_name, password, status, supplier_address, supplier_city, supplier_country, supplier_description, supplier_email, supplier_name, supplier_phone_number, supplier_zip_code, category_id)
VALUES
  ('SUP001', 'TechTrend Innovations', 'hashedpass1', 'Active', '100 Tech Rd', 'San Jose', 'USA', 'Electronics supplier', 'contact@techtrend.com', 'Alice Brown', '+1-408-555-0101', '95112', 'CAT001'),
  ('SUP002', 'HomeComfort Solutions', 'hashedpass2', 'Active', '200 Comfort St', 'Chicago', 'USA', 'Home appliances supplier', 'info@homecomfort.com', 'Bob Wilson', '+1-312-555-0202', '60601', 'CAT002'),
  ('SUP003', 'FurnitureWorks', 'hashedpass3', 'Active', '300 Wood Ave', 'Dallas', 'USA', 'Furniture supplier', 'sales@furnitureworks.com', 'Carol Lee', '+1-214-555-0303', '75201', 'CAT003'),
  ('SUP004', 'FitGear Supplies', 'hashedpass4', 'Active', '400 Sport Ln', 'Miami', 'USA', 'Sports equipment supplier', 'support@fitgear.com', 'David Kim', '+1-305-555-0404', '33101', 'CAT004'),
  ('SUP005', 'CarePro Products', 'hashedpass5', 'Active', '500 Health Dr', 'Seattle', 'USA', 'Personal care products', 'care@carepro.com', 'Emma Davis', '+1-206-555-0505', '98101', 'CAT005'),
  ('SUP006', 'SoundWave Tech', 'hashedpass6', 'Active', '600 Audio St', 'Boston', 'USA', 'Audio equipment supplier', 'info@soundwave.com', 'Frank Taylor', '+1-617-555-0606', '02108', 'CAT006'),
  ('SUP007', 'BrightLight Co', 'hashedpass7', 'Active', '700 Light Rd', 'Atlanta', 'USA', 'Lighting solutions', 'sales@brightlight.com', 'Grace White', '+1-404-555-0707', '30301', 'CAT007'),
  ('SUP008', 'OutdoorPro', 'hashedpass8', 'Active', '800 Camp Dr', 'Denver', 'USA', 'Outdoor gear supplier', 'support@outdoorpro.com', 'Henry Clark', '+1-303-555-0808', '80201', 'CAT008'),
  ('SUP009', 'OfficeEssentials', 'hashedpass9', 'Active', '900 Desk Ave', 'Houston', 'USA', 'Office supplies', 'info@officeessentials.com', 'Isabel Martinez', '+1-713-555-0909', '77002', 'CAT009'),
  ('SUP010', 'KitchenCraft', 'hashedpass10', 'Active', '1000 Cook St', 'Phoenix', 'USA', 'Kitchenware supplier', 'contact@kitchencraft.com', 'Jack Adams', '+1-602-555-1010', '85001', 'CAT010'),
  ('SUP011', 'FitTech', 'hashedpass11', 'Active', '1100 Fit Rd', 'San Francisco', 'USA', 'Fitness accessories', 'sales@fittech.com', 'Kelly Green', '+1-415-555-1111', '94101', 'CAT011'),
  ('SUP012', 'DecorElite', 'hashedpass12', 'Active', '1200 Decor Ln', 'Portland', 'USA', 'Home decor products', 'info@decorelite.com', 'Liam Scott', '+1-503-555-1212', '97201', 'CAT012'),
  ('SUP013', 'TechBits', 'hashedpass13', 'Active', '1300 Byte Ave', 'Austin', 'USA', 'Computer hardware', 'support@techbits.com', 'Mia Harris', '+1-512-555-1313', '78701', 'CAT013'),
  ('SUP014', 'WellnessHub', 'hashedpass14', 'Active', '1400 Health St', 'Philadelphia', 'USA', 'Wellness products', 'care@wellnesshub.com', 'Noah Young', '+1-215-555-1414', '19101', 'CAT014'),
  ('SUP015', 'TravelMate', 'hashedpass15', 'Active', '1500 Trip Rd', 'Minneapolis', 'USA', 'Travel gear supplier', 'info@travelmate.com', 'Olivia King', '+1-612-555-1515', '55401', 'CAT015'),
  ('SUP016', 'SecureTech', 'hashedpass16', 'Active', '1600 Safe Dr', 'Charlotte', 'USA', 'Security systems', 'contact@securetech.com', 'Peter Brown', '+1-704-555-1616', '28201', 'CAT016'),
  ('SUP017', 'PetZone', 'hashedpass17', 'Active', '1700 Pet Ln', 'San Diego', 'USA', 'Pet supplies', 'sales@petzone.com', 'Quinn Lee', '+1-619-555-1717', '92101', 'CAT017'),
  ('SUP018', 'AutoParts Co', 'hashedpass18', 'Active', '1800 Auto Rd', 'Nashville', 'USA', 'Automotive parts', 'info@autoparts.com', 'Rachel Wilson', '+1-615-555-1818', '37201', 'CAT018'),
  ('SUP019', 'GreenGrow', 'hashedpass19', 'Active', '1900 Garden St', 'Las Vegas', 'USA', 'Gardening supplies', 'support@greengrow.com', 'Sam Davis', '+1-702-555-1919', '89101', 'CAT019'),
  ('SUP020', 'ToyWorld', 'hashedpass20', 'Active', '2000 Play Ave', 'New York', 'USA', 'Toys and recreation', 'care@toyworld.com', 'Tina Clark', '+1-212-555-2020', '10001', 'CAT020');

-- Supplier Key Metrics
INSERT INTO supplier_key_metrics (id, month, on_time_delivery, quality_score, record_date, responsiveness, year, supplier_id)
VALUES
  ('MET001', 6, 95, 90, '2025-06-30', 85, 2025, 'SUP001'),
  ('MET002', 6, 88, 92, '2025-06-30', 80, 2025, 'SUP002'),
  ('MET003', 6, 90, 85, '2025-06-30', 88, 2025, 'SUP003'),
  ('MET004', 6, 92, 87, '2025-06-30', 90, 2025, 'SUP004'),
  ('MET005', 6, 85, 89, '2025-06-30', 82, 2025, 'SUP005'),
  ('MET006', 6, 94, 91, '2025-06-30', 87, 2025, 'SUP006'),
  ('MET007', 6, 89, 90, '2025-06-30', 85, 2025, 'SUP007'),
  ('MET008', 6, 91, 88, '2025-06-30', 89, 2025, 'SUP008'),
  ('MET009', 6, 87, 86, '2025-06-30', 84, 2025, 'SUP009'),
  ('MET010', 6, 93, 92, '2025-06-30', 86, 2025, 'SUP010'),
  ('MET011', 6, 90, 90, '2025-06-30', 88, 2025, 'SUP011'),
  ('MET012', 6, 88, 89, '2025-06-30', 85, 2025, 'SUP012'),
  ('MET013', 6, 92, 87, '2025-06-30', 90, 2025, 'SUP013'),
  ('MET014', 6, 86, 88, '2025-06-30', 83, 2025, 'SUP014'),
  ('MET015', 6, 94, 91, '2025-06-30', 87, 2025, 'SUP015'),
  ('MET016', 6, 89, 90, '2025-06-30', 85, 2025, 'SUP016'),
  ('MET017', 6, 91, 89, '2025-06-30', 88, 2025, 'SUP017'),
  ('MET018', 6, 87, 86, '2025-06-30', 84, 2025, 'SUP018'),
  ('MET019', 6, 93, 92, '2025-06-30', 86, 2025, 'SUP019'),
  ('MET020', 6, 90, 90, '2025-06-30', 88, 2025, 'SUP020');

-- Inventory
INSERT INTO inventory (id, created_at, updated_at, damaged_quantity, quantity, location_id, product_id, status_id)
VALUES
  (1, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 2, 100, 1, 1, 1),
  (2, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 1, 150, 2, 2, 1),
  (3, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 50, 3, 3, 4),
  (4, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 3, 200, 4, 4, 1),
  (5, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 80, 5, 5, 1),
  (6, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 1, 120, 6, 6, 6),
  (7, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 2, 90, 7, 7, 1),
  (8, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 60, 8, 8, 4),
  (9, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 1, 110, 9, 9, 1),
  (10, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 70, 10, 10, 1),
  (11, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 2, 130, 11, 11, 11),
  (12, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 1, 100, 12, 12, 1),
  (13, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 85, 13, 13, 4),
  (14, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 3, 140, 14, 14, 1),
  (15, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 95, 15, 15, 1),
  (16, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 1, 110, 16, 16, 6),
  (17, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 2, 120, 17, 17, 1),
  (18, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 75, 18, 18, 4),
  (19, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 1, 105, 19, 19, 1),
  (20, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 0, 90, 20, 20, 1);

-- Inventory Transactions
INSERT INTO inventory_transactions (id, created_at, updated_at, quantity, received_by, reference_number, supplier, inventory_id, transaction_type_id)
VALUES
  (1, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 50, 'John Smith', 'REF001', 'TechTrend Innovations', 1, 8),
  (2, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 75, 'Emma Johnson', 'REF002', 'HomeComfort Solutions', 2, 8),
  (3, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 20, 'Michael Brown', 'REF003', 'FurnitureWorks', 3, 9),
  (4, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 100, 'Sarah Davis', 'REF004', 'FitGear Supplies', 4, 8),
  (5, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 40, 'David Wilson', 'REF005', 'CarePro Products', 5, 8),
  (6, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 60, 'Lisa Taylor', 'REF006', 'GadgetZone', 6, 6),
  (7, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 45, 'James Anderson', 'REF007', 'KitchenTech', 7, 8),
  (8, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 30, 'Emily Martinez', 'REF008', 'OfficeFurnish', 8, 9),
  (9, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 55, 'Robert Lee', 'REF009', 'ActiveGear', 9, 8),
  (10, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 35, 'Jennifer Clark', 'REF010', 'HealthEssentials', 10, 8),
  (11, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 65, 'William White', 'REF011', 'ElectroMart', 11, 11),
  (12, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 50, 'Sophia Harris', 'REF012', 'HomeGadgets', 12, 8),
  (13, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 40, 'Thomas Lewis', 'REF013', 'ErgoFurniture', 13, 9),
  (14, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 70, 'Olivia Walker', 'REF014', 'SportZone', 14, 8),
  (15, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 45, 'Daniel Young', 'REF015', 'PureCare', 15, 8),
  (16, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 55, 'Ava King', 'REF016', 'TechBits', 16, 6),
  (17, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 60, 'Charles Green', 'REF017', 'CookEasy', 17, 8),
  (18, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 35, 'Mia Adams', 'REF018', 'WorkSpace', 18, 9),
  (19, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 50, 'Ethan Scott', 'REF019', 'FitLife', 19, 8),
  (20, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 40, 'Isabella Baker', 'REF020', 'WellnessPro', 20, 8);

INSERT INTO damage_reports (id, created_at, updated_at, description, estimated_loss_value, inspection_date, inspection_officer, quantity, reason, report_number, reported_by, inventory_id, location_id, status_id)
VALUES
  (1, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Damaged during transit', 399.98, '2025-07-02', 'Tom Harris', 2, 'Transport Damage', 'DR001', 'John Smith', 1, 1, 5),
  (2, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Defective units found', 59.98, '2025-07-02', 'Anna Lee', 1, 'Manufacturing Defect', 'DR002', 'Emma Johnson', 2, 2, 5),
  (3, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Water damage in storage', 699.00, '2025-07-02', 'Mark Wilson', 3, 'Storage Issue', 'DR003', 'Michael Brown', 4, 3, 5),
  (4, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Broken during handling', 179.98, '2025-07-02', 'Laura Davis', 2, 'Handling Error', 'DR004', 'Sarah Davis', 6, 4, 5),
  (5, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Scratched surfaces', 499.50, '2025-07-02', 'James Clark', 1, 'Surface Damage', 'DR005', 'David Wilson', 7, 5, 5),
  (6, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Cracked components', 249.99, '2025-07-02', 'Susan Taylor', 2, 'Component Failure', 'DR006', 'Lisa Taylor', 9, 6, 5),
  (7, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Mishandled in warehouse', 99.98, '2025-07-02', 'Chris Green', 1, 'Warehouse Mishandling', 'DR007', 'James Anderson', 11, 7, 5),
  (8, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Faulty packaging', 259.98, '2025-07-02', 'Emily White', 3, 'Packaging Issue', 'DR008', 'Emily Martinez', 12, 8, 5),
  (9, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Electrical failure', 159.98, '2025-07-02', 'Robert King', 1, 'Electrical Issue', 'DR009', 'Robert Lee', 14, 9, 5),
  (10, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Dropped during unloading', 69.99, '2025-07-02', 'Jennifer Adams', 2, 'Unloading Error', 'DR010', 'Jennifer Clark', 15, 10, 5),
  (11, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Improper storage', 299.98, '2025-07-02', 'William Scott', 1, 'Storage Error', 'DR011', 'William White', 16, 11, 5),
  (12, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Defective batch', 119.98, '2025-07-02', 'Sophia Harris', 2, 'Batch Defect', 'DR012', 'Sophia Harris', 17, 12, 5),
  (13, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Crushed in transit', 349.50, '2025-07-02', 'Thomas Lee', 1, 'Transit Damage', 'DR013', 'Thomas Lewis', 19, 13, 5),
  (14, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Packaging failure', 219.98, '2025-07-02', 'Olivia Young', 2, 'Packaging Issue', 'DR014', 'Olivia Walker', 20, 14, 5),
  (15, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Water exposure', 89.99, '2025-07-02', 'Daniel King', 1, 'Water Damage', 'DR015', 'Daniel Young', 1, 15, 5),
  (16, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Mishandled units', 149.99, '2025-07-02', 'Ava Green', 2, 'Handling Error', 'DR016', 'Ava King', 2, 16, 5),
  (17, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Defective components', 129.99, '2025-07-02', 'Charles Brown', 1, 'Component Defect', 'DR017', 'Charles Green', 4, 17, 5),
  (18, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Broken in storage', 199.99, '2025-07-02', 'Mia Wilson', 2, 'Storage Damage', 'DR018', 'Mia Adams', 6, 18, 5),
  (19, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Electrical short', 109.99, '2025-07-02', 'Ethan Clark', 1, 'Electrical Issue', 'DR019', 'Ethan Scott', 7, 19, 5),
  (20, '2025-07-03 08:44:00', '2025-07-03 08:44:00', 'Cracked during transit', 219.98, '2025-07-02', 'Isabella Lee', 2, 'Transit Damage', 'DR020', 'Isabella Baker', 9, 20, 5);
  