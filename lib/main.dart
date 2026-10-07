import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameen_school/core/routes/app_pages.dart';
import 'package:grameen_school/core/routes/app_routes.dart';

void main() {
  runApp(const GrameenSchoolApp());
}

class GrameenSchoolApp extends StatelessWidget {
  const GrameenSchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grameen School',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}