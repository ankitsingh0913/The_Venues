import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class GroomWearModel {
  String id;
  String image;
  String name;
  String subtitle;
  String views;
  String rating;
  String? Category;

  GroomWearModel({
    required this.id,
    required this.image,
    required this.name,
    required this.subtitle,
    required this.views,
    required this.rating,
    this.Category
  });
}




var groomList = [
  GroomWearModel(
      id: '1',
      image: 'assets/images/GroomWear1.png',
      name: 'Farmhouse Collective',
      subtitle: 'Old madras road, Bangalore',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),
  GroomWearModel(
      id: '2',
      image: 'assets/images/GroomWear2.png',
      name: 'Mallu Farms',
      subtitle: 'Chatarpur, Delhi',
      views: "6524",
      rating: '4.5',
      Category: 'Weddings'
  ),
  GroomWearModel(
      id: '3',
      image: 'assets/images/GroomWear3.png',
      name: 'The Kundan By Ferns N Petals',
      subtitle: 'Kapashera, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),
  GroomWearModel(
      id: '4',
      image: 'assets/images/GroomWear4.png',
      name: 'Satvik by Chhabra Farm',
      subtitle: 'Pushpanjali, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),

  GroomWearModel(
      id: '5',
      image: 'assets/images/GroomWear5.png',
      name: 'Calista Resort',
      subtitle: 'Kapashera, Delhi',
      views: '6524',
      rating: '4.5',
      Category: 'Weddings'
  ),

  GroomWearModel(
      views: '6524',
      rating: '4.5',
      id: '6',
      image: 'assets/images/GroomWear6.png',
      name: 'The Nikunj by GNH Hotels and Resorts',
      subtitle: 'Rajokri, Delhi',
      Category: 'Weddings'
  ),

];
