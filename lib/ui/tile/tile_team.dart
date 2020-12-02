import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/bloc_router.dart';
import 'package:flutter_app_bloc_api/models/teams.dart';
import 'package:flutter_app_bloc_api/ui/widget/icon_widget.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_text.dart';

class TileTeam extends StatelessWidget {
  final Team team;

  TileTeam(this.team);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(BlocRouter().teamDetail(team)),
      title: MyText(
        data: team.name,
      ),
      leading: IconWidget(
        url: team.images.badge,
        size: 40.0,
      ),
    );
  }
}
