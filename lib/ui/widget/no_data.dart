import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/controller/colors.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_text.dart';

class NoData extends StatelessWidget {
  final String txt;
  NoData(this.txt);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(
        color: teal,
        data: txt,
        colorShadow: transparent,
        fontSize: 35.0,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
