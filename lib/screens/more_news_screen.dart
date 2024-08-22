import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:http/http.dart' as http;



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









class MoreNewsScreen extends StatefulWidget {
  const MoreNewsScreen({super.key});

  @override
  State<MoreNewsScreen> createState() => _MoreNewsScreenState();
}

class _MoreNewsScreenState extends State<MoreNewsScreen> {


  
  late  Future<List<Article>> listOfArticle ;
  //  late   List<Article> listOfArticleForDisplay ;
   


   
  @override
  void initState() {
    super.initState();
 
    // print(widget.category);
    listOfArticle = fetchArticles();
    

    
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Posts', style: TextStyle(color: Colors.black, fontSize: 30),),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Article>>(
              future: listOfArticle,
              builder: (context, snapshot) {
      
                if (snapshot.hasData) {
                   return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Article article = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    width: 120,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(article.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title,
                                        style: TextStyle(
                                          // overflow: TextOverflow.ellipsis,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
      
                                        article.description,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 14.0,
                                          color: Colors.grey[600],
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                );
              },
            );
            } else {
               
                        return Center(child: CircularProgressIndicator());
                      }
          }
          
      ),               
    );
  }
}