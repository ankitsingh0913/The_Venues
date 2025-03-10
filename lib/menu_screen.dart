import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Views/Login Page/login_page.dart';

class MenuScreenPage extends StatefulWidget {
  const MenuScreenPage({super.key});

  @override
  State<MenuScreenPage> createState() => _MenuScreenPageState();
}

class _MenuScreenPageState extends State<MenuScreenPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  String userName = "Name";
  String email = "email@example.com";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    // Slide animation moving from right to left
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start off-screen (right)
      end: const Offset(-1.0, 0.0), // End off-screen (left)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    // Repeat the animation continuously
    _animationController.repeat();

    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    final apiURL = "http://172.21.32.1:8080/client/user";
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    try {
      final response = await http.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          userName = data['firstName'] ?? "Name";
          email = data['email'] ?? "email@example.com";
        });
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      Get.snackbar(
        "Error",
        "Failed to fetch user details",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
    Get.offAll(() => const LoginView());
  }

  Widget buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30, color: const Color(0xff981375)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Color(0xff981375),
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xfff6f6f6),
              Color(0xffd5c28f),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xfff6f6f6)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "assets/images/flower.png",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded( // Ensures the column does not overlap with the image
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 27,
                            color: Color(0xff6B0D52),
                          ),
                        ),
                        const SizedBox(height: 3),
                        ClipRect( // Clips the animated widget to avoid overflow
                          child: SizedBox(
                            height: 25, // Restrict height to the text
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Text(
                                email,
                                maxLines: 1,
                                overflow: TextOverflow.clip, // Ensures no overflow occurs
                                style: TextStyle(
                                  fontSize: 17,
                                  color: const Color(0xff6B0D52).withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildMenuOption(
              icon: Icons.home_outlined,
              title: "Home",
              onTap: () {
                // Add navigation logic
              },
            ),
            const Divider(thickness: 1),
            buildMenuOption(
              icon: Icons.dark_mode_outlined,
              title: "Theme",
              onTap: () {
                // Add theme change logic
              },
            ),
            const Divider(thickness: 1),
            buildMenuOption(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () {
                // Add settings navigation logic
              },
            ),
            const Divider(thickness: 1),
            buildMenuOption(
              icon: Icons.privacy_tip_outlined,
              title: "Privacy",
              onTap: () {
                // Add privacy settings navigation logic
              },
            ),
            const Divider(thickness: 1),
            buildMenuOption(
              icon: Icons.import_contacts,
              title: "About",
              onTap: () {
                // Add about page navigation logic
              },
            ),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: GestureDetector(
                onTap: logout,
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffd5c28f),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout,
                      size: 25,
                      color: Color(0xff981375),
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff981375).withOpacity(1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
