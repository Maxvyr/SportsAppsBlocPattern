import 'dart:async';

import 'package:flutter_app_bloc_api/bloc/provider/bloc.dart';
import 'package:flutter_app_bloc_api/controller/services/sportsDB_api.dart';
import 'package:flutter_app_bloc_api/models/sports.dart';

class BlocSport extends Bloc {
  //Variable
  final _streamController = StreamController<List<Sport>>();

  //Entrées
  Sink<List<Sport>> get sink => _streamController.sink;

  //Sorties
  Stream<List<Sport>> get stream => _streamController.stream;

  //Constructor
  BlocSport() {
    fetchSports();
  }

  //logique
  fetchSports() async {
    final sports = await SportsDBApi().recoverAllSports();
    sink.add(sports);
  }

  //Fermeture du bloc
  @override
  dispose() => _streamController.close();
}
