import 'dart:async';

import 'package:flutter_app_bloc_api/controller/services/sportsDB_api.dart';
import 'package:flutter_app_bloc_api/models/leagues.dart';

import '../provider/bloc.dart';

class BlocLeague extends Bloc {
  //Variable
  final _streamController = StreamController<List<League>>();

  //Entrées
  Sink<List<League>> get sink => _streamController.sink;

  //Sorties
  Stream<List<League>> get stream => _streamController.stream;

  //Constructor
  BlocLeague(String name) {
    fetchLeagues(name);
  }

  //logique
  fetchLeagues(String name) async {
    final leagues = await SportsDBApi().fetchAllLeagues(name);
    sink.add(leagues);
  }

  @override
  dispose() => _streamController.close();
}
