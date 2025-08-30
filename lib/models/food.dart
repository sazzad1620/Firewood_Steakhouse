class Food {
  final String name;
  final String description;
  final String imagePath;
  final int price;
  final foodCategory category;
  List<Addon> avaliableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.avaliableAddons,
  });
}

// food categories
enum foodCategory {
  Steaks,
  Platers,
  Desserts,
  Drinks,
}

// food addons
class Addon {
  String name;
  int price;

  Addon({
    required this.name,
    required this.price,
  });
}
