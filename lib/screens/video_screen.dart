
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        // leading: Icon(Icons.arrow_back_ios_new_sharp),
        title: Text('Videos', style: TextStyle(color: Colors.black, fontSize: 30),),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Video Screen'),
      ),
    );
  }
}