class Nft {
  final String id;
  final String name;
  final String imageUrl;

  Nft({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Nft.fromJson(Map<String, dynamic> nft) {
    return Nft(
      id: nft["id"]?.toString() ?? "Id not found 404",
      name: nft["name"]?.toString() ?? "Name not found 404",
      imageUrl: nft["imageUrl"]?.toString() ?? "ImageUrl not found 404",
    );
  }

  Map<String, String> toJson(Nft nft) {
    return {
      "id": nft.id,
      "name": nft.name,
      "imageUrl": nft.imageUrl,
    };
  }
}