import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_venues/Model/Product.dart';
import '../../../Common Widget/preview_cell.dart';
import '../../../model/venues_model.dart';
import 'package:http/http.dart' as http;

class VenuesView extends StatefulWidget {
  const VenuesView({Key? key}) : super(key: key);

  @override
  State<VenuesView> createState() => _VenuesViewState();
}

class _VenuesViewState extends State<VenuesView> {
  bool _isSearchBarFocused = false;

  Future<List<Product>> fetchProducts() async {
    final String baseUrl = "http://192.168.1.36:8080/products";
    final response = await http.get(Uri.parse("$baseUrl/getAll"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      // Convert JSON to Product objects
      List<Product> allProducts = data.map((json) => Product.fromJson(json)).toList();

      // Filter products where category is "venues"
      List<Product> venues = allProducts.where((product) => product.category.toLowerCase() == "venues").toList();

      return venues;
    } else {
      throw Exception("Failed to load products");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                "assets/images/arrow.png",
                width: 25,
                height: 25,
                fit: BoxFit.contain,
                color: const Color(0xff981375),
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                "Venues",
                style: TextStyle(
                  color: Color(0xff6B0D52),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            toolbarHeight: 40, // Change this to adjust the height
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Get.back();
                },
                icon: Image.asset(
                  "assets/images/filter.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                  color: const Color(0xff981375),
                ),
              ),
              Expanded(
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(19)),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20),
                      prefixIcon: Container(
                        margin: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        width: 30,
                        child: Image.asset(
                          "assets/images/search.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          // color: TColor.primaryText28,
                        ),
                      ),
                      hintText: _isSearchBarFocused ? '' : "Search...",
                      hintStyle: const TextStyle(
                        // color: TColor.primaryText28,
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isSearchBarFocused = true;
                      });
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _isSearchBarFocused = false;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                itemCount: venuesList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 240,
                ),
                itemBuilder: (context, index) {
                  VenuesModel venues = venuesList[index];
                  return PreviewCell(
                    image: venues.image,
                    title: venues.name,
                    subtitle: venues.subtitle,
                    rating: '',
                    views: '',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
