import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_app/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class Snack {
  final String name;
  final double price;
  final String pic;
  final String details;
  final int likes;
  final double stars;

  const Snack({
    required this.name,
    required this.price,
    required this.pic,
    required this.details,
    this.likes = 0,
    this.stars = 0.0,
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.screenStart,
      routes: routes,
    );
  }
}

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final List<Snack> snacks = [
    Snack(
      name: "Mougli's Cup",
      price: 8.99,
      details: "iuh oi ui uh oi oih iuh ioj oij d",
      pic: "cat_cupcakes_3D.png",
      likes: 200,
      stars: 3.8,
    ),
    Snack(
      name: "Balu's Cup",
      price: 7.99,
      details: "iuh o6u65 6 u67 jk7u67u56uz5 5 57i ui uhioj oij d",
      pic: "Ice_cream.png",
      likes: 51,
      stars: 4.1,
    ),
    Snack(
      name: "Burger",
      price: 5.95,
      details: "iuh oi  oferfih iuh trhtrhioj orthrthij sd",
      pic: "Burger_3D.png",
      likes: 3,
      stars: 0.8,
    ),
    Snack(
      name: "IceStick",
      price: 7.01,
      details: "iuh ou47u4i ui 74u74uh oi 8o87ooih i87o87uh i8ooj oij dceced",
      pic: "ice_cream_stick_3D.png",
      likes: 9845,
      stars: 5.0,
    ),
    Snack(
      name: "Chik's Cup",
      price: 17.01,
      details: "iuh o657i6i ui u657i6ii6h oi oih iuh io675ij oij i567id",
      pic: "chick_cupcakes_3D.png",
      likes: 81,
      stars: 2.7,
    ),
    Snack(
      name: "Ice Cup",
      price: 3.60,
      details: "iui76ih oi ui 7i5iuh oi i657i7oih iuh65i6i ioj oi576iij d",
      pic: "Icecream_3D.png",
      likes: 374,
      stars: 1.9,
    ),
  ];

  //final List<String> items = ["Erste", "Zweite", "Dritte", "Vierte", "Fünfte"];
  final List<String> filters = [
    "All categories",
    "Salty",
    "Sweet",
    "Sour",
    "Bitter",
    "Spicy",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/bg_mainscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      "Choose Your Favorite Snack",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 30,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 8),

                    DefaultTabController(
                      length: filters.length,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              dividerHeight: 0,
                              isScrollable: true,
                              padding: EdgeInsets.zero,
                              tabAlignment: TabAlignment.start,
                              //indicatorWeight: 0,
                              indicatorPadding: EdgeInsetsGeometry.fromLTRB(
                                1,
                                5,
                                1,
                                6,
                              ),
                              indicatorColor: Colors.transparent,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(100, 255, 255, 255),
                              ),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                              labelPadding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                              labelColor: Color.fromARGB(250, 255, 255, 255),
                              unselectedLabelColor: Color.fromARGB(
                                128,
                                255,
                                255,
                                255,
                              ),
                              tabs: [
                                for (final filter in filters)
                                  Tab(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                            30,
                                            10,
                                            20,
                                            10,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                128,
                                                255,
                                                255,
                                                255,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: Color.fromARGB(
                                              50,
                                              255,
                                              255,
                                              255,
                                            ),
                                          ),
                                          child: Text(filter),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            /*
                          
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: filters.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: OutlinedButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    Routes.screenDetail,
                                  ),
                                  child: Text(filters[index]),
                                ),
                              );
                            },
                          ),

                          */
                          ),

                          const SizedBox(height: 8),

                          /*
                          SizedBox(
                            height: 50,
                            child: TabBarView(
                              children: [
                                for (final f in filters)
                                  Center(child: Text("Контент для $f")),
                              ],
                            ),
                          ),
*/
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),
                  ],
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(0, 20, 0, 30),
                    child: _TopCard(snack: snacks[2]),
                  ),
                ),

                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "We Recommend",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(right: 30),
                    itemCount: snacks.length,
                    itemBuilder: (context, index) {
                      final snack = snacks[index]; //???
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SizedBox(
                          width: 140,

                          child: Card(
                            elevation: 4,
                            color: Color.fromARGB(10, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(50, 255, 255, 255),
                                  width: 1,
                                ),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff7758bf),
                                    Color.fromARGB(0, 152, 26, 26),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  10,
                                  10,
                                  10,
                                  6,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1.1,
                                      child: Image.asset(
                                        'assets/images/pics/${snack.pic}',
                                        fit: BoxFit.contain,
                                      ),
                                    ),

                                    Text(
                                      snack.name,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          snack.details,
                                          textAlign: TextAlign.left,
                                          overflow:
                                              TextOverflow.ellipsis, // .....
                                          maxLines: 5,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '€ ${snack.price.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const WidgetSpan(
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  size: 14,
                                                  color: Color.fromARGB(
                                                    179,
                                                    255,
                                                    255,
                                                    255,
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ${snack.likes}',
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopCard extends StatelessWidget {
  final Snack snack;

  const _TopCard({required this.snack});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.6,
          image: AssetImage("assets/images/details/top_card.png"),
          fit: BoxFit.fill,
        ),
      ),

      /*
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          */
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      snack.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Image.asset(
                              "assets/images/pics/star.png",
                              width: 16,
                              height: 16,
                            ),
                          ),
                          TextSpan(
                            text: snack.stars.toStringAsFixed(1),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: Scrollbar(
                    thumbVisibility: false,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Text(
                        snack.details,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '€ ${snack.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    //const Spacer(),
                    Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(0, 20, 0, 30),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff908cf5), Color(0xffbb8de1)],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.screenMain);
                          },
                          child: const Text('Add to Order'),
                        ),
                      ),

                      /*                    
                      child: FilledButton.tonal(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.screenDetail),
                        child: const Text("Add to Order"),
                      ),

*/
                    ),
                  ],
                ),
              ],
            ),
          ),

          /*
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      snack.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      "juhg ju",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  snack.details,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                const Spacer(), //
                Text(
                  '€ ${snack.price}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.screenDetail),
                  child: const Text("btn"),
                ),
              ],
            ),
          ),


          */
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.translate(
              offset: const Offset(6, 0),
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    "assets/images/pics/${snack.pic}",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      /*
        ),
      ),
*/
    );
  }
}
