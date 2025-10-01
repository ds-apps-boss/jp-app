import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                          ),

                          const SizedBox(height: 8),
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
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const MyModal(),
                            );
                          },
                          child: const Text('Add to Order'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

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

class MyModal extends StatelessWidget {
  const MyModal({super.key});

  //

  @override
  Widget build(BuildContext context) {
    int count = 3;
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(120, 0, 0, 0),
      child: Center(
        child: Stack(
          children: [
            // bg-pic
            Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                offset: const Offset(6, 0),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      "assets/images/pics/cat_cupcakes_3D.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(20, 100, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: IconButton.filled(
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(1),
                        shadowColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 255, 255, 255),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 60, 60, 60),
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(204, 255, 255, 255),
                        ),
                      ),

                      onPressed: () {},
                      icon: Icon(Icons.close_sharp),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(0, 180, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(60, 255, 255, 255),
                        ),

                        color: Color.fromARGB(200, 255, 255, 255),
                      ),
                      width: double.infinity,
                      height: 60,
                      //color: Colors.blueAccent,
                      alignment: Alignment.center,

                      child: const Text(
                        "Контейнер на всю ширину",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 60,
                          //color: Colors.green,
                          alignment: Alignment.center,
                          child: SegmentedButton<String>(
                            segments: const <ButtonSegment<String>>[
                              ButtonSegment(
                                value: "small",
                                label: Text("Small"),
                              ),
                              ButtonSegment(
                                value: "medium",
                                label: Text("Medium"),
                              ),
                              ButtonSegment(
                                value: "large",
                                label: Text("Large"),
                              ),
                            ],
                            selected: const <String>{"medium"},
                            onSelectionChanged: (Set<String> newSelection) {
                              // setState(() => _selected = newSelection); //  StatefulWidget
                            },
                            style: ButtonStyle(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              backgroundColor:
                                  WidgetStateProperty.resolveWith<Color?>((
                                    states,
                                  ) {
                                    return states.contains(WidgetState.selected)
                                        ? const Color.fromARGB(
                                            40,
                                            255,
                                            255,
                                            255,
                                          )
                                        : const Color.fromARGB(
                                            80,
                                            255,
                                            255,
                                            255,
                                          );
                                  }),

                              foregroundColor:
                                  WidgetStateProperty.resolveWith<Color?>((
                                    states,
                                  ) {
                                    return states.contains(WidgetState.selected)
                                        ? Colors.black
                                        : Colors.white;
                                  }),

                              side: const WidgetStatePropertyAll(
                                BorderSide(
                                  color: Color.fromARGB(71, 255, 255, 255),
                                  width: 1,
                                ),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              textStyle: const WidgetStatePropertyAll(
                                TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                              ),

                              minimumSize: const WidgetStatePropertyAll(
                                Size(0, 32),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Container(
                          height: 60,
                          color: Colors.orange,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  /*
              setState(() {
                if (count > 0) count--;
                */
                                  //});
                                },
                              ),
                              Text(
                                count.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  //setState(() {
                                  //count++;
                                  //});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xfff075d5), Color(0xfff59dbe)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
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
                        child: const Text('Add to Order for'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*
            Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(20, 200, 20, 20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Text(
                        "222222",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 22, 22, 22),
                        ),
                      ),
                    ),
                  ),
                ),

                Text("333"),
              ],
            ),

*/

            // inhalt
          ],
        ),
      ),
    );
  }
}
