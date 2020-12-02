import 'dart:convert';

import 'package:flutter_app_bloc_api/controller/utils/helpers.dart';
import 'package:flutter_app_bloc_api/models/leagues.dart';
import 'package:flutter_app_bloc_api/models/sports.dart';
import 'package:flutter_app_bloc_api/models/teams.dart';
import 'package:http/http.dart' as http;

class SportsDBApi {
  final String _tag = "SportsDBApi";
  final _baseUrl = "https://www.thesportsdb.com/api/v1/json/1";
  String _allSports() => "$_baseUrl/all_sports.php";
  String _allLeagues(String name) => "$_baseUrl/search_all_leagues.php?s=$name";
  String _allTeamFromLeagues(String id) =>
      "$_baseUrl/lookup_all_teams.php?id=$id";

  Future<List> request(String urlString, String key) async {
    final result = await http.get(urlString);
    if (result.statusCode == 200) {
      final body = json.decode(result.body);
      printMax(tag: _tag, value: "$body");
      return body[key];
    } else {
      return [result.statusCode];
    }
  }

  Future<List<Sport>> recoverAllSports() async {
    final List list = await request(_allSports(), "sports");
    return list.map((json) => Sport.fromJson(json)).toList();
  }

  Future<List<League>> fetchAllLeagues(String name) async {
    final List list = await request(_allLeagues(name), "countrys");
    return list.map((json) => League.fromJson(json)).toList();
  }

  Future<List<Team>> fetchAllTeams(String id) async {
    final List list = await request(_allTeamFromLeagues(id), "teams");
    return list.map((json) => Team.fromJson(json)).toList();
  }
}
