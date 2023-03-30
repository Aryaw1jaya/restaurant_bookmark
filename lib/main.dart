import 'package:flutter/material.dart';
import 'package:restaurant_app/detail_menu.dart';
import 'package:restaurant_app/model/restaurant.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        _HomeState.routeName: (context) => Home(),
        Detail.routeName: (context) => Detail(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const routeName = '/restaurant_home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Center(
            child: Column(
              children: [
                Text('Restaurant'),
                Text('Recomendation Restaurant For You !'),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 101, 0, 164),
        ),
        body: Container(
          child: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/local_restaurant.json'),
            builder: (context, snapshot) {
              final List<Restaurant> restaurant =
                  parseRestaurants(snapshot.data);
              if (snapshot.hasData) {
                print(snapshot.data);
                return ListView.builder(
                  itemCount: restaurant.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          _buildRestaurantItem(context, restaurant[index])
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurant.pictureId,
        child: Image.network(
          restaurant.pictureId,
          width: 100,
        ),
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(
                restaurant.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              Text(restaurant.city),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(restaurant.rating.toString()),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, Detail.routeName, arguments: restaurant);
      },
    );
  }
}
