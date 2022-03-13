import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i/app/contansts.dart';
import 'package:i/meta/home.page.dart';

void main() {
  runApp(const FileManager());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class FileManager extends StatelessWidget {
  const FileManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Gilfory",
          scaffoldBackgroundColor: scaffoldColor,
          appBarTheme:
              const AppBarTheme(elevation: 0.0, color: Colors.transparent)),
      home: const HomePage(),
    );
  }
}
