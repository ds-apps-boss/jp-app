import 'package:flutter/material.dart';
import 'dart:ui';



class Routes {
  static const screenStart = '/';
  static const screenMain = '/screenMain';
  static const screenDetail = '/screenDetail';
}


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

   
  @override
  Widget build (BuildContext context) {
    return MaterialApp (
      initialRoute: Routes.screenStart,
    
    
    routes: {
      Routes.screenStart: (_) => const ScreenStart(),
      Routes.screenMain: (_) => const ScreenMain(),
      Routes.screenDetail: (_) => const ScreenDetail(),
    }
    ); 
  }
  
}



class ScreenStart extends StatelessWidget {
  const ScreenStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // если AppBar не нужен — можно убрать и оставить только body
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/bg_startscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),                
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Card(
                      color: Colors.black.withValues(alpha: 0.55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Title",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "oih oih ouh ouih oij pijrvfopo3irfjo3pifj po3roifj 3pr4ofj34pfo 3pfoj3f p3jf p2 fp3rfj poij r34fgpoi34j fp3fj 34pof3 f",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),

                            Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xfff075d5), Color(0xfff59dbe)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),                                 
                                ),
                                child:FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.circular(10),
                                    ),
                                  ),                              
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.screenMain);
                              },
                                
                              child: const Text('Zu Hauptseite'),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgrounds/bg_mainscreen.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(child: Column(
        children: [

            Text("Hauptseite"),


            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.screenDetail);
              },
              child: const Text('Zu Detailseite'),

            ),
          ],
      )),
    );
  }
}



class ScreenDetail extends StatelessWidget {
  const ScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [

            Text("Einzelansicht"),


            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.screenStart);
              },
              child: const Text('zu Startseite'),
              
            ),
          ],
        )
        
        
      ),
      
      
    );
  }
}
