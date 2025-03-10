// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:weddingapp/model/user_model.dart';
//
// class UserRepository extends GetxController{
//   static UserRepository get instance => Get.find();
//
//   final db = FirebaseFirestore.instance;
//   createUser(UserModel user) async {
//     await db.collection("User").add(user.toJson()).whenComplete(() =>
//         Get.snackbar(
//             'Success',
//             'Your account has been created',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.green.withOpacity(0.1),
//           colorText: Colors.green
//         )
//     ).catchError((error, stackTrace){
//       Get.snackbar(
//           'Error',
//           'Something went wrong',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red.withOpacity(0.1),
//           colorText: Colors.red
//       );
//     });
//   }
// }