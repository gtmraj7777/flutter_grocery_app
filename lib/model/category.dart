class Category {
  int catId;
  String catName;

  Category({required this.catId, required this.catName});

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      catId: map["catId"],
      catName: map["catName"],
    );
  }
}
