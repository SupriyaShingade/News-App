
import 'package:flutter/material.dart';
import 'package:news_app/screens/for_you_screen.dart';
import 'package:news_app/screens/home_tabbar.dart';
import 'package:news_app/screens/select_category.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              GestureDetector(
                child: Icon(Icons.density_medium_outlined),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCategory()));
                },
                ),
              Text('Home', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
              Icon(Icons.search, size: 30,),
              ],
            ),
             
          ],
        ),
      ),
      
      body: 
      
      DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'For You'),
                ],
                //  indicator: UnderlineTabIndicator(
                // borderSide: BorderSide(width: 4.0, color: Color(0xFF152b78)),
                // insets: EdgeInsets.symmetric(horizontal: 16.0),
                // ),
                indicatorColor: Color(0xFFD4C00B),
                labelColor: Color(0xFFD4C00B),
                unselectedLabelColor: Colors.black, 
              ),
            
            Expanded(
              child: TabBarView(
              children: [
                HomePage(),
                ForYouScreen(),
              ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}