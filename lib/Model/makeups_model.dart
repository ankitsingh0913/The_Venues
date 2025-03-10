class MakeUpModel {
  MakeUpModel({
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

final makeupList = [
  MakeUpModel(
      id: '1',
      image: 'assets/images/makeup1.png',
      name: 'Shradha Luthra',
      subtitle: 'Mumbai, Maharashtra',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),
  MakeUpModel(
      id: '2',
      image: 'assets/images/makeup2.png',
      name: 'Bianca Louzado',
      subtitle: 'Udaipur, City of Lakes',
      views: "6524",
      rating: '4.5',
      Category: 'Weddings'
  ),
  MakeUpModel(
      id: '3',
      image: 'assets/images/makeup3.png',
      name: 'Ojas Rajani',
      subtitle: '',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),
  MakeUpModel(
      id: '4',
      image: 'assets/images/makeup4.png',
      name: 'Jasmeet Kapany',
      subtitle: '',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),

  MakeUpModel(
      id: '5',
      image: 'assets/images/makeup5.png',
      name: 'Namrata Soni',
      subtitle: 'Kapashera, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),

  MakeUpModel(
      id: '6',
      image: 'assets/images/makeup6.png',
      name: 'Pakkhi P Siroya',
      subtitle: '',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),


];
