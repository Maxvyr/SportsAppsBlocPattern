import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/blocs/bloc_league.dart';
import 'package:flutter_app_bloc_api/bloc/provider/bloc_provider.dart';
import 'package:flutter_app_bloc_api/controller/colors.dart';
import 'package:flutter_app_bloc_api/models/sports.dart';
import 'package:flutter_app_bloc_api/ui/lists/list_league.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_appbar.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_text.dart';
import 'package:flutter_app_bloc_api/ui/widget/no_data.dart';

class SportPage extends StatelessWidget {
  final Sport sport;

  SportPage(this.sport);
  @override
  Widget build(BuildContext context) {
    final blocLeague = BlocProvider.of<BlocLeague>(context);
    final heighCardDesc = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      appBar: MyAppBar(
        title: sport.name,
      ),
      body: Column(
        children: [
          cardSports(heighCardDesc),
          Expanded(
            child: StreamBuilder(
              //recup les datas
              stream: blocLeague.stream,
              builder: (context, snap) {
                if (snap == null) {
                  return NoData("Server Error");
                } else if (!snap.hasData) {
                  return NoData("No Data");
                } else {
                  return ListLeague(snap.data);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget cardSports(var height) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(sport.thumb),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyText(
                  data: sport.desc,
                  colorShadow: transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
