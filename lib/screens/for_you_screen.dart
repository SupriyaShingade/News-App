
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/provider/newsProvider.dart';

import 'dart:convert';

import 'package:provider/provider.dart';




class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  Future<void> fetchArticles(
    
   ) async {
    // isLoading = true;
    // notifyListeners();

    final response = await http.get(Uri.parse('http://10.0.2.2:3000/articles'));
      print(response.statusCode);
      print(response.body);


    if (response.statusCode == 200) {
      List data = json.decode(response.body);
               Provider.of<NewsProvider>(context, listen: false).setArticles(data);

 

    }

        

      
  }
   @override
  void initState() {
    super.initState();
    fetchArticles();
  }
  @override
  Widget build(BuildContext contex) {
        List filteredArticles = Provider.of<NewsProvider>(context).filteredArticles;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: filteredArticles.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                
                  itemCount: filteredArticles.length,
                  itemBuilder: (context, index) {
                  
                    // Article article = snapshot.data![index];
                    // var imageUrl = article['imageUrl'];
                    return
                    //  GestureDetector(
                    //   onTap: (){
                    //     Navigator.push(
                    //       context, MaterialPageRoute(
                    //         builder: (context) => NewsDetailScreen(article: article)));
                    //   },
                      // child:
                       Card(
                        color: Colors.white,
                        child: ListTile(
                           
                           leading: Image.network(
                            filteredArticles[index]['image'],
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          title: Text(filteredArticles[index]['title']),
                          subtitle: Text(filteredArticles[index]['category']),
                        ),
                      );
                    // );
                  },
                ),
        ),
      )
    );
  }
}


