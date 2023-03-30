import 'package:flutter/material.dart';
import 'model/restaurant.dart';

class Detail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const Detail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Color.fromARGB(255, 101, 0, 164),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(restaurant.pictureId),
              Padding(padding: EdgeInsets.all(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(restaurant.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        restaurant.rating.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  Text(
                    restaurant.city,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text('Deskripsi: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                restaurant.description,
                textAlign: TextAlign.justify,
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text('Menu: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Makanan: '),
                        Padding(padding: EdgeInsets.all(5)),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: restaurant.menus.foods.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                                '- ' + restaurant.menus.foods[index].name);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Minuman: '),
                        Padding(padding: EdgeInsets.all(5)),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: restaurant.menus.drinks.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                  '- ' + restaurant.menus.drinks[index].name);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
