-- CreateTable
CREATE TABLE "Category" (
    "name" VARCHAR(16) NOT NULL,
    "slug" VARCHAR(16) NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "description" VARCHAR(500) NOT NULL,
    "price" REAL NOT NULL,
    "categoryName" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "tags" TEXT[],

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "email" VARCHAR(128) NOT NULL,
    "password" VARCHAR(24) NOT NULL,
    "imageUrl" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_categoryName_fkey" FOREIGN KEY ("categoryName") REFERENCES "Category"("name") ON DELETE RESTRICT ON UPDATE CASCADE;


-- -- Insert dummy data into Category
-- INSERT INTO "Category" ("name", "slug") VALUES
--     ('Electronics', 'electronics'),
--     ('Fashion', 'fashion'),
--     ('Home & Living', 'home-living');

-- -- Insert dummy data into Product
-- INSERT INTO "Product" ("id", "name", "description", "price", "categoryName", "imageUrl", "tags") VALUES
--     ('1', 'Smartphone', 'A high-quality smartphone with latest technology.', 699.99, 'Electronics', 'https://www.unihertz.com/cdn/shop/products/golden-eye-5g-slim-rugged-camping-light-smartphone-for-explorersunihertzsmartphonesunihertz-318178.jpg?v=1698816690&width=700', ARRAY['mobile', 'men']),
--     ('2', 'Wireless Headphones', 'Noise-canceling wireless headphones.', 299.99, 'Electronics', 'https://bukaolshop.s3-id-jkt-1.kilatstorage.id/55928/520851504s.jpg', ARRAY['audio', 'men']),
--     ('3', 'Jeans', 'Comfortable and stylish denim jeans.', 49.99, 'Fashion', 'https://www.elfs-shop.com/~img/cjj_soft_jeans_pocket_189_bt_0_copy-42d53-3073_2392-t598_26.webp', ARRAY['clothing', 'blue']);


-- Insert dummy data into Category
INSERT INTO "Category" ("name", "slug") VALUES
    ('Clothes', 'baby'),
    ('Accessories', 'accessories'),
    ('Essentials', 'essentials'),
    ('Feeding', 'feeding'),
    ('Toys', 'toys');

-- Insert dummy data into Product
INSERT INTO "Product" ("id", "name", "description", "price", "categoryName", "imageUrl", "tags") VALUES
    ('1', 'Soft Cotton Baby Romper', 'Comfortable and breathable cotton romper for babies.', 19.99, 'Clothes', 'https://ex/baby-romper.jpg', ARRAY['baby', 'clothing', 'soft']),
    ('2', 'Toddler Walking Shoes', 'Durable and lightweight shoes for toddlers learning to walk.', 29.99, 'Accessories', 'https://ex/toddler-shoes.jpg', ARRAY['shoes', 'toddler', 'comfortable']),
    ('3', 'Organic Baby Blanket', 'Warm and soft organic blanket for newborns.', 24.99, 'Essentials', 'https://ex/baby-blanket.jpg', ARRAY['baby', 'blanket', 'organic']),
    ('4', 'Waterproof Baby Bib', 'Easy-to-clean waterproof bib for messy eaters.', 9.99, 'Feeding', 'https://ex/baby-bib.jpg', ARRAY['baby', 'feeding', 'waterproof']),
    ('5', 'Silicone Baby Spoon Set', 'Soft silicone spoons for babies learning to eat.', 12.99, 'Feeding', 'https://ex/baby-spoon.jpg', ARRAY['baby', 'feeding', 'silicone']),
    ('6', 'Educational Wooden Blocks', 'Colorful wooden blocks to help toddlers learn shapes and colors.', 34.99, 'Toys', 'https://ex/wooden-blocks.jpg', ARRAY['toddler', 'learning', 'toy']),
    ('7', 'Musical Baby Rattle', 'A fun and engaging rattle to keep babies entertained.', 14.99, 'Toys', 'https://ex/baby-rattle.jpg', ARRAY['baby', 'toy', 'musical']),
    ('8', 'Knitted Baby Beanie', 'Warm and stylish knitted beanie for newborns.', 15.99, 'Clothes', 'https://ex/baby-beanie.jpg', ARRAY['baby', 'clothing', 'knitted']),
    ('9', 'Adjustable Baby Carrier', 'Ergonomic baby carrier for maximum comfort.', 59.99, 'Accessories', 'https://ex/baby-carrier.jpg', ARRAY['baby', 'carrier', 'ergonomic']),
    ('10', 'Soft Plush Baby Pillow', 'Ultra-soft baby pillow for a restful sleep.', 22.99, 'Essentials', 'https://ex/baby-pillow.jpg', ARRAY['baby', 'pillow', 'soft']);
