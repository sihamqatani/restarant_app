class FoodDetails {
  late String name;
  late String imageUrl;
  dynamic noRating;
  dynamic price;

  FoodDetails({
    required this.name,
    required this.imageUrl,
    this.noRating,
    this.price,
  });
}
