CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand VARCHAR(255),
    type VARCHAR(255)
);

CREATE TABLE retailer (
    retailer_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(255) NOT NULL,
    retailer_name VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE batch (
    batch_no VARCHAR(255) PRIMARY KEY NOT NULL,
    mfg_dates TEXT,
    exp_dates TEXT
);

CREATE TABLE userSearchesproduct (
    user_id INT,
    product_id INT,
    searched_date DATE,
    searched_time TIME,
    PRIMARY KEY (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE retailerHasproduct (
    retailer_id INT,
    product_id INT,
    quantity INT,
    promotion VARCHAR(255),
    price DECIMAL(10, 2),
    PRIMARY KEY (retailer_id, product_id),
    FOREIGN KEY (retailer_id) REFERENCES retailer(retailer_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

