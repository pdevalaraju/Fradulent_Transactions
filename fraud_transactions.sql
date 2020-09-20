DROP TABLE IF EXISTS tbl_transactions;
DROP TABLE IF EXISTS tbl_credit_card;
DROP TABLE IF EXISTS tbl_card_holder;
DROP TABLE IF EXISTS tbl_merchant;
DROP TABLE IF EXISTS tbl_merchant_category;


CREATE TABLE tbl_card_holder (
    card_holder_id SERIAL PRIMARY KEY,
    card_holder_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_credit_card (
    card_number VARCHAR(20) UNIQUE,
    card_holder_id INT NOT NULL,
	CONSTRAINT composit_PK_credit_card
                    PRIMARY KEY (card_number, card_holder_id)
);

CREATE TABLE tbl_transactions (
    transaction_id SERIAL PRIMARY KEY,
    transaction_date DATE NOT NULL,
    transaction_amount FLOAT NOT NULL,
    merchant_id BIGINT NOT NULL,
    card_number VARCHAR(20) NOT NULL
  );

CREATE TABLE tbl_merchant_category (
    merchant_category_id SERIAL PRIMARY KEY,
    merchant_category_name varchar(100) UNIQUE NOT NULL
);

CREATE TABLE tbl_merchant (
    merchant_id SERIAL PRIMARY KEY,
    merchant_name VARCHAR(75) NOT NULL,
    merchant_category_id INT NOT NULL
);

ALTER TABLE tbl_credit_card ADD CONSTRAINT fk_tbl_credit_card_card_holder_id FOREIGN KEY(card_holder_id)
REFERENCES tbl_card_holder (card_holder_id) 
ON DELETE CASCADE
ON UPDATE CASCADE; 

ALTER TABLE tbl_merchant ADD CONSTRAINT fk_tbl_merchant_merchant_id FOREIGN KEY(merchant_category_id)
REFERENCES tbl_merchant_category (merchant_category_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE tbl_transactions ADD CONSTRAINT fk_tbl_transactions_card_card_number FOREIGN KEY(card_number)
REFERENCES tbl_credit_card (card_number)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE tbl_transactions ADD CONSTRAINT fk_tbl_transactions_merchant_id FOREIGN KEY(merchant_id)
REFERENCES tbl_merchant (merchant_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
