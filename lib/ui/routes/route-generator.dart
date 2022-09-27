import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_getx/ui/routes/home/home.dart';
import 'package:youtube_getx/ui/routes/video-uploader/video-uploader.dart';

const String HOME_ROUTE = "/";
const String UPLOAD_VIDEO_ROUTE = "/upload-video";

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    late Widget screen;

    final args = settings.arguments;

    switch(settings.name) {
      case HOME_ROUTE:
        screen = Home();
        break;
      case UPLOAD_VIDEO_ROUTE:
        screen = VideoUploader();
        break;
      default:
        screen = RouteGenerator._errorRoute();
    }

    return MaterialPageRoute(builder: (_) => screen);
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela não encontrada")),
      body: const Center(
        child: Text("Tela não encontrada"),
      ),
    );
  }
}