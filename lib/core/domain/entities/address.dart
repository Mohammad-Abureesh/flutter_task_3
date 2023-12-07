class Address {
  String? _zipCode;
  String? _street;

  String? _city;

  //TODO:set to list of phones
  String? _phone;

  Address(this._street, this._phone, this._city, this._zipCode);

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        json['street'], json['phone'], json['city'], json['zipCode']);
  }

  String get zipCode => _zipCode ?? '';
  String get street => _street ?? '';
  String get city => _city ?? '';
  String get phone => _phone ?? '';

  Map<String, String?> get toJson =>
      {'zipCode': _zipCode, 'city': _city, 'phone': _phone, 'street': _street};
}
