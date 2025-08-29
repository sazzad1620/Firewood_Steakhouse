import 'package:flutter/cupertino.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // Steaks
    Food(
      name: "Ribeye Steak",
      description:
          "Known for its rich marbling and juicy texture, Ribeye is full of flavor and stays tender when cooked. Perfect for those who love a buttery, succulent steak.",
      imagePath: "lib/images/steaks/Ribeye_Steak.jpg",
      price: 2250,
      category: foodCategory.Steaks,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Sirloin Steak",
      description:
          "A lean and hearty cut with a robust beefy flavor. Sirloin is ideal for a classic steak experience without too much fat.",
      imagePath: "lib/images/steaks/Sirloin_Steak.jpg",
      price: 1900,
      category: foodCategory.Steaks,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Tenderloin Steak",
      description:
          "Combines two great cuts in one — tenderloin and strip steak — separated by a T-shaped bone. It’s perfect for those who want variety in every bite.",
      imagePath: "lib/images/steaks/Tenderloin_Steak.jpg",
      price: 2050,
      category: foodCategory.Steaks,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Tenderloin Steak",
      description:
          "Extremely tender and soft, this premium cut has a mild flavor. It’s the choice for a delicate and luxurious steak experience.",
      imagePath: "lib/images/steaks/Tenderloin_Steak.jpg",
      price: 1950,
      category: foodCategory.Steaks,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Tomahawk Steak",
      description:
          "A dramatic, large bone-in ribeye with intense marbling. Very flavorful and perfect for sharing or impressing at a special meal.",
      imagePath: "lib/images/steaks/Tomahawk_Steak.jpg",
      price: 2300,
      category: foodCategory.Steaks,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    // Platers

    Food(
      name: "Combo Platter",
      description:
          "A satisfying meal with your choice of steak, paired with sides like mashed potatoes, grilled veggies, and a fresh salad. Perfect for a complete steakhouse experience.",
      imagePath: "lib/images/platers/Platter_Combo.jpg",
      price: 3500,
      category: foodCategory.Platers,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Ribeye Platter",
      description:
          "Juicy Ribeye served with seasoned fries, sautéed mushrooms, and a side salad. Rich, tender, and full of flavor for steak lovers.",
      imagePath: "lib/images/platers/Ribeye_Combo.jpg",
      price: 2750,
      category: foodCategory.Platers,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Rump Platter",
      description:
          "Lean and hearty rump steak served with crispy fries, roasted vegetables, and a garden salad. Balanced flavor and satisfying portion.",
      imagePath: "lib/images/platers/Rump_Combo.jpg",
      price: 2400,
      category: foodCategory.Platers,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Sirloin Platter",
      description:
          "Tender sirloin paired with mashed potatoes, sautéed mushrooms, and grilled veggies. Classic and flavorful, perfect for any steak lover.",
      imagePath: "lib/images/platers/Sirloin_Combo.jpg",
      price: 2600,
      category: foodCategory.Platers,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    Food(
      name: "Tenderloin Platter",
      description:
          "Premium tenderloin served with creamy mashed potatoes, roasted vegetables, and a fresh salad. Extremely tender, mild, and luxurious.",
      imagePath: "lib/images/platers/Platter_Combo.jpg",
      price: 2650,
      category: foodCategory.Platers,
      avaliableAddons: [
        Addon(name: "Garlic Butter", price: 150),
        Addon(name: "Mushroom Sauce", price: 100),
        Addon(name: "Grilled Vegetables", price: 200),
      ],
    ),

    // Desserts

    Food(
      name: "Chocolate Cake",
      description:
          "Rich and moist 500 gm chocolate cake layered with creamy chocolate frosting. A perfect treat for chocolate lovers.",
      imagePath: "lib/images/desserts/Chocolate_Cake.jpg",
      price: 750,
      category: foodCategory.Desserts,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Chips", price: 150),
        Addon(name: "Fruit Toppings", price: 200),
      ],
    ),

    Food(
      name: "Chocolate Pastry",
      description:
          "Flaky pastry filled with smooth chocolate ganache, baked to golden perfection. Sweet, crispy, and indulgent.",
      imagePath: "lib/images/desserts/Chocolate_Pastry.jpg",
      price: 250,
      category: foodCategory.Desserts,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Chips", price: 150),
        Addon(name: "Fruit Toppings", price: 200),
      ],
    ),

    Food(
      name: "Jar Cake",
      description:
          "Individual dessert served in a jar with layers of cake, cream, and chocolate sauce. Perfect for portion control and presentation.",
      imagePath: "lib/images/desserts/Jar_Cake.jpg",
      price: 450,
      category: foodCategory.Desserts,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Chips", price: 150),
        Addon(name: "Fruit Toppings", price: 200),
      ],
    ),

    Food(
      name: "Mini Cake",
      description:
          "Small, bite-sized cakes with rich flavors and creamy frosting. Ideal for quick indulgence or gifts.",
      imagePath: "lib/images/desserts/Jar_Cake.jpg",
      price: 180,
      category: foodCategory.Desserts,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Chips", price: 150),
        Addon(name: "Fruit Toppings", price: 200),
      ],
    ),

    Food(
      name: "Red Velvet Pastry",
      description:
          "Soft red velvet pastry with cream cheese frosting, visually stunning and delightfully sweet.",
      imagePath: "lib/images/desserts/RedVelvet_Pastry.jpg",
      price: 300,
      category: foodCategory.Desserts,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Chips", price: 150),
        Addon(name: "Fruit Toppings", price: 200),
      ],
    ),

    // Drinks

    Food(
      name: "Brwnie Shake",
      description:
          "A rich and indulgent shake blended with chunks of fudgy brownies for a chocolate lover’s dream.",
      imagePath: "lib/images/drinks/Brownie_Shake.jpg",
      price: 300,
      category: foodCategory.Drinks,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Syrup Drizzle", price: 150),
      ],
    ),

    Food(
      name: "Cream Shake",
      description:
          "A smooth and velvety shake made with fresh cream, offering a light and refreshing taste.",
      imagePath: "lib/images/drinks/Cream_Shake.jpg",
      price: 250,
      category: foodCategory.Drinks,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Syrup Drizzle", price: 150),
      ],
    ),

    Food(
      name: "Kitkat Shake",
      description:
          "Crunchy KitKat bars blended into a creamy shake for the perfect chocolatey crunch.",
      imagePath: "lib/images/drinks/Kitkat_Shake.jpg",
      price: 300,
      category: foodCategory.Drinks,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Syrup Drizzle", price: 150),
      ],
    ),

    Food(
      name: "Milk Shake",
      description:
          "A classic shake made with chilled milk and ice cream, simple yet timeless.",
      imagePath: "lib/images/drinks/Milk_Shake.jpg",
      price: 250,
      category: foodCategory.Drinks,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Syrup Drizzle", price: 150),
      ],
    ),

    Food(
      name: "Oreo Shake",
      description:
          "A creamy blend of milk, ice cream, and Oreo cookies for a smooth and delightful taste.",
      imagePath: "lib/images/drinks/Oreo_Shake.jpg",
      price: 250,
      category: foodCategory.Drinks,
      avaliableAddons: [
        Addon(name: "Whipped Cream", price: 150),
        Addon(name: "Chocolate Syrup Drizzle", price: 150),
      ],
    ),
  ];

  // Getters
  List<Food> get menu => _menu;

  // Operations--------

  // add to cart

  // remove from cart

  // get total price of cart

  // get total number of items in cart

  // clear cart

  // Helpers---------

  // generate a receipt

  // format double value into money
}
