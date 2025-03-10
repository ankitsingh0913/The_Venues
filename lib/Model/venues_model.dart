class VenuesModel {
  VenuesModel({
    required this.id,
    required this.image,
    required this.name,
    required this.subtitle,
    required this.views,
    required this.rating,
    this.Category
  });

  String id;
  String image;
  String name;
  String subtitle;
  String views;
  String rating;
  String? Category;
}

final venuesList = [
  VenuesModel(
    id: '1',
    image: 'assets/images/Banglore1.png',
    name: 'Farmhouse Collective',
    subtitle: 'Old madras road, Bangalore',
    views: '6524',
    rating: '4.5',
    Category: 'Weddings'
    ),
  VenuesModel(
    id: '2',
    image: 'assets/images/Delhi1.png',
    name: 'Mallu Farms',
    subtitle: 'Chatarpur, Delhi',
    views: "6524",
    rating: '4.5',
    Category: 'Weddings'
    ),
  VenuesModel(
    id: '3',
    image: 'assets/images/Delhi2.png',
    name: 'The Kundan By Ferns N Petals',
    subtitle: 'Kapashera, Delhi',
    views: '6524',
    rating: '4.5',
    Category: 'Weddings'
    ),
  VenuesModel(
    id: '4',
    image: 'assets/images/Delhi3.png',
    name: 'Satvik by Chhabra Farm',
    subtitle: 'Pushpanjali, Delhi',
    views: '6524',
    rating: '4.5',
    Category: 'Weddings'
    ),

  VenuesModel(
      id: '5',
      image: 'assets/images/Delhi4.png',
      name: 'Calista Resort',
      subtitle: 'Kapashera, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),

  VenuesModel(
      views: '6524',
      rating: '4.5',
      id: '6',
      image: 'assets/images/Delhi5.png',
      name: 'The Nikunj by GNH Hotels and Resorts',
      subtitle: 'Rajokri, Delhi',
      Category: 'Weddings'
  ),

  VenuesModel(
      views: '6524',
      rating: '4.5',
      id: '7',
      image: 'assets/images/Delhi6.png',
      name: 'United Kingdom',
      subtitle: 'hi my name is ankit',
      Category: 'Weddings'
  ),

  VenuesModel(
      views: '6524',
      rating: '4.5',
      id: '8',
      image: 'assets/images/AnniversaryPhoto.png',
      name: 'Ritz at Ambience Golf Drive',
      subtitle: 'Gurgaon, Delhi',
      Category: 'Weddings'
  ),
];
