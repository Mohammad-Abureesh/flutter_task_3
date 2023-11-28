enum ProductsFilter {
  forYou('Special for you'),
  featured('Featured Products'),

  bestSelling('Best Selling Products');

  const ProductsFilter(this.title);
  final String title;
}
