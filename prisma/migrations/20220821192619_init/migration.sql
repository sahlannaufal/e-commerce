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


-- Insert dummy data into Category
INSERT INTO "Category" ("name", "slug") VALUES
    ('Electronics', 'electronics'),
    ('Fashion', 'fashion'),
    ('Home & Living', 'home-living');

-- Insert dummy data into Product
INSERT INTO "Product" ("id", "name", "description", "price", "categoryName", "imageUrl", "tags") VALUES
    ('1', 'Smartphone', 'A high-quality smartphone with latest technology.', 699.99, 'Electronics', 'https://www.unihertz.com/cdn/shop/products/golden-eye-5g-slim-rugged-camping-light-smartphone-for-explorersunihertzsmartphonesunihertz-318178.jpg?v=1698816690&width=700', ARRAY['mobile', 'men']),
    ('2', 'Wireless Headphones', 'Noise-canceling wireless headphones.', 299.99, 'Electronics', 'https://bukaolshop.s3-id-jkt-1.kilatstorage.id/55928/520851504s.jpg', ARRAY['audio', 'men']),
    ('3', 'Jeans', 'Comfortable and stylish denim jeans.', 49.99, 'Fashion', 'https://www.elfs-shop.com/~img/cjj_soft_jeans_pocket_189_bt_0_copy-42d53-3073_2392-t598_26.webp', ARRAY['clothing', 'blue']);
