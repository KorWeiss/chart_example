//main.dart




import 'package:chart_example_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:프로젝트명/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Main',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      debugShowCheckedModeBanner: false, // 우측 상단 디버그 배너 제거
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
     
        
      ],
      
    );
  }
}