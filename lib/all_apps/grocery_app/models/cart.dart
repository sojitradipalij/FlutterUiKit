class Cart {
  final String name, image;
  final double price, discountedPrice;
  final int quantity;

  Cart(this.name, this.image, this.price, this.discountedPrice, this.quantity);

  static List<Cart> getList() {
    return [
      Cart("Orange Fresh Juice", "./assets/images/all_apps/grocery_app/product-2.png",
          59.99, 49.99, 2),
      Cart("Fresh Carrot", "./assets/images/all_apps/grocery_app/product-5.png", 19.99,
          19.99, 4),
    ];
  }
}
