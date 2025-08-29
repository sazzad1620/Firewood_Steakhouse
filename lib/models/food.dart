class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
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
  steaks,
  salads,
  sides,
  desserts,
  drinks,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
