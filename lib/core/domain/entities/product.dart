class Product {
  final int? _id;
  final int? _stock;

  final String? _image;
  final String? _name;
  final String? _description;
  final String? _category;

  final num? _price;
  final num? _rating;

  Product._(this._id, this._image, this._name, this._description,
      this._category, this._price, this._rating, this._stock);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product._(
        json['id'],
        json['thumbnail'],
        json['title'],
        json['description'],
        json['category'],
        json['price'],
        json['rating'],
        json['stock']);
  }

  int get id => _id ?? 0;
  int get stock => _stock ?? 0;

  double get rating => _rating?.toDouble() ?? 0.0;
  double get price => _price?.toDouble() ?? 0.0;

  String get name => _name ?? '';
  String get category => _category ?? '';
  String get description => _description ?? '';
  String get image => _image ?? '';

  bool get hasImage => _image != null;
}
