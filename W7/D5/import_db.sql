DROP TABLE cats;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    breed VARCHAR(255)
);
DROP TABLE toys;
CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    price INTEGER,
    color VARCHAR(255),
    name VARCHAR(255)

);
DROP TABLE cat_toys;
CREATE TABLE cat_toys (
    id SERIAL PRIMARY KEY,
    cat_id INT REFERENCES cats(id),
    toy_id INT REFERENCES toys(id)

);


INSERT INTO 
    cats (name, color, breed)
VALUES 
    ('Bob', 'Calico', 'Street cat'),
    ('Mittens', 'Grey', 'Russian Blue'),
    ('Mr. Nibbles', 'Black', 'Street cat'),
    ('Mr. Biggg', 'Orange', 'Maine Coon'),
    ('Garfield', 'Orange', 'Tabby');


INSERT INTO 
    toys (price, color, name)
VALUES 
    (50, 'Blue', 'Cat Tree'),
    (10, 'Silver', 'Laser Pointer'),
    (5, 'Green', 'Catnip'),
    (3, 'White', 'Mouse'),
    (6, 'Yellow', 'Ball of String');

INSERT INTO 
cat_toys (cat_id, toy_id)
VALUES (1, 1),
    (1, 5),
    (2, 4),
    (3, 3),
    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4),
    (4, 5),
    (5, 1);



-- EXPLAIN SELECT 
--     name 
-- FROM 
--     cats 
-- WHERE 
--     name = 'Mittens';

-- EXPLAIN SELECT 
--     toys.name, cats.name
-- FROM 
--     toys 
-- JOIN 
--     cat_toys
-- ON 
--     toys.id = cat_toys.toy_id 
-- JOIN 
--     cats 
-- ON 
--     cats.id = cat_toys.cat_id 
-- WHERE 
--     cats.color = 'Orange'
-- OR 
--     toys.color = 'Yellow';

-- EXPLAIN UPDATE 
--     cats 
-- SET 
--     color = 'Silver'
-- WHERE 
--     name = 'Mr. Nibbles';

-- EXPLAIN DELETE FROM 
--     cats 
-- WHERE 
--     cats.name = 'Garfield';

-- EXPLAIN INSERT INTO 
--     cat_toys (cat_id, toy_id)
-- VALUES 
--     (2, 5);

-- EXPLAIN SELECT 
--     toys.name
-- FROM 
--     toys 
-- JOIN 
--     cat_toys 
-- ON 
--   cat_toys.toy_id = toys.id 
    
-- JOIN 
--     cats 
-- ON 
--     cats.id = cat_toys.cat_id
-- WHERE cats.breed = 'Street cat';



--     SELECT 
--         cats.name, toys.name
--     FROM 
--         toys 
--     JOIN 
--         cat_toys 
--     ON 
--         cat_toys.toy_id = toys.id 
    
--     JOIN 
--         cats 
--     ON 
--         cats.id = cat_toys.cat_id;
  


-- UPDATE toys
-- SET color = 'Neon Green'
-- WHERE price > 10;

-- EXPLAIN ANALYZE SELECT 
--     name
--     FROM   
--         toys
--     WHERE  
--         price < 10;