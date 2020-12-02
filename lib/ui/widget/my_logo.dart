import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final String url;
  final double size;

  MyLogo({
    @required this.url,
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return (url == null)
        ? Container(
            width: size,
            height: size,
          )
        : Image.network(
            url,
            width: size,
            height: size,
          );
  }
}
