import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/models/sports.dart';
import 'package:flutter_app_bloc_api/ui/tile/tile_sport.dart';

class ListSports extends StatelessWidget {
  final List<Sport> sports;

  ListSports(this.sports);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: sports.length,
      itemBuilder: (ctx, i) {
        Sport sport = sports[i];
        return TileSport(sport);
      },
    );
  }
}
