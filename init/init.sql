CREATE TABLE buyer(
 buyer_id VARCHAR(20) PRIMARY KEY,
 password VARCHAR(20) NOT NULL,
 name VARCHAR(20) NOT NULL,
 phoneNumber VARCHAR(20) NOT NULL
 );

 CREATE TABLE seller(
	seller_id VARCHAR(20) PRIMARY KEY,
	password VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	phoneNumber VARCHAR(20) NOT NULL,
	storeName VARCHAR(20) NOT NULL,
	ownerName VARCHAR(20) NOT NULL,
	businessNumber VARCHAR(20) NOT NULL,
	storePhoneNumber VARCHAR(20) NOT NULL,
	storeRating FLOAT DEFAULT 0 NOT NULL CHECK (storeRating >= 0 AND storeRating <= 5),
	storeStatus VARCHAR(20) DEFAULT 'close' NOT NULL CHECK (storeStatus IN ('close', 'open', 'temporary close')) 
);

CREATE TABLE flower(
  flower_id INT,
	seller_id VARCHAR(20) NOT NULL,
  color VARCHAR(20) NOT NULL,
  name VARCHAR(20) NOT NULL,
  photo VARCHAR(40),
  price INT NOT NULL,
  isSoldOut VARCHAR(20) DEFAULT 'available' NOT NULL CHECK (isSoldOut IN ('available', 'soldout')), 
  PRIMARY KEY (flower_id, seller_id),
  FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
);

CREATE TABLE bouquet(
	bouquet_id INT PRIMARY KEY,
	totalPrice INT NOT NULL,
	buyer_id VARCHAR(20) NOT NULL,
	FOREIGN KEY (buyer_id) REFERENCES buyer(buyer_id)
);

CREATE TABLE bouquet_configuration(
	flower_id INT NOT NULL,
	bouquet_id INT NOT NULL,
	FOREIGN KEY (bouquet_id) REFERENCES bouquet(bouquet_id),
	FOREIGN KEY (flower_id) REFERENCES flower(flower_id),
  flowerAmount INT NOT NULL,
	PRIMARY KEY(bouquet_id, flower_id)
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	buyer_id VARCHAR(20) NOT NULL,
	seller_id VARCHAR(20) NOT NULL,
	receiverName VARCHAR(20) NOT NULL,
	orderState VARCHAR(20) NOT NULL CHECK (orderState IN ('wait', 'accept', 'reject', 'making', 'complete')),
	pickUpDate DATETIME NOT NULL,
	receiverPhoneNumber VARCHAR(20) NOT NULL,
	memo VARCHAR(20),
  FOREIGN KEY(buyer_id) REFERENCES buyer(buyer_id),
	FOREIGN KEY(seller_id) REFERENCES seller(seller_id)
);

create table order_item(
	orderItem_id INT NOT NULL AUTO_INCREMENT,
	order_id INT NOT NULL,
  bouquet_id INT NOT NULL,
	totalPrice INT NOT NULL,
	PRIMARY KEY(orderItem_id),
  FOREIGN KEY(order_id) REFERENCES orders(order_id),
	FOREIGN KEY(bouquet_id) REFERENCES bouquet(bouquet_id)
);

create table review(
	review_id INT NOT NULL AUTO_INCREMENT,
	content VARCHAR(300) NOT NULL,
	date DATETIME NOT NULL,
	rating FLOAT NOT NULL CHECK (rating >= 1 AND rating <= 5),
	buyer_id VARCHAR(20) NOT NULL,
	PRIMARY KEY(review_id),
  FOREIGN KEY(buyer_id) REFERENCES buyer(buyer_id)
);

create table notices(
	notice_id INT NOT NULL AUTO_INCREMENT,
  seller_id VARCHAR(20) NOT NULL,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(500) NOT NULL,
	date DATETIME NOT NULL,
	PRIMARY KEY(notice_id, seller_id),
	FOREIGN KEY(seller_id) REFERENCES seller(seller_id)
);

INSERT INTO buyer(buyer_id, password, name, phoneNumber)
VALUES ('buyerABC', 'passwordABC', '구매자1', '010-1234-5678');

INSERT INTO seller(seller_id, password, name, phoneNumber, storeName, ownerName, businessNumber, storePhoneNumber, storeRating, storeStatus)
VALUES('seller123', 'password123', '판매자1', '010-0000-0000', '성신꽃집', '김성신', '02-0000-0000', '010-1111-1111', '5', 'open');