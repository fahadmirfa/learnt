class GroceryItem {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imagePath;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

var demoItems = [
  GroceryItem(
      id: 1,
      name: "Organic Bananas",
      description: "7pcs, Price",
      price: 4.99,
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: 2,
      name: "Red Apple",
      description: "1kg, Price",
      price: 4.00,
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 3,
      name: "Bell Pepper Red",
      description: "1kg, Price",
      price: 2.99,
      imagePath: "assets/images/grocery_images/pepper.png"),
  GroceryItem(
      id: 4,
      name: "Ginger",
      description: "250gm, Price",
      price: 1.99,
      imagePath: "assets/images/grocery_images/ginger.png"),
  GroceryItem(
      id: 5,
      name: "Meat",
      description: "250gm, Price",
      price: 6.99,
      imagePath: "assets/images/grocery_images/beef.png"),
  GroceryItem(
      id: 6,
      name: "Chicken",
      description: "250gm, Price",
      price: 7.99,
      imagePath: "assets/images/grocery_images/chicken.png"),
];

var exclusiveOffers = [demoItems[0], demoItems[1],demoItems[2]];

var bestSelling = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4], demoItems[5]];

