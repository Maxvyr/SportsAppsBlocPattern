import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/models/teams.dart';
import 'package:flutter_app_bloc_api/ui/tile/tile_team.dart';

class TeamList extends StatelessWidget {
  final List<Team> teams;

  TeamList(this.teams);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (ctx, i) => Divider(),
      itemCount: teams.length,
      itemBuilder: (ctx, i) {
        Team team = teams[i];
        return TileTeam(team);
      },
    );
  }
}
