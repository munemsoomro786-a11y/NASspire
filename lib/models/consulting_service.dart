class ConsultingService {
  final String id;
  final String title;
  final String type;
  final double price;
  final String pricingUnit;
  final String category;
  final String imageUrl;
  final String description;

  const ConsultingService({
    required this.id,
    required this.title,
    required this.type,
    required this.price,
    this.pricingUnit = '',
    required this.category,
    this.imageUrl = 'https://images.unsplash.com/photo-1573164713988-8665fc963095?auto=format&fit=crop&w=400&q=80',
    this.description = 'Expert guidance to elevate your professional trajectory and unlock your true potential.',
  });
}
