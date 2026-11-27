import 'package:flutter/material.dart';

import 'jokes.dart';

final Color appColor = Colors.green.shade300;
//part1
void main() {
  runApp(
    const MaterialApp(
      //home: Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: appColor,
    //     title: const Text("Favorite Jokes"),
    //   ),
    //   body: 
    //   //TODO:6 change to can scroll
    //   // const Column(children: [FavoriteCard(), FavoriteCard(), FavoriteCard()],
    //   ListView(
    //     children: [
    //       for(var joke in jokes)
    //       FavoriteCard(joke: joke),
    //     ],
      
    //   ),
    // ),
    //TODO:7
      home: FavoriteJokesScreen(),
    ),
  );
}
//part2,the parent

class FavoriteJokesScreen extends StatefulWidget {
  const FavoriteJokesScreen({super.key});

  @override
  State<FavoriteJokesScreen> createState() => _FavoriteJokesScreenState();
}
//part3
//parent stores the favorite
class _FavoriteJokesScreenState extends State<FavoriteJokesScreen> {
  // Stores the one selected favorite joke.and the memory: which joke is favorite
  Joke? favoriteJoke;
//TODO:8 action change the favorite
  void changeFavorite(Joke selectedJoke) {
    setState(() {
      if (favoriteJoke == selectedJoke) {
        // Remove the favorite.
        favoriteJoke = null;
      } else {
        // Select this joke and replace the old favorite.
        favoriteJoke = selectedJoke;
      }
    });
  }
//create one card for every joke
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView(
        children: [
          for (final joke in jokes)
            FavoriteCard(
              joke: joke,
              isFavorite: favoriteJoke == joke,
              onFavoriteClick: () {
                changeFavorite(joke);
              },
            ),
        ],
      ),
    );
  }
}
//part 4 child
class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;

  // Function received from the parent for handling the heart click.
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFavorite
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}