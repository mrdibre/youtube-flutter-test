import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:youtube_getx/ui/routes/route-generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    title: "YouTube GetX",
    debugShowCheckedModeBanner: false,
    initialRoute: HOME_ROUTE,
    onGenerateRoute: RouteGenerator.generate,
  ));
}

