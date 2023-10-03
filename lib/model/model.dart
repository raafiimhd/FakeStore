class FakeStore {
  int id;
  String title;
  String description;
  String price;
  String category;
  String image;

  FakeStore(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.image});

  factory FakeStore.fromJson(Map<String, dynamic> json) {
    return FakeStore(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toString(),
      image: json['image'],
    );
  }
}
