import 'package:flutter/material.dart';

import '../theme/theme.dart';
//1. because ProfileApp will use the ProfileData type.
import '../../model/profile_tile_model.dart';

class ProfileApp extends StatelessWidget {
  //2. make ProfileApp receive a profile
  final ProfileData profile;
  const ProfileApp({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //៣.manage the scrolling
      // body: Center(child: Column(
      //change to ListView
      body: ListView(
        children: [
          const SizedBox(height: 40),
          //wrap with center
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage:
                  //5. AssetImage('assets/images/w8/aang.png'),
                  AssetImage(profile.avatarUrl),
              //cuz img should come from ProfileDAta object
            ),
          ),
          const SizedBox(height: 20),
          //១. The ProfileApp widget must take as argument a ProfileData object.
          Text(
            //3. 'Ronan OGOR',
            profile.name,
            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Text(
            //4.'Flutter Developer',
            profile.position,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          // const ProfileTile(
          //   icon: Icons.phone,
          //   title: "Phone Number",
          //   data: "+123 456 7890",
          // ),
          // const ProfileTile(
          //   icon: Icons.location_on,
          //   title: "Address",
          //   data: "Cambodia",
          // ),

          //២. replace the static to loop
          //5. For every TileData inside profile.tiles, create one ProfileTile.
          for (var tile in profile.tiles)
            ProfileTile(icon: tile.icon, title: tile.title, data: tile.value),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
