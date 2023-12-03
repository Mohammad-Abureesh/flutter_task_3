class CartItem {
  int productId;
  int quantity;

  CartItem(this.productId, this.quantity);

  CartItem.pushOne(this.productId) : quantity = 1;

  void increment() {
    quantity += 1;
  }

  void decrement() {
    if (quantity > 0) {
      quantity -= 1;
    }
  }
}
