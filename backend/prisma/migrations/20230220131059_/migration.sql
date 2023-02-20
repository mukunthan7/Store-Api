-- CreateTable
CREATE TABLE `Supplier` (
    `id` VARCHAR(191) NOT NULL,
    `supplierName` VARCHAR(191) NOT NULL,
    `supplierAddress` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Supplier_supplierName_key`(`supplierName`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id` VARCHAR(191) NOT NULL,
    `productName` VARCHAR(191) NOT NULL,
    `productDescription` VARCHAR(191) NOT NULL,
    `supplierId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Product_productName_key`(`productName`),
    UNIQUE INDEX `Product_supplierId_key`(`supplierId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transaction` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `quantity` INTEGER NOT NULL,

    INDEX `Transaction_productId_idx`(`productId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Distribution` (
    `id` VARCHAR(191) NOT NULL,
    `TransactionId` VARCHAR(191) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `Buyer` VARCHAR(191) NOT NULL,
    `collegeName` VARCHAR(191) NOT NULL,
    `Department` VARCHAR(191) NOT NULL,
    `Purpose` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `Distribution_TransactionId_idx`(`TransactionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
