import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/bloc_router.dart';
import 'package:flutter_app_bloc_api/models/leagues.dart';
import 'package:flutter_app_bloc_api/ui/widget/icon_widget.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_text.dart';

class TileLeague extends StatelessWidget {
  final League league;

  TileLeague(this.league);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          Navigator.of(context).push(BlocRouter().leagueDetail(league)),
      title: MyText(
        data: league.name,
      ),
      leading: IconWidget(
        url: league.images.badge,
        size: 40.0,
      ),
    );
  }
}
