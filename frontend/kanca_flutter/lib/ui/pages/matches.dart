import 'package:chill/bloc/matches/bloc.dart';
import 'package:chill/models/user.dart';
import 'package:chill/repositories/matchesRepository.dart';
import 'package:chill/ui/widgets/iconWidget.dart';
import 'package:chill/ui/widgets/pageTurn.dart';
import 'package:chill/ui/widgets/profile.dart';
import 'package:chill/ui/widgets/userGender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'messaging.dart';

class Matches extends StatefulWidget {
  final String userID;

  const Matches({this.userID});

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  MatchesRepository matchesRepository = MatchesRepository();
  MatchesBloc _matchesBloc;

  int difference;

  getDifference(GeoPoint userLocation) async {
    Position position = await GeoLocator().getcurrentPositino();

    double location = await GeoLocator().distanceBetween(userLocation.latitude,
        userLocation.longitude, position.latitude, position.longitude);

    difference = location.toInt();
  }

  @override
  void initState() {
    _matchesBloc = MatchesBloc(matchesRepository: matchesRepository);
    super.initState();
  }
}
