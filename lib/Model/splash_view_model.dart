import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Views/IntroPage/intro_view.dart';

class SplashViewMode extends GetxController{

  var scaffoldKey = GlobalKey<ScaffoldState>();



  void loadView() async{
    await Future.delayed(const Duration(seconds: 3));
    Get.to(()=>const IntroView());
  }

  void openDrawer(){
    scaffoldKey.currentState?.openDrawer();

  }
  void closeDrawer(){
    scaffoldKey.currentState?.closeDrawer();
  }
}
