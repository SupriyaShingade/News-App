import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:news_app/screens/news_screen.dart';
 import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  NewsDetailScreen({required this.article});

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Remove HTML tags from the content
    var document = parse(article.description);
    String parsedContent = parse(document.body?.text ?? "").documentElement?.text ?? "";

    return Scaffold(
      appBar: AppBar( iconTheme: IconThemeData(color: Colors.black),
        title: Text(article.title, style: TextStyle(
          fontWeight: FontWeight.bold, 
        fontSize: 25 , color: Colors.black),),
        backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(article.image, 
              height: 300, 
              width: double.infinity, 
              fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                article.title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(parsedContent),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // launchURL(article.);
                },
                child: Text('Read More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}