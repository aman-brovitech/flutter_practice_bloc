import 'package:flutter/material.dart';

class FigmaHome extends StatefulWidget {
  const FigmaHome({Key? key}) : super(key: key);
  @override
  State<FigmaHome> createState() => _FigmaHome();
}

class _FigmaHome extends State<FigmaHome> {
  int currentIndex = 0;
  List<String> images = [
    "https://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg?w=996&t=st=1685013997~exp=1685014597~hmac=5d2558f817614a983609958ed01ef403502d747babb6243bdc30ea0e4cb178fe",
    "https://www.daysoftheyear.com/cdn-cgi/image/dpr=1%2Cf=auto%2Cfit=cover%2Cheight=651%2Cq=70%2Csharpen=1%2Cwidth=1400/wp-content/uploads/burger-day1.jpg",
    "https://www.allrecipes.com/thmb/HkH7lJ3v0rtLOpGd7un2k2k27eM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4488416-0627cab55d4e44ec80f974fbc67befb7.jpg",
  ];

  // List<String> items = [
  //   "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg",
  //   "https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  //   "https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 235, 235),
        title: Row(
          children: const [
            Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            Text(
              'Freedom way, Lekki phase ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://bcciplayerimages.s3.ap-south-1.amazonaws.com/ipl/IPLHeadshot2023/6.png'),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: '',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: '')
      ]),
      drawer: const Drawer(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.menu,
          color: Color.fromARGB(255, 246, 63, 50),
        ),
      ),
      body: Builder(builder: (BuildContext mContext) {
        return Container(
          padding: EdgeInsets.all(5),
          // height: 50,
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          prefixIcon: Icon(Icons.search),
                          fillColor: Color.fromARGB(255, 236, 163, 163),
                          filled: true,
                          hintText: "Search",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 325,
                    // width: MediaQuery.of(context).size.width,
                    child: PageView.builder(onPageChanged: (index) {
                      setState(() {
                        currentIndex = index % images.length;
                      });
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      );
                    }, itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              images[index % images.length],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < images.length; i++)
                        buildIndicator(currentIndex == i)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    unselectedLabelColor: Colors.redAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.redAccent),
                    tabs: [
                      // TabBarView(children: children),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.redAccent,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.network(
                                'https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-15.png',
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.redAccent,
                              )),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.network(
                              'https://www.nicepng.com/png/full/830-8300698_pizza-dominos-pizza-transparent-background.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.redAccent,
                              )),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.network(
                              'https://www.pngarts.com/files/5/Macaroni-Pasta-PNG-Image-Transparent-Background.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 22,
                  ),
                  Container(
                    height: 212, //height diy h or width kiy hai
                    width: 155,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 237, 236, 236),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text("3.8"),
                            ],
                          ),
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://www.vhv.rs/dpng/d/433-4333060_chicken-burger-png-transparent-png.png",
                              height: 80,
                              // width: 60,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const Text("Chicken Burger",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            )),
                        const Text(
                          "100 gr chicken + tomato + cheese Lettuce",
                          style: TextStyle(
                              color: Color.fromARGB(255, 61, 61, 61),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            const Text(
                              "\$ 20.00",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 49, 34),
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Color.fromARGB(255, 255, 49, 34),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 212, //height diy h or width kiy hai
                    width: 155,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 237, 236, 236),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text("4.5"),
                            ],
                          ),
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://i.pinimg.com/originals/c5/cc/20/c5cc2005ad651b73d324513750de085e.png",
                              height: 80,
                              // width: 60,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const Text("Chese Burger",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            )),
                        const Text(
                          "100 gr chicken + tomato + cheese Lettuce",
                          style: TextStyle(
                              color: Color.fromARGB(255, 61, 61, 61),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            const Text(
                              "\$ 15.00",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 49, 34),
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Color.fromARGB(255, 255, 49, 34),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // ----------
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Popular Meal Menu",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                        color: Color.fromARGB(255, 118, 118, 118),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Color.fromARGB(255, 118, 118, 118),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(
                        "https://img.freepik.com/free-photo/slice-fresh-pizza-with-pepperoni-white_144627-24389.jpg?size=626&ext=jpg&ga=GA1.1.888065165.1685013989&semt=ais0",
                        height: 64,
                        width: 64,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      children: const [
                        Text(
                          "Pepper Pizza",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "5kg box of Pizza",
                          style:
                              TextStyle(color: Color.fromARGB(255, 87, 85, 85)),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Text(
                      "\$ 15",
                      style: TextStyle(
                          color: Color.fromARGB(255, 252, 54, 40),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),

// --------------------------------------
              // Column(
              //   children: [
              //     Container(
              //       height: 150,
              //       width: 100,
              //       color: Colors.green,
              //       child: PageView.builder(
              //         onPageChanged: (index) {
              //           setState(() {
              //             currentIndex = index % items.length;
              //           });
              //           BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //           );
              //         },
              //         itemBuilder: (context, index) {
              //           return Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: SizedBox(
              //                 height: 200,
              //                 child: Image.network(
              //                   items[index % items.length],
              //                   fit: BoxFit.cover,
              //                 ),
              //               ));
              //         },
              //       ),
              //     ),
              // Container(
              //   height: 150,
              //   width: 100,
              //   color: Colors.yellow,
              //   child: const Text("heloo",
              //       style: TextStyle(color: Colors.red)),
              // )
              //   ],
              // )

              // SizedBox(
              //   height: 300,
              //   child: TabBar(
              //     physics: const ClampingScrollPhysics(),
              //     // padding: const EdgeInsets.only(
              //     //     top: 500, left: 10, right: 10, bottom: 10),
              //     unselectedLabelColor: Colors.pink,
              //     indicatorSize: TabBarIndicatorSize.label,
              //     indicator: BoxDecoration(
              //         borderRadius: BorderRadius.circular(30),
              //         color: Colors.pinkAccent),
              //     tabs: [
              //       Tab(
              //         child: Container(
              //           height: 35,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(30),
              //               border:
              //                   Border.all(color: Colors.pinkAccent, width: 1)),
              //           child: const Align(
              //             alignment: Alignment.center,
              //             child: Text("chat"),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )
              // -----------------
              // BottomNavigationBar(items: const [
              //   BottomNavigationBarItem(
              //       icon: Icon(Icons.home), backgroundColor: Colors.red),
              // ])
            ],
          ),
        );
      }),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}

// Widget buildCard(index) => Container(
//       width: 200,
//       height: 200,
//       color: Colors.red,
//       child: Column(
//         children: [
//           Expanded(
//               child: Image.network(
//                   "https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg",
//                   ))
//         ],
//       ),
//     );
