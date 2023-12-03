class Product {
  final int? _id;
  final int? _stock;

  final String? _image;
  final String? _name;
  final String? _description;
  final String? _category;

  final num? _price;
  final num? _rating;
  final num? _discountPercentage;

  final List<String?>? _images;

  Product._(
      this._id,
      this._image,
      this._name,
      this._description,
      this._category,
      this._price,
      this._rating,
      this._stock,
      this._discountPercentage,
      this._images);

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String?>? slider;
    if (json['images'] is List) {
      slider = (json['images'] as List)
          .map((e) => e is String ? e : null)
          .whereType<String>()
          .toList();
    }
    return Product._(
        json['id'],
        json['thumbnail'],
        json['title'],
        json['description'],
        json['category'],
        json['price'],
        json['rating'],
        json['stock'],
        json['discountPercentage'],
        slider);
  }

  int get id => _id ?? 0;
  int get stock => _stock ?? 0;

  double get rating => _rating?.toDouble() ?? 0.0;
  double get price => _price?.toDouble() ?? 0.0;
  double get discountPercentage => _discountPercentage?.toDouble() ?? 1.0;
  double get priceWithDiscount => (price % discountPercentage).roundToDouble();

  String get name => _name ?? '';
  String get category => _category ?? '';
  String get description => _description ?? '';
  String get image => _image ?? '';

  bool get hasImage => _image != null;
  bool get hasDiscount => discountPercentage != 1;
  bool get inStock => stock > 0;
  bool get outOfStock => !inStock;

  List<String> get slider => _images?.whereType<String>().toList() ?? [];
}
