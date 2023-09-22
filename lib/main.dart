import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loyelty_card/routers/my_routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages:MyRouters.route,
    );
  }
}
