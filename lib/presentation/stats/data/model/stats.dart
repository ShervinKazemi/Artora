class Stats {
    final int id;
    final String imageUrl;
    final String name;
    final double price;
    final double chance;

    Stats({
        required this.id,
        required this.imageUrl,
        required this.name,
        required this.price,
        required this.chance,
    });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      id: json["id"],
      imageUrl: json["imageUrl"],
      name: json["name"],
      price: json["price"],
      chance: json["chance"]
    );
  }

  Map<String , dynamic> toJson(Stats stats) {
    return {
      "id" : stats.id,
      "imageUrl": stats.imageUrl,
      "name" : stats.name,
      "price" : stats.price,
      "chance" : stats.chance
    };
  }

}