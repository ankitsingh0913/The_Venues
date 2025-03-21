import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../Model/itemlist.dart';

class DetailsView extends StatefulWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String rating;
  final String productImage;
  final String views;

  const DetailsView({super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.rating,
    required this.views,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> with SingleTickerProviderStateMixin {
  final itemVM = Get.put(ItemlistsViewModel());

  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = ColorTween(begin: Colors.white, end: Colors.red).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Color(0xff981375),
              ),
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.favorite_outline,
                color: Color(0xff981375),
              )
            )
          ],
          toolbarHeight: 40, // Change this to adjust the height
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(25.0), // Adjust the radius as needed
                ),
                child: Hero(
                  tag: "image-${widget.productImage}",
                  child: Image.asset(
                    widget.productImage,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 1000),
                    tween: Tween<double>(begin: 0, end: 1),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Color(0xff981375),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: widget.productName),
                          TextSpan(
                            text: " ${widget.productDescription}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Padding(
                          padding: EdgeInsets.only(left: value * 20),
                          child: child,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IgnorePointer(
                    ignoring: true,
                    child: RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      unratedColor: Colors.yellow.withOpacity(0.3),
                      itemCount: 5,
                      itemSize: 23,
                      itemPadding:  EdgeInsets.zero,
                      itemBuilder: (context,_) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      updateOnDrag: false,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ),
                const Text(
                  " Ratings 4.5, 5487 Reviews",
                  style: TextStyle(
                    color: Color(0xff981375),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10,),
                scrollDirection: Axis.horizontal,
                itemCount: itemVM.ItemlistArr.length,
                itemBuilder: (context,index){
                  var mObj = itemVM.ItemlistArr[index];
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Image.asset(mObj["image"],width: double.maxFinite,height: 90,fit: BoxFit.cover,)
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xffd5c28f).withOpacity(0.7),
                borderRadius: BorderRadius.circular(25)
              ),
              child: const Center(
                child: Text(
                  "Add to wishlist",
                  style: TextStyle(
                    color: Color(0xff981375),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
