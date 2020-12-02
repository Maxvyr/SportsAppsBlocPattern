import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/bloc_router.dart';
import 'package:flutter_app_bloc_api/controller/colors.dart';
import 'package:flutter_app_bloc_api/models/sports.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_text.dart';

class TileSport extends StatelessWidget {
  final Sport sport;

  TileSport(this.sport);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //appel de la page avec le router de bloc
      onTap: () => Navigator.of(context).push(BlocRouter().sportDetail(sport)),
      child: Card(
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 1.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                data: sport.name,
                colorShadow: transparent,
                fontSize: 25.0,
                color: teal,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  sport.thumb,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
