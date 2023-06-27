import 'package:flutter/material.dart';

class Food {
  final String title;
  final String Url;
  final bool isliked;
  final String thumbnail;
  final String duration;
  final String description;
  Food({
    required this.title,
    required this.Url,
    required this.isliked,
    required this.thumbnail,
    required this.duration,
    required this.description,
  });
}

class FoodItemList extends StatefulWidget {
  const FoodItemList({Key? key}) : super(key: key);
  // String get title => null;
  @override
  State<FoodItemList> createState() => _FoodItemListState();
}

class _FoodItemListState extends State<FoodItemList> {
  List<Food> foods = [
    Food(
        title: "Burger",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "45mins",
        description: " veg burger"),
    Food(
        title: "Pizza",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "10mins",
        description: "veg or non veg "),
    Food(
        title: "Fries",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "spicy",
        description: " "),
    Food(
        title: "idli",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "40mins",
        description: " idli"),
    Food(
        title: "Cake",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "50mins",
        description: "various type"),
    Food(
        title: "Paneer",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "30mins",
        description: "fresh paneer"),
    Food(
        title: "Roti",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "15mins",
        description: "Tawa"),
    Food(
        title: "Chawal",
        Url: 'https://tinyurl.com/5n72cccy',
        isliked: false,
        thumbnail: "https://ssaaa.com/",
        duration: "5mins",
        description: "Brown or biryani"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Items-List"),
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          var food = foods[index];
          return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  width: 100,
                  height: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZzcs0YIKSsRqkt2IVRoef8TiKiuACfbpLbg&usqp=CAU",
                        // width: 180,
                        // height: 180,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          food.title,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 12, 12, 12)),
                                        ),
                                        const SizedBox(
                                            // width: 1000,
                                            // height: 20,
                                            ),
                                        Icon(
                                          Icons.favorite,
                                          color: food.isliked
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ])),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                food.duration,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                food.description,
                                softWrap: true,
                              )
                            ]),
                      )
                    ],
                  )));
        },
      ),
    );
  }
}
