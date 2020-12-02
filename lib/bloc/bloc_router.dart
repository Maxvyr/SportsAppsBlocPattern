import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api/bloc/blocs/bloc_league.dart';
import 'package:flutter_app_bloc_api/bloc/blocs/bloc_sport.dart';
import 'package:flutter_app_bloc_api/bloc/blocs/bloc_team.dart';
import 'package:flutter_app_bloc_api/bloc/provider/bloc_provider.dart';
import 'package:flutter_app_bloc_api/models/leagues.dart';
import 'package:flutter_app_bloc_api/models/sports.dart';
import 'package:flutter_app_bloc_api/models/teams.dart';
import 'package:flutter_app_bloc_api/ui/screens/home_page.dart';
import 'package:flutter_app_bloc_api/ui/screens/league_page.dart';
import 'package:flutter_app_bloc_api/ui/screens/sport_page.dart';
import 'package:flutter_app_bloc_api/ui/screens/team_page.dart';

class BlocRouter {
  //methode appel des pages
  //sports
  MaterialPageRoute sportDetail(Sport s) => MaterialPageRoute(
        builder: (context) => sportsChoice(s),
      );
  //leagues
  MaterialPageRoute leagueDetail(League l) => MaterialPageRoute(
        builder: (context) => leagueChoice(l),
      );
  //teams
  MaterialPageRoute teamDetail(Team t) => MaterialPageRoute(
        builder: (context) => teamChoice(t),
      );

  // chemin avec le bloc lier a chaque page
  BlocProvider allSports() => BlocProvider<BlocSport>(
        bloc: BlocSport(),
        child: HomePage(),
      );
  BlocProvider sportsChoice(Sport sport) => BlocProvider<BlocLeague>(
        bloc: BlocLeague(sport.name),
        child: SportPage(sport),
      );
  BlocProvider leagueChoice(League league) => BlocProvider<BlocTeam>(
        bloc: BlocTeam(league.id),
        child: LeaguePage(league),
      );
  BlocProvider teamChoice(Team team) => BlocProvider<BlocTeam>(
        bloc: BlocTeam(team.id),
        child: TeamPage(team),
      );
}
