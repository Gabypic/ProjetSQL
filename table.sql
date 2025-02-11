CREATE TABLE `user` (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    firstname TEXT,
    lastname TEXT,
    username VARCHAR(20) NOT NULL
);

CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    street_address TEXT,
    city TEXT,
    postal_code TEXT,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_available INT NOT NULL
);

CREATE TABLE command (
    command_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE cart_product (
    cart_product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    command_id INT,
    cart_product_id INT,
    FOREIGN KEY (command_id) REFERENCES command(command_id),
    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (cart_product_id) REFERENCES cart_product(cart_product_id)
);

CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    order_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

