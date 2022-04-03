class BookItem {
  BookItem({
    this.img = 'assets/placeholder.jpg',
    required this.name,
    required this.price,
  });

  late final String img;
  late final String name;
  late final double price;

  factory BookItem.fromMap(Map<String, dynamic> map) {
    return BookItem(
      name: map['name'] as String,
      img: map['img'] as String,
      price: map['price'] is int? map['price'].toDouble() : map['price'],
    );
  }
}
