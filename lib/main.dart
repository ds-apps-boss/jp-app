import 'package:flutter/material.dart';



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
      
      body: SafeArea(
        child: Column(
          children: [

            Text("Startseite"),


            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.screenMain);
              },
              child: const Text('Zu Hauptseite'),

            ),
          ],
        )
        
        
      ),
      
      //("Screen 1"),
    );
  }
}


class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [

            Text("Hauptseite"),


            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.screenDetail);
              },
              child: const Text('Zu Detailseite'),
              
            ),
          ],
        )
        
        
      ),
      
      
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
