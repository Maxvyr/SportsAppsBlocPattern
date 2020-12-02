import 'package:flutter/material.dart';

import 'my_logo.dart';
import 'my_text.dart';

class ContainerData extends StatelessWidget {
  final String url;
  final String text;
  final double height;

  ContainerData(
      {@required this.url, @required this.text, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyLogo(
              url: url,
              size: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyText(
                data: text,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
