import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/models/teams.dart';
import 'package:flutter_app_bloc_api/ui/widget/container_data.dart';
import 'package:flutter_app_bloc_api/ui/widget/my_appbar.dart';

class TeamPage extends StatelessWidget {
  final Team team;

  TeamPage(this.team);

  @override
  Widget build(BuildContext context) {
    final heightContainer = MediaQuery.of(context).size.height * 0.5;
    final width = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      appBar: MyAppBar(
        title: team.name,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerData(
              url: team.images.logo,
              text: team.description.english,
              height: heightContainer,
            ),
            Column(
              children: fans(
                200.0,
                width,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //add all fan art with for the team in a list of widget (images)
  List<Widget> fans(double height, double width) {
    List<Widget> list = [];
    team.images.fanArt.images.forEach(
      (url) {
        list.add(
          Column(
            children: [
              Image.network(
                url,
                width: width,
                height: height,
              ),
              SizedBox(height: 5.0),
            ],
          ),
        );
      },
    );
    return list;
  }
}
