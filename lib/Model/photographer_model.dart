class PhotographerModel {
  PhotographerModel({
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

final photoList = [
  PhotographerModel(
      id: '1',
      image: 'assets/images/photo1.png',
      name: 'Studio Vision Photography',
      subtitle: 'Rohini Sector 21, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),
  PhotographerModel(
      id: '2',
      image: 'assets/images/photo2.png',
      name: 'Sumit Studio',
      subtitle: 'Krishna Nagar, Delhi',
      views: "6524",
      rating: '4.5',
      Category: 'Weddings'
  ),
  PhotographerModel(
      id: '3',
      image: 'assets/images/photo3.png',
      name: 'Shri Ram Creations',
      subtitle: 'South Extension 2, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),
  PhotographerModel(
      id: '4',
      image: 'assets/images/photo4.png',
      name: 'Bindal Studio By Sandeep',
      subtitle: 'Gurgaon Sector 50, Gurgaon',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),

  PhotographerModel(
      id: '5',
      image: 'assets/images/photo5.png',
      name: 'Candid Touch Photoography',
      subtitle: 'Sagarpur West, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),

  PhotographerModel(
      id: '6',
      image: 'assets/images/photo6.png',
      name: 'Bhavi Production',
      subtitle: 'Burari, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),


];
