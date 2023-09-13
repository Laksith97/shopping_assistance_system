use keells_super;
select * from RetailProduct;

use LAUGFS; 
CREATE TABLE RetailProducts (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Item_Name VARCHAR(255),
    Brand VARCHAR(255),
    Category VARCHAR(255),
    Unit_Cost DECIMAL(10,2),
    Promotions VARCHAR(255),
    Number_in_stock INT,
    Sold_Quantity INT,
    Inventory_Value DECIMAL(10,2),
    Sales_Value DECIMAL(10,2),
    Batch_No VARCHAR(255),
    MFG_Date DATE,
    EXP_Date DATE
);
INSERT INTO RetailProducts 
(ID, Item_Name, Brand, Category, Unit_Cost, Promotions, Number_in_stock, Sold_Quantity, Inventory_Value, Sales_Value, Batch_No, MFG_Date, EXP_Date) 
VALUES 
('LF00100', 'AXE Signature', 'AXE', 'Body Spray', 2200, 'No', 200, 50, 440000, 110000, 'AXE123', '2023-07-01', '2025-07-01'),
('LF00101', 'Natural Glow', 'Lever Ayush', 'Face Cream', 710, 'No', 150, 30, 106500, 35500, 'NG456', '2023-06-15', '2024-06-15'),
('LF00102', 'Anti Marks Turmeric', 'Lever Ayush', 'Face Cream', 710, 'No', 100, 20, 71000, 35500, 'AMT789', '2023-06-20', '2024-06-20'),
('LF00103', 'Anti Pimple Turmeric', 'Lever Ayush', 'Face Wash', 680, 'No', 120, 15, 81600, 34000, 'APT234', '2023-07-10', '2024-07-10'),
('LF00104', 'ANTI HAIRFALL BHRINGARAJ', 'Lever Ayush', 'Shampoo', 460, 'No', 180, 25, 82800, 23000, 'AHB567', '2023-07-05', '2025-07-05'),
('LF00105', 'Anto Dandruf Neem', 'Lever Ayush', 'Shampoo', 460, '10% off', 160, 40, 73600, 23000, 'ADN876', '2023-06-25', '2024-06-25'),
('LF00106', 'ANTI CAVITY Clove Oil', 'Lever Ayush', 'Toothpaste', 135, 'No', 220, 60, 29700, 6750, 'ACO345', '2023-06-28', '2024-06-28'),
('LF00107', 'Whitening with Rock Salt', 'Lever Ayush', 'Toothpaste', 135, 'No', 100, 10, 13500, 6750, 'WRS678', '2023-07-15', '2024-07-15'),
('LF00108', 'Cool & soft Aloe Vera Soap', 'Lever Ayush', 'Soap', 225, 'No', 250, 70, 56250, 11250, 'CAS901', '2023-07-10', '2024-07-10'),
('LF00109', 'Purifying Turmeric Soap', 'Lever Ayush', 'Soap', 225, 'No', 180, 25, 40500, 11250, 'PTS234', '2023-07-02', '2024-07-02'),
('LF00110', 'Natural Glow Safron', 'Lever Ayush', 'Soap', 225, 'No', 130, 20, 29250, 11250, 'NGS567', '2023-06-18', '2024-06-18'),
('LF00111', 'Clear Men(180ml)', 'Clear', 'Shampoo', 900, 'No', 170, 40, 153000, 45000, 'CM180890', '2023-06-25', '2024-06-25'),
('LF00112', 'Clear Shampoo Ice Cool 180ml', 'Clear', 'Shampoo', 700, 'No', 190, 50, 133000, 35000, 'CSIC789', '2023-06-30', '2024-06-30'),
('LF00113', 'Close Up Red Hot Toothpaste 120g', 'Close Up', 'Toothpaste', 375, 'No', 210, 30, 78750, 18750, 'CURHTP120', '2023-07-08', '2024-07-08'),
('LF00114', 'Close Up T/Paste Pepp/Splash 120g', 'Close Up', 'Toothpaste', 280, 'No', 220, 35, 61600, 14000, 'CTPS120', '2023-07-08', '2024-07-08'),
('LF00115', 'Comfort Fabric Conditioner Blue 220ml', 'Comfort', 'Fabric Softener', 390, 'No', 180, 25, 70200, 19500, 'CFCCB220', '2023-07-12', '2024-07-12'),
('LF00116', 'Comfort Fabric Conditioner Pink 210ml', 'Comfort', 'Fabric Softener', 390, '20% off', 170, 20, 66300, 19500, 'CFCCP210', '2023-07-12', '2024-07-12'),
('LF00117', 'Domex Ocean Fresh Toilet Cleaners 500ml', 'Domex', 'Toilet Cleaner', 600, 'No', 250, 60, 150000, 30000, 'DOFTC500', '2023-06-22', '2024-06-22'),
('LF00118', 'Domex Lime Fresh Toilet Cleaner 500ml', 'Domex', 'Toilet Cleaner', 600, 'No', 240, 50, 144000, 30000, 'DLFTC500', '2023-06-28', '2024-06-28'),
('LF00119', 'Dove D/Fresh TPaste FreshMint 100g', 'Dove', 'Toothpaste', 625, 'No', 260, 40, 162500, 31250, 'DDFTP100', '2023-07-14', '2024-07-14'),
('LF00120', 'Dove B/Fresh Toothpaste Charcol 120g', 'Dove', 'Toothpaste', 635, 'No', 230, 35, 146050, 31750, 'DBFTC120', '2023-07-10', '2024-07-10'),
('LF00121', 'Elle18 Kajal 10g', 'Elle18', 'Kajal', 840, 'No', 170, 45, 142800, 31500, 'EK10', '2023-07-05', '2024-07-05'),
('LF00122', 'Glow & Handsome F/Fairness Crm 50g', 'Glow & Handsome', 'Face Cream', 985, 'No', 160, 25, 157600, 39250, 'GHFF50', '2023-07-12', '2024-07-12'),
('LF00123', 'Glow & Handsome F/Fairness Cream 25g', 'Glow & Handsome', 'Face Cream', 550, 'No', 200, 60, 110000, 27500, 'GHFF25', '2023-07-11', '2024-07-11'),
('LF00124', 'Glow & Handsome Instant Brightness F/Facewash 100g', 'Glow & Handsome', 'Face Wash', 930, 'No', 220, 55, 204600, 46500, 'GHIBFW100', '2023-07-12', '2024-07-12'),
('LF00125', 'Glow &Handsome Menz Max F/Ness Cream 50g', 'Glow & Handsome', 'Face Cream', 1055, '10% off', 200, 40, 211000, 52750, 'GHMMF50', '2023-07-12', '2024-07-12');

select * from RetailProducts;


use SPAR;
CREATE TABLE RetailProducts (
    ID INT auto_increment PRIMARY KEY,
    Item_Name VARCHAR(255),
    Brand VARCHAR(255),
    Category VARCHAR(255),
    Unit_Cost DECIMAL(10,2),
    Promotions VARCHAR(255),
    Number_in_stock INT,
    Sold_Quantity INT,
    Inventory_Value DECIMAL(10,2),
    Sales_Value DECIMAL(10,2),
    Batch_No VARCHAR(255),
    MFG_Date DATE,
    EXP_Date DATE
);
INSERT INTO RetailProducts (ID, Item_Name, Brand, Category, Unit_Cost, Promotions, Number_in_stock, Sold_Quantity, Inventory_Value, Sales_Value, Batch_No, MFG_Date, EXP_Date)
VALUES 
('SP0010', 'SPAR Black Olives Pitted, 300g', 'SPAR', 'Olives', 899, NULL, 94, 48, 127658, 43152, 'SPR0001', '2023-08-12', '2024-08-12'),
('SP0011', 'SPAR Chili Beans, 410g', 'SPAR', 'Beans', 999, NULL, 100, 35, 134865, 34965, 'SPR0002', '2023-08-13', '2024-08-13'),
('SP0012', 'SPAR Classic Olive Oil, 500ml', 'SPAR', 'Oil', 2899, NULL, 74, 29, 298597, 84071, 'SPR0003', '2023-08-14', '2024-08-14'),
('SP0013', 'SPAR Extra Virgin Olive Oil, 500ml', 'SPAR', 'Oil', 2999, NULL, 99, 6, 314895, 17994, 'SPR0004', '2023-08-14', '2024-08-14'),
('SP0014', 'SPAR Extra Virgin Olive Oil, 250ml', 'SPAR', 'Oil', 1599, NULL, 69, 19, 140712, 30381, 'SPR0005', '2023-08-15', '2024-08-15'),
('SP0015', 'SPAR Classic Olive Oil, 250ml', 'SPAR', 'Oil', 1499, NULL, 94, 36, 194870, 53964, 'SPR0006', '2023-08-16', '2024-08-16'),
('SP0016', 'SPAR Natural Organic Ev Olive Oil, 500ml', 'SPAR', 'Oil', 3599, NULL, 84, 36, 431880, 129564, 'SPR0007', '2023-08-16', '2024-08-16'),
('SP0017', 'SPAR Pasta Sauce Piccante, 400g', 'SPAR', 'Sauce', 999, NULL, 98, 24, 121878, 23976, 'SPR0008', '2023-08-16', '2024-08-16'),
('SP0018', 'SPAR Salsa Cheese Dips, 300g', 'SPAR', 'Chips', 1399, NULL, 88, 26, 159486, 36374, 'SPR0009', '2023-08-16', '2024-08-16'),
('SP0019', 'SPAR Natural Flower Honey, 340g', 'SPAR', 'Honey', 1999, NULL, 60, 4, 127936, 7996, 'SPR0010', '2023-08-14', '2024-08-14'),
('SP0020', 'SPAR Tex Mex Sauce - Hot, 230g', 'SPAR', 'Sauce', 899, NULL, 55, 44, 89001, 39556, 'SPR0011', '2023-06-12', '2024-06-12'),
('SP0021', 'SPAR Tex Mex Sauce - Medium, 230g', 'SPAR', 'Sauce', 899, NULL, 74, 24, 88102, 21576, 'SPR0012', '2023-07-13', '2024-07-13'),
('SP0022', 'Keels Chilli Sauce', 'Keels', 'Sauce', 500, NULL, 84, 20, 52000, 10000, 'KL70', '2023-08-14', '2024-08-14'),
('SP0023', 'Keels Tomato Sauce', 'Keels', 'Sauce', 465, NULL, 64, 6, 32550, 2790, 'KL71', '2023-07-16', '2024-07-16'),
('SP0024', 'Keels Garlic Sauce', 'Keels', 'Sauce', 520, NULL, 74, 29, 53560, 15080, 'KL72', '2023-08-15', '2024-08-15'),
('SP0025', 'Keels Suoy Sauce', 'Keels', 'Sauce', 520, NULL, 63, 26, 46280, 13520, 'KL73', '2023-07-16', '2024-07-16'),
('SP0026', 'Keels Oyster Sauce', 'Keels', 'Sauce', 490, NULL, 87, 25, 54880, 12250, 'KL74', '2023-08-16', '2024-08-16'),
('SP0027', 'Mixed Fruit Jam', 'MD', 'Jam', 490, NULL, 80, 48, 62720, 23520, 'MD500', '2023-05-16', '2024-05-16'),
('SP0028', 'Woodapple Jam', 'MD', 'Jam', 450, NULL, 51, 47, 44100, 21150, 'MD501', '2023-08-16', '2024-08-16'),
('SP0029', 'Mango Jam', 'MD', 'Jam', 490, NULL, 54, 7, 29890, 3430, 'MD502', '2023-06-19', '2024-06-19'),
('SP0030', 'Strawberry Jam', 'MD', 'Jam', 490, NULL, 69, 26, 46550, 12740, 'MD503', '2023-05-05', '2025-05-05'),
('SP0031', 'Raspberry Jam', 'MD', 'Jam', 520, NULL, 55, 41, 49920, 21320, 'MD504', '2023-05-06', '2025-05-06');

use arpico_supercentre;
CREATE TABLE RetailProducts (
    ID_NUMBER VARCHAR(10) PRIMARY KEY,
    Item_Name VARCHAR(255),
    Brand VARCHAR(255),
    Category VARCHAR(255),
    Unit_Cost DECIMAL(10, 2),
    Promotions VARCHAR(3),
    Number_in_stock INT,
    Sold_Quantity INT,
    Inventory_Value DECIMAL(10, 2),
    Sales_Value DECIMAL(10, 2),
    Batch_No VARCHAR(10),
    MFG_Date DATE,
    EXP_Date DATE
);

INSERT INTO RetailProducts (ID_NUMBER, Item_Name, Brand, Category, Unit_Cost, Promotions, Number_in_stock, Sold_Quantity, Inventory_Value, Sales_Value, Batch_No, MFG_Date, EXP_Date) VALUES
('AR001', 'Virgin Coconut Oil', 'Mareena', 'Oil', 450, 'No', 57, 47, 46800, 21150, 'MA001', '2023-08-12', '2024-08-12'),
('AR002', 'Coconut Oil', 'Mareena', 'Oil', 400, 'No', 76, 38, 45600, 15200, 'MA002', '2023-08-13', '2024-08-13'),
('AR003', 'Cooking Oil', 'Mareena', 'Oil', 400, 'Yes', 80, 2, 32800, 800, 'MA003', '2023-08-14', '2024-08-14'),
('AR004', 'Soya Bean Oil', 'Mareena', 'Oil', 600, 'No', 96, 8, 62400, 4800, 'MA004', '2023-08-14', '2024-08-14'),
('AR005', 'Sunflower Oil', 'Mareena', 'Oil', 700, 'No', 97, 28, 87500, 19600, 'MA005', '2023-08-15', '2024-08-15'),
('AR006', 'Cake Margarine', 'Mareena', 'Margarine', 450, 'No', 72, 4, 34200, 1800, 'MA006', '2023-08-16', '2024-08-16'),
('AR007', 'Pastry Margarine', 'Mareena', 'Margarine', 450, 'Yes', 81, 27, 48600, 12150, 'MA007', '2023-08-16', '2024-08-16'),
('AR008', 'Multi-Purpose Margarine', 'Mareena', 'Margarine', 500, 'No', 96, 10, 53000, 5000, 'MA008', '2023-08-16', '2024-08-16'),
('AR009', 'Bakers Margarine', 'Mareena', 'Margarine', 500, 'No', 99, 4, 51500, 2000, 'MA009', '2023-08-16', '2024-08-16'),
('AR010', 'Marina Spread', 'Mareena', 'Margarine', 270, 'Yes', 53, 31, 22680, 8370, 'MA010', '2023-08-14', '2024-08-14'),
('AR011', 'Keels Chilli Sauce', 'Keels', 'Sauce', 500, 'No', 79, 14, 46500, 7000, 'KE112', '2023-06-12', '2024-06-12'),
('AR012', 'Keels Tomato Sauce', 'Keels', 'Sauce', 500, 'No', 69, 20, 43150, 10000, 'KE113', '2023-06-12', '2024-06-12'),
('AR013', 'Elephant House Ginger Beer', 'Elephant House', 'Refreshment Drink', 200, 'No', 58, 16, 14500, 3200, 'EH225', '2023-05-21', '2024-08-11'),
('AR014', 'Elephant House Cream Soda', 'Elephant House', 'Refreshment Drink', 200, 'No', 75, 10, 18500, 2000, 'EH226', '2023-05-21', '2024-08-11'),
('AR015', 'Elephant House Orange Crush', 'Elephant House', 'Refreshment Drink', 200, 'No', 45, 30, 11150, 6000, 'EH227', '2023-05-22', '2024-08-12');