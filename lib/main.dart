import 'package:flutter/material.dart';
import 'package:news_app/provider/newsProvider.dart';
import 'package:news_app/screens/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

















void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        title: 'Daily News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BNBarPage()
        // NewsCategoryScreen(),
      ),
    );
  }
}








// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => NewsProvider()..fetchArticles(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: NewsScreen(),
//       ),
//     );
//   }
// }
