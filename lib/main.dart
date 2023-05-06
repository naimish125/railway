import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Railway/Provider/Railway_provider.dart';
import 'Railway/view/Railway_view.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => RailwayProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => RailwayScreen(),
            },
          ),
          ),
  );
}