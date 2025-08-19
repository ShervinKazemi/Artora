class Nft {
    final String id;
    final String name;
    final String imageUrl;

    Nft({
        required this.id,
        required this.name,
        required this.imageUrl,
    });

    factory Nft.fromJson(Map<String , String> nft) {
      return Nft(
        id: nft["id"] ?? "Id not found 404",
        name: nft["name"] ?? "Name not found 404",
        imageUrl: nft["imageUrl"] ?? "ImageUrl not found 404"
      );
    }

    Map<String, String> toJson(Nft nft) {
      return {
        "id" : nft.id,
        "name" : nft.name,
        "imageUrl" : nft.imageUrl
      };
    }

}