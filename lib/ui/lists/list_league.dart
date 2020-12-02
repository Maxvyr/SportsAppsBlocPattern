import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/models/leagues.dart';
import 'package:flutter_app_bloc_api/ui/tile/tile_league.dart';

class ListLeague extends StatelessWidget {
  final List<League> leagues;

  ListLeague(this.leagues);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: leagues.length,
      itemBuilder: (ctx, i) {
        League league = leagues[i];
        return TileLeague(league);
      },
      separatorBuilder: (ctx, i) => Divider(),
    );
  }
}
