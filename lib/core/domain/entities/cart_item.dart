class CartItem {
  int productId;
  int _quantity;

  CartItem(this.productId, this._quantity);

  CartItem.pushOne(this.productId) : _quantity = 1;

  int get quantity => _quantity;

  bool get zeroQuantity => quantity == 0;

  void increment() {
    _quantity += 1;
  }

  void decrement() {
    if (quantity == 0) return;
    _quantity -= 1;
  }
}
