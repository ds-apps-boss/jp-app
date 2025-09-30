import 'package:flutter/material.dart';
import 'package:jp_app/app_routes.dart';

class ScreenDetail extends StatelessWidget {
  const ScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Einzelansicht"),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, Routes.screenStart),
              child: const Text('zu Startseite'),
            ),
          ],
        ),
      ),
    );
  }
}
