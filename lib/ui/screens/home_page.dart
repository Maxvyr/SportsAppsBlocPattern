import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/blocs/bloc_sport.dart';
import 'package:flutter_app_bloc_api/bloc/provider/bloc_provider.dart';
import 'package:flutter_app_bloc_api/ui/lists/list_sports.dart';
import 'package:flutter_app_bloc_api/ui/widget/no_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //bloc pour lui dire l'event a listen
    final bloc = BlocProvider.of<BlocSport>(context);
    final heightImg = MediaQuery.of(context).size.height * 0.2;
    final heightBox = MediaQuery.of(context).size.height * 0.05;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: heightBox),
            Container(
              height: heightImg,
              child: Image.network(
                  "https://cdn.freebiesupply.com/logos/large/2x/sports-logo-png-transparent.png"),
            ),
            Expanded(
              child: StreamBuilder(
                stream: bloc.stream,
                builder: (context, snap) {
                  if (snap == null) {
                    return NoData("Server Error");
                  } else if (!snap.hasData) {
                    return NoData("No Data");
                  } else {
                    return ListSports(snap.data);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
