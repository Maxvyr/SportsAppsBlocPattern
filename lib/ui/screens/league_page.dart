import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/blocs/bloc_team.dart';
import 'package:flutter_app_bloc_api/bloc/provider/bloc_provider.dart';
import 'package:flutter_app_bloc_api/controller/colors.dart';
import 'package:flutter_app_bloc_api/models/leagues.dart';
import 'package:flutter_app_bloc_api/ui/lists/list_team.dart';
import 'package:flutter_app_bloc_api/ui/widget/container_data.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_appbar.dart';
import 'package:flutter_app_bloc_api/ui/widget/no_data.dart';

class LeaguePage extends StatelessWidget {
  final League league;

  LeaguePage(this.league);

  @override
  Widget build(BuildContext context) {
    final blocTeam = BlocProvider.of<BlocTeam>(context);
    final heightContainer = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      appBar: MyAppBar(
        title: league.name,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ContainerData(
            url: league.images.logo,
            text: league.description.english,
            height: heightContainer,
          ),
          Divider(
            thickness: 2,
            color: teal,
          ),
          Expanded(
            child: StreamBuilder(
              stream: blocTeam.stream,
              builder: (ctx, snap) {
                if (snap == null) {
                  return NoData("Server Error");
                } else if (!snap.hasData) {
                  return NoData("No Data");
                } else {
                  return TeamList(snap.data);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
