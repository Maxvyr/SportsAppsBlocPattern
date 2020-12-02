import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String url;
  final double size;

  IconWidget({
    @required this.url,
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return (url == null)
        ? SizedBox(
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
