import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../../Model/user_model.dart';
import 'login_page.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  bool loading = false;
  final hidePassword = false.obs;
  final privacyPolicy = true.obs;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController() ;
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> signup() async {
    final String apiUrl = 'http://192.168.1.36:8080/client/public/signup';

    try {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'firstName': fNameController.text.trim(),
          'lastName': lNameController.text.trim(),
          'userName': userNameController.text.trim(),
          'email': emailController.text.trim(),
          'phoneNo': phoneNumberController.text.trim(),
          'password': passwordController.text
        }),
      );

      // Close the loading indicator
      Get.back();

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        // Check for success in the response
        if (responseData['success'] == true) {
          Get.snackbar('Success', 'Signup completed successfully!',
              snackPosition: SnackPosition.BOTTOM);
          Get.to(() => const LoginView());
        } else {
          Get.snackbar('Error', responseData['message'] ?? 'Signup failed',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        // Handle non-200 status codes
        Get.snackbar('Error', 'Server returned status: ${response.statusCode}',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      // Close the loading indicator if any exception occurs
      Get.back();

      // Handle connection errors or unexpected issues
      Get.snackbar('Error', 'An error occurred: $error',
          snackPosition: SnackPosition.BOTTOM);
      print(error);
    }
  }

  void _showSignUpSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Up Successful'),
          content: Text('You have been registered successfully. Please go back to the login page.'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate back to the login view
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: Text('Go to Login'),
            ),
          ],
        );
      },
    );
  }

  String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return '$fieldName is required';
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
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Let's create your account",
                        style: TextStyle(
                          color: Color(0xFF3d072f),
                          fontSize: 25.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: fNameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: const Icon(Icons.person_2_outlined),
                            labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) => validateEmptyText('First Name', value)
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                          controller: lNameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: const Icon(Icons.person_2_outlined),
                            labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) => validateEmptyText('Last Name', value)
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: const Icon(Icons.person_3),
                      labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) => validateEmptyText('Username', value)
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelStyle: const TextStyle(color: Color(0xFF3d072f)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Enter Phone number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      prefixIcon: const Icon(Icons.phone),
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
                      final phoneRegExp = RegExp(r'^\d{10}$');
                      if(!phoneRegExp.hasMatch(value)){
                        return 'Invalid phone number format (10 digit required)';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Obx(
                    () => TextFormField(
                      controller: passwordController,
                      obscureText: hidePassword.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_open_outlined),
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
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Obx(() => Checkbox(
                            value: privacyPolicy.value,
                            onChanged: (value) => privacyPolicy.value = !privacyPolicy.value,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'I agree to ',),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Colors.blue
                              )
                            ),
                            TextSpan(
                              text: ' and'
                            ),
                            TextSpan(
                              text: ' Terms of use',
                              style: TextStyle(
                                color: Colors.blue
                              )
                            )
                          ]
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      signup();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff981375),
                    minimumSize: const Size(350, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFFC7AE6A),
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: (){
                          Get.to(()=>const LoginView());
                        },
                        child: const Text("Login")
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



