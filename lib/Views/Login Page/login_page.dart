import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Main Tab View/main_tab_view.dart';
import 'sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  Map<String, dynamic>? userData;
  bool _isLoading = false;
  final hidePassword = false.obs;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController() ;
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> loginUser(String username, String password) async {
    final String apiUrl = 'http://192.168.1.36:8080/client/public/login';
    setState(() {
      _isLoading = true;
    });

    try {
      print("Attempting to login with $username and $password");
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "userName": username, // Updated to match backend
          "password": password,
        }),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          String token = data['token'];
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwt', token);
          print("JWT: $token");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainTabView()),
          );
        } else {
          Get.snackbar('Login Failed', data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to log in. Check your credentials.');
      }
    } catch (error) {
      print("Caught error: $error");
      Get.snackbar('Error', 'An error occurred during login');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFFd5c28f), Colors.white],
            ),
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/BorderedLogo.png", width: 350,),
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFFC7AE6A),
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.alternate_email),
                      labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Enter email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Obx(()=> TextFormField(
                      controller: passwordController,
                      obscureText: hidePassword.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          onPressed: () => hidePassword.value = !hidePassword.value,
                          icon: Icon( hidePassword.value ? Icons.visibility_off : Icons.visibility),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: (){
                            Get.to(()=> const SignUpView());
                          },
                          child: const Text("Sign up"))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton.icon(
                  onPressed: () {
                    // loginUser(emailController.text, passwordController.text);
                    Get.to(() => MainTabView());
                  },
                  icon: _isLoading ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Color(0xFFC7AE6A),
                      strokeWidth: 2,
                    ),
                  )
                      : const SizedBox.shrink(),
                  label: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFFC7AE6A),
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff981375),
                    minimumSize: const Size(350, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
