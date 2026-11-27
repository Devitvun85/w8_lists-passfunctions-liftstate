import 'package:flutter/material.dart';
import 'ui/screens/profile.dart';
//6.Import the existing data:
import 'data/profile_data.dart';
void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: ProfileApp(),
    //7.Give the ronanProfile object to the profile screen.
    home: ProfileApp(profile: ronanProfile),
  ));
}
