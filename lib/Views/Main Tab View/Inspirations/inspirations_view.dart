import 'package:flutter/material.dart';

class InspirationsView extends StatefulWidget {
  const InspirationsView({Key? key}) : super(key: key);

  @override
  State<InspirationsView> createState() => _InspirationsViewState();
}

class _InspirationsViewState extends State<InspirationsView> with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectTab = 0;
  int isSelected = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
    controller.addListener(() {
      setState(() {
        selectTab = controller.index;
      });
    });
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
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Inspirations",
                style: TextStyle(
                  color: Color(0xff6B0D52),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/search.png",
                  width: 50,
                  height: 80,
                  fit: BoxFit.contain,
                  color: const Color(0xff981375),
                ),
              ),
            ],
            toolbarHeight: 40, // Change this to adjust the height
          ),
          // GridView.custom(
          //   gridDelegate: SliverQuiltedGridDelegate(
          //     crossAxisCount: 3,
          //     mainAxisSpacing: 4,
          //     crossAxisSpacing: 4,
          //     repeatPattern: QuiltedGridRepeatPattern.inverted,
          //     pattern: [
          //       QuiltedGridTile(1, 2),
          //       QuiltedGridTile(2, 1),
          //       QuiltedGridTile(2, 1),
          //       QuiltedGridTile(1, 1),
          //       QuiltedGridTile(1, 1),
          //       QuiltedGridTile(2, 1),
          //       QuiltedGridTile(1, 2),
          //     ],
          //   ),
          //   childrenDelegate: SliverChildBuilderDelegate(
          //         (context, index) => Tile(index: index),
          //   ),
          // ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: const Color(0xff981375),
        backgroundColor: const  Color(0xff981375).withOpacity(0.3),
        onPressed: (){ },
        child: const Icon(Icons.add),
      ),
    );
  }
}
