import 'package:flutter/material.dart';
import 'package:start_code/EXERCISE-3/data/profile_data.dart';

import 'ui/screens/profile.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profile: ronanProfile),
  ));
}
