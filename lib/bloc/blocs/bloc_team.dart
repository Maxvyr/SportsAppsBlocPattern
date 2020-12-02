import 'dart:async';

import 'package:flutter_app_bloc_api/bloc/provider/bloc.dart';
import 'package:flutter_app_bloc_api/controller/services/sportsDB_api.dart';
import 'package:flutter_app_bloc_api/models/teams.dart';

class BlocTeam extends Bloc {
  //var Input and outpu
  final _streamController = StreamController<List<Team>>();
  Stream<List<Team>> get stream => _streamController.stream;
  Sink<List<Team>> get sink => _streamController.sink;

  //Constructor
  BlocTeam(String id) {
    fetchTeams(id);
  }

  //logique
  fetchTeams(String id) async {
    final teams = await SportsDBApi().fetchAllTeams(id);
    sink.add(teams);
  }

  @override
  dispose() => _streamController.close();
}
