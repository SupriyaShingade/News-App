
import 'package:flutter/material.dart';
import 'package:news_app/screens/favourite_screen.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/news_category_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/video_screen.dart';


class BNBarPage extends StatefulWidget {
  @override
  _BNBarPageState createState() => _BNBarPageState();
}

class _BNBarPageState extends State<BNBarPage> {
  int myIndex = 0;
  List widgetList = [
    Home(),
    NewsCategoryScreen(),
    VideoScreen(),
    FavouriteScreen(),
    SettingsScreen(),
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  widgetList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFD4C00B),
        unselectedItemColor: Colors.black,
        onTap: (index)
        {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
           
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), 
              label: 'Categories'
              
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back), 
              label: 'Videos'
              
            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.favorite), 
              label: 'Favourite'
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,), 
              label: 'Setting'
            ),
    
        ],
        
        ),
    );
  }
}