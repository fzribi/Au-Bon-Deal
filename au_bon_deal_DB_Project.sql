
/*La syntaxe standard d'un identifiant unique universel (UUID) 
suit le format spécifié par le RFC 4122. Un UUID est généralement représenté 
sous la forme de chaînes de caractères hexadécimaux, regroupées par des tirets. 
Il existe différentes versions d'UUID, et la version la plus courante est la version 4.

Un exemple d'UUID version 4 ressemble à ceci :
550e8400-e29b-41d4-a716-446655440000
*/
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE Products (
    product_UUID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    product_name VARCHAR(255),
    product_description VARCHAR(255),
    product_price VARCHAR(255),
    product_quantity VARCHAR(255),
    created_at DATE,
    updated_at DATE
);
CREATE TABLE Users (
    user_UUID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_pseudo VARCHAR(255),
    user_name VARCHAR(255),
    user_password VARCHAR(255),
    created_at DATE
);

CREATE TABLE Orders (
    order_number VARCHAR(50) PRIMARY KEY,
    order_total_caot_ht INT,
    order_total_quantity INT,
    created_at DATE,
    deliver_at0 DATE,
    user_UUID UUID,
    FOREIGN KEY (user_UUID) REFERENCES Users(user_UUID)
);

/*option 1 ??? ne marche pas*/
CREATE TABLE belong (
    product_UUID UUID,
    FOREIGN KEY (product_UUID) REFERENCES Products(product_UUID),
    order_number UUID,
    FOREIGN KEY (order_number) REFERENCES Orders(order_number)
);
/*option 2*/
CREATE TABLE belong (
    product_UUID UUID,
    FOREIGN KEY (product_UUID) REFERENCES Products(product_UUID),
    order_number VARCHAR(50), -- Changer le type de données ici
    FOREIGN KEY (order_number) REFERENCES Orders(order_number)
);


/* ajout de contraintes*/
CREATE TABLE Users (
    user_UUID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_pseudo VARCHAR(255) UNIQUE,
    user_name VARCHAR(255),
    user_password VARCHAR(255),
    created_at DATE
);
CREATE TABLE Products (
    product_UUID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    product_name VARCHAR(255),
    product_description VARCHAR(255),
    product_price VARCHAR(255),
    product_quantity INT CHECK (product_quantity >= 0),
    created_at DATE,
    updated_at DATE
);
CREATE TABLE Orders (
    order_number VARCHAR(50) PRIMARY KEY NOT NULL,
    order_total_caot_ht INT,
    order_total_quantity INT,
    created_at DATE,
    deliver_at0 DATE,
    user_UUID UUID,
    FOREIGN KEY (user_UUID) REFERENCES Users(user_UUID)
);
/* insertion de données dans la table Users de ma base de données*/
INSERT INTO Users (user_pseudo, user_name,user_password ) VALUES ('Biba', 'Ali', '1936');
INSERT INTO Users (user_pseudo, user_name,user_password ) VALUES ('Doudou', 'Mohamed-Ali', '2019');
INSERT INTO Users (user_pseudo, user_name,user_password ) VALUES ('Azouzi', 'Ezzet', '1983');
INSERT INTO Users (user_pseudo, user_name,user_password ) VALUES ('Badi', 'Badia', '1980');
INSERT INTO Users (user_pseudo, user_name,user_password ) VALUES ('Amouna', 'Amen', '1987');

/* modifier les users_uuid*/
UPDATE Users
SET user_uuid = uuid_generate_v4()
WHERE user_pseudo = 'Biba';

UPDATE Users
SET user_uuid = uuid_generate_v4()
WHERE user_pseudo = 'Doudou';

UPDATE Users
SET user_uuid = uuid_generate_v4()
WHERE user_pseudo = 'Azouzi';
UPDATE Users
SET user_uuid = uuid_generate_v4()
WHERE user_pseudo = 'Badia';

UPDATE Users
SET user_uuid = uuid_generate_v4()
WHERE user_pseudo = 'Amouna';

/* modification de user_uuid en un nombre à la place d'un génération aléatoire avec uuid_generate_v4() */
UPDATE Users
SET user_uuid = '01'
WHERE user_pseudo = 'Biba';

UPDATE Users
SET user_uuid = '02'
WHERE user_pseudo = 'Doudou';

UPDATE Users
SET user_uuid = '03'
WHERE user_pseudo = 'Azouzi';

UPDATE Users
SET user_uuid = '04'
WHERE user_pseudo = 'Badia';

UPDATE Users
SET user_uuid = '05'
WHERE user_pseudo = 'Amouna';

/* insérer une date de creation du compte user*/
UPDATE Users
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Biba';

UPDATE Users
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Doudou';


UPDATE Users
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Azouzi';


UPDATE Users
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Badia';

UPDATE Users
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Amouna';

/* ajout des modicifactions en même temps: user_uuid et createc_at */
UPDATE Users
SET user_uuid = uuid_generate_v4()
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Biba';

UPDATE Users
SET user_uuid = uuid_generate_v4()
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Doudou';

UPDATE Users
SET user_uuid = uuid_generate_v4()
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Azouzi';

UPDATE Users
SET user_uuid = uuid_generate_v4()
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Badia';

UPDATE Users
SET user_uuid = uuid_generate_v4()
SET created_at = CURRENT_DATE
WHERE user_pseudo = 'Amouna';

/* résolution du problème lié à l'ordre de classement et d'apparition des différents users !
je veux que Ali s'affiche le premier ! ensuite Doudou ! et puis le reste ! 
1. vérification de l'état du contenu du user Badia */
SELECT * FROM Users WHERE user_pseudo = 'Badi'; /* created_at est null */
/* ensuite mettre à jour l'attribut created_at */
 UPDATE Users SET created_at = CURRENT_DATE WHERE user_name = 'Badia';


 /* insertion des données dans ma table Products*/
INSERT INTO Products (product_name, product_description,product_price, product_quantity ) VALUES ('Pizza', 'Plat_Italien', '8', '80');
INSERT INTO Products (product_name, product_description,product_price, product_quantity ) VALUES ('Nuggets', 'Plat_Asiatique', '5', '60');
INSERT INTO Products (product_name, product_description,product_price, product_quantity ) VALUES ('Couscous', 'Plat_Maghrebin', '14', '50');
INSERT INTO Products (product_name, product_description,product_price, product_quantity ) VALUES ('Sushi', 'Plat_Japonais', '10', '37');
INSERT INTO Products (product_name, product_description,product_price, product_quantity ) VALUES ('Tapas', 'Plat_Espagnol', '12', '20');

product_uuid | product_name | product_description | product_price | product_quantity | created_at | updated_at


/* modifier les product_uuid et l'attribut created_at*/
/* ATTENTION !! il faut que ça soit séquentiel: une par une !! ou peut être pas !!? il y a un point-virgule de trop !!*/

UPDATE Products
SET product_uuid = uuid_generate_v4(),
    created_at = CURRENT_DATE
WHERE product_name = 'Pizza';

UPDATE Products
SET product_uuid = uuid_generate_v4(),
    created_at = CURRENT_DATE
WHERE product_name = 'Nuggets';

UPDATE Products
SET product_uuid = uuid_generate_v4(),
    created_at = CURRENT_DATE
WHERE product_name = 'Couscous';

UPDATE Products
SET product_uuid = uuid_generate_v4(),
    created_at = CURRENT_DATE
WHERE product_name = 'Sushi';

UPDATE Products
SET product_uuid = uuid_generate_v4(),
    created_at = CURRENT_DATE
WHERE product_name = 'Tapas';

/* Pour remplir une table de jonction (par exemple, belong) 
qui contient uniquement des clés étrangères vers d'autres tables 
(par exemple, product_uuid faisant référence à Products et order_number faisant référence à Orders), 
vous pouvez utiliser la syntaxe INSERT INTO SELECT */

/* jointure entre table Orders et Users */
INSERT INTO belong (product_uuid, order_number)
SELECT u.user_uuid, o.order_number
FROM Users u
JOIN Orders o ON u.user_uuid = o.user_uuid;

/* insertion des données dans ma table Orders*/
INSERT INTO Orders (order_number, order_total_caot_ht, order_total_quantity, created_at,deliver_at0 ) VALUES ('01', 120 , 960, CURRENT_DATE, CURRENT_DATE + 60 );
INSERT INTO Orders (order_number, order_total_caot_ht, order_total_quantity, created_at, deliver_at0 ) VALUES ('02', 20 , 100, CURRENT_DATE, CURRENT_DATE + 60);
INSERT INTO Orders (order_number, order_total_caot_ht, order_total_quantity, created_at, deliver_at0 ) VALUES ('03', 43, 602, CURRENT_DATE, CURRENT_DATE + 60);
INSERT INTO Orders (order_number, order_total_caot_ht, order_total_quantity, created_at, deliver_at0 ) VALUES ('04', 12, 120, CURRENT_DATE, CURRENT_DATE + 60);
INSERT INTO Orders (order_number, order_total_caot_ht, order_total_quantity, created_at, deliver_at0 ) VALUES ('05', 5, 60, CURRENT_DATE, CURRENT_DATE + 60);

/* mettre les user_uuid de la table Users dans la table Orders*/
UPDATE Orders o
SET user_uuid = u.user_uuid
FROM Users u
WHERE o.user_uuid = u.user_uuid;

SELECT o.order_number, u.user_uuid
FROM Orders o
JOIN Users u ON o.user_uuid = u.user_uuid;

UPDATE Orders o
SET user_uuid = u.user_uuid
FROM Users u
WHERE o.user_uuid = u.user_uuid;

























