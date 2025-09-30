import 'package:flutter/material.dart';
import 'package:jp_app/app_routes.dart';

void main() {
  runApp(const MainApp());
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

  final List<String> items = ["Erste", "Zweite", "Dritte", "Vierte", "Fünfte"];

  final List<String> filters = [
    "All categories",
    "Salty",
    "Sweet",
    "Malty",
    "Quit",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgrounds/bg_mainscreen.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Choose Your Favorite Snack",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 30,
                            decoration: TextDecoration.none,
                          ),
                        ),

                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: filters.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(12),
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
                        ),
                      ],
                    ),

                    Text("22222"),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        "We Recommend",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250, // фиксируем высоту ряда
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              width: 140,
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: const TextStyle(fontSize: 18),
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
            ],
          ),

          /*
        child: Column(
          children: [
            const Text("Hauptseite"),
            FilledButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.screenDetail),
              child: const Text('Zu Detailseite'),
            ),
          ],
        ),
*/
        ),
      ),
    );
  }
}
