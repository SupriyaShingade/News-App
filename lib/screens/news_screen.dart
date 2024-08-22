import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'news_detail_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



  Future<List<Article>> fetchArticles( ) async {
    // isLoading = true;
    // notifyListeners();

    final response = await http.get(Uri.parse('http://10.0.2.2:3000/articles'));
      print(response.statusCode);
      print(response.body);


    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return  data.map((item) => Article(
        category: item["category"],
        date: item["date"],
        description: item["description"],
        image: item["image"],
        title: item["title"],


        

      )).toList();
    } else {
      return [];
      // print('Failed to load articles');
    }

    // isLoading = false;
    // notifyListeners();
  }

class NewsScreen extends StatefulWidget {
  final String category;

  NewsScreen({required this.category});
 
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

   late  Future<List<Article>> listOfArticle ;
   late   List<Article> listOfArticleForDisplay ;
   


   
  @override
  void initState() {
    super.initState();
 
    print(widget.category);
    listOfArticle = fetchArticles().then((value) {
      listOfArticleForDisplay = value.where((article)=>article.category == widget.category ).toList() ;

          return listOfArticleForDisplay;
        },);
    

    
  }
 
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: true,

        title: Text(
          widget.category,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 , color: Colors.black),
        ),
      ),
      body:   FutureBuilder<List<Article>>(
        future: listOfArticle,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
               return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Article article = snapshot.data![index];
                    // Remove HTML tags from the content
                    var document = parse(article.description);
                    String parsedContent = parse(document.body?.text ?? "").documentElement?.text ?? "";
          
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(article: article),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            Container(
                              width: 130,
                              height: 160,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(article.image),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 10),
                            // Title and Subtitle
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    article.category,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        
        
      

                      
                    } else {

                      return Center(child: CircularProgressIndicator());
                    }



          
          
          
         }
      ));
    
}
}














class Article {
  final String image;
  final String title;
  final String description;
  final String date;
  final String category;

  Article({
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
  });
}
