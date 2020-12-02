import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/bloc_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo API with BLoC',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocRouter().allSports(),
    );
  }
}
