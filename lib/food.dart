class Food{
  int? id;
  String? name;
  String? path;
  // String? imageURL;
  // String? oldPrice;
  // String? price;

  Food(
      {
        this.id,
      this.name,
      this.path,
      // this.imageURL,
      // this.oldPrice,
      // this.price
      });

  Food.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    path = json['path'];
    // imageURL = json['imageUrl'];
    // oldPrice = json['oldPrice'];
    // price = json['price'];
  }
}