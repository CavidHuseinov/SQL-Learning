USE first_lesson
GO
CREATE TABLE product
(
product_id BIGINT IDENTITY(100,1) PRIMARY KEY, -- 100den basliyir ++
product_name VARCHAR(100) NOT NULL,
product_description VARCHAR(1000) NOT NULL,
product_price DECIMAL(6,2) NOT NULL, --0-9999.99 arasi
product_is_available BIT NOT NULL, 
product_country_code CHAR(2) NOT NULL
);
ALTER TABLE product
ADD 
product_size SMALLINT NOT NULL

ALTER TABLE product
DROP COLUMN product_is_available

TRUNCATE TABLE product

