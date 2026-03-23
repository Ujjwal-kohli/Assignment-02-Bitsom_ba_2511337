// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "E701",
    name: "Apple Headphones",
    category: "Electronics",
    price: 25000,
    brand: "Apple",
    specifications: {
      warranty_years: 1,
      wireless: true,
      battery_life: "20 hours"
    },
    features: ["Noise Cancellation", "Bluetooth Connectivity"]
  },
  {
    product_id: "C701",
    name: "Denim Jacket",
    category: "Clothing",
    price: 3200,
    brand: "Levi's",
    sizes_available: ["S", "M", "L", "XL"],
    fabric_details: {
      material: "Denim",
      wash_type: "Stone Wash"
    }
  },
  {
    product_id: "G701",
    name: "Coriander Powder",
    category: "Groceries",
    price: 80,
    brand: "Everest",
    expiry_date: new Date("2024-12-15"),
    nutritional_info: {
      calories: "298 kcal",
      fiber: "41g"
    },
    packaging: {
      type: "Pouch",
      weight: "200g"
    }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E701" },
  { $set: { discount_percent: 15 } }
);


// OP5: createIndex() — create an index on category field
db.products.createIndex({ category: 1 });

// Explanation:
//  By Creating an index on the category field will improve query performance,
//  especially when filtering products by category (e.g., Electronics, Groceries).