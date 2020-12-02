import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void orientationPortraitOnly(Widget app) {
  //Mode protrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(app));
}
