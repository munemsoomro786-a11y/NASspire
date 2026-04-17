class Course {
  final String id;
  final String title;
  final String description;
  final String duration;
  final double price;
  final String imageUrl;
  final String type;
  final String? pricingUnit;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.price,
    required this.imageUrl,
    this.type = 'Course',
    this.pricingUnit,
  });
}
