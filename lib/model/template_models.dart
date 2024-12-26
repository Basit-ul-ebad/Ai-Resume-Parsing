class Template {
  final String name;
  final String imagePath;
  final String price;
  final String originalPrice;

  Template({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.originalPrice,
  });

}
final List<Map<String, dynamic>> templates = [
  {
    'name': 'Dani Schwaiger Resume',
    'image': 'assets/images/Dani Schwaiger Resume.webp',
    'price': '\$9.99',
    'originalPrice': '\$19.99',
  },
  {
    'name': 'richard sanches Resume',
    'image': 'assets/images/richard sanches.webp',
    'price': '\$7.99',
    'originalPrice': '\$14.99',
  },
  {
    'name': 'kriti laar Resume',
    'image': 'assets/images/kriti laar.webp',
    'price': '\$8.99',
    'originalPrice': '\$17.99',
  },
  {
    'name': 'olivi wilson Resume',
    'image': 'assets/images/olivi wilson.webp',
    'price': '\$10.99',
    'originalPrice': '\$20.99',
  },
];

