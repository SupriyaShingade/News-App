
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news_app/screens/more_news_screen.dart';
import 'package:news_app/screens/news_detail_screen.dart';
import 'package:news_app/screens/news_screen.dart';





// class NewsArticle {
//   final String title;
//   final String subtitle;
//   final String imageUrl;

//   NewsArticle({required this.title, required this.subtitle, required this.imageUrl});
// }


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



class HomePage extends StatefulWidget {
  late final String category;
  

  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  

  // late  Future<List<NewsArticle>> listOfArticle ;
  // @override
  // void initState() {
  //   super.initState();
  //   listOfArticle = fetchArticles();

    
  // }
  // final List<NewsArticle> articles = List.generate(
  //   10,
  //   (index) => NewsArticle(
  //     title: 'Simply looking at greenery can boost mental health',
  //     subtitle: 'Todays update',
  //     imageUrl: 'https://picsum.photos/200/300?random=$index',
  //   ),
  // );




  final List<Map<String,String>> spotlight = [
    {"name": "Cyber security news", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVUvJUm_2VzyEd3bhQRWGIDeVhTBycQ75a3Q&s"},
    {"name": "Artificial intelligence", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5xJibZR1Y4UA4YSEr0dOgcq0khDjz8sHYLQ&s"},
    {"name": "Business case study", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9BVMrYu1oYL6a-AhhTbumPKviL-qj2NnBXQ&s"},
    {"name": "Cyber crime news", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0utGCLFhcUBgdQTdKoatNzdcCf3h6754qzw&s"},
    {"name": "Tutorials", "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZVk9qEpgmbJ2yLs219V8taI8YKJBtyAqLCw&s"},
    // {"name": "Science", "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2m4WMsvpR6I9JZdbupjQ_zcnNGhlT_WqLww&s"},
    // {"name": "Culture", "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHz0JfLKyAitYA7xoI27rw7UWWPCsnf4sPig&s"},
    // {"name": "Environment", "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTlbNHX3a78W7NrPo68KGsfLCCmthSWfd4jw&s"},
    // {"name": "Travel", "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6hBc1SbaVT4AXkp3ujX9NyecFpHV6G1QB3A&s"},
    // {"name": "Sports", "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtttquX4CEkqQSCmxYzo2aEBPLoqDoYmYkyg&s"},
    // {"name": "Entertainment", "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScmjDxPuNUYOFyeU0QD8gC56duHbh0xHRJtA&s"},


    

  ];

  // final List<String> spotlightTexts = [
  //   'Keep your Kidneys Healthy',
  //   'Exhibition photographer marc Holm',
  //   "Boeing's Crewed Starliner Launch",
  //   'Solar Storms hit tech equipments',
  //   'The Click crafts new Logo',
  //   'How to add a video to a WordPress',
  //   'This Game Changing Design Tool'
  // ];

  final List<String> timelineTexts = [
    "Cyber security news",
    "Artificial intelligence",
    "Business case study",
    "Cyber crime news",
    "Tutorials",



    
  ];

  // final List<String> _sectionTexts = [
  //   'Section 1',
  //   'Section 2',
  //   'Section 3',
  // ];




  late  Future<List<Article>> listOfArticle ;
  //  late   List<Article> listOfArticleForDisplay ;
   


   
  @override
  void initState() {
    super.initState();
 
    // print(widget.category);
    listOfArticle = fetchArticles();
    

    
  }
 












  //  final List<Map<String, String>> newsItems = List.generate(
  @override
  Widget build(BuildContext context) {
    // var listOfArticle;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   leading: Icon(Icons.density_medium_outlined),
      //   title: Text('Home', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: Icon(Icons.search, size: 30,),
      //     )
      //   ],
      //   ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text('Spotlight Posts', style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold
                ),),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoreNewsScreen()));
                    print('More button clicked');
                  },
                  child: Text(
                    'More',
                    style: TextStyle(
                    color: Color(0xFFD4C00B),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              ],
            ),
            SizedBox(height: 10,),
        
            
            FutureBuilder(  
              future: listOfArticle,
                       builder: (context, snapshot) {
               
                         if (snapshot.hasData) {



              return Container(
                
                      height: 250.0,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        padEnds: false,
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          // final imageUrl = snapshot.data!.image ?? '';
                          // final timelineTexts = item["text"] ?? '';
                          final text = snapshot.data![index % snapshot.data!.length];
                          
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child:GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetailScreen(article: snapshot.data![index] ),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      
                                      snapshot.data![index].image,
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Center(child: Text('Image not available'));
                                      },
                                    ),
                                  ),
                                ),
                                 Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data![index].title,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   snapshot.data![index].category
                                      // ),

                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1), // Adjust padding as needed
                                        decoration: BoxDecoration(
                                          color: Colors.orange[50], // Background color
                                          borderRadius: BorderRadius.circular(20), // Rounded corners
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26, // Shadow color
                                              // offset: Offset(2, 2), // Shadow position
                                              // blurRadius: 4, // Shadow blur
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          snapshot.data![index].category,
                                          style: TextStyle(
                                            color: Color(0xFFD4C00B), // Text color
                                          ),
                                        ),
                                        
                                      ),
                                      Text(snapshot.data![index].date, style: TextStyle(fontSize: 12,color: Colors.grey),)
                                    ],
                                  ),
                                
                              ],
                            ),
                          );
                          
                        },
                      ),
              );
                         }
             else {
               
                        return Center(child: CircularProgressIndicator());
                      }
                       }),
                    
                  SizedBox(height: 20,),
                  Text('Section', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        
        
        
        
        
        
        
        
        
        
        
           
            SizedBox(height: 10),
            Container(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            padEnds: false,
            controller: PageController(
              viewportFraction: 0.7
            ),
            itemCount: spotlight.length,
            itemBuilder: (context, index) {
              final item = spotlight[index];
              final imageUrl = item["image"] ?? '';
              final imageText = timelineTexts[index % timelineTexts.length];
              
              return Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: GestureDetector(
                        onTap: ()
                        {
                          Navigator.push(
                            context,MaterialPageRoute
                            ( 
                              builder: (context) => NewsScreen(category: spotlight[index]["name"]!),
                            ),
                          );
                        },
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(child: Text('Image not available'));
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8.0, 
                    left: 20.0, 
                    // right: 16.0,
                    child: 
                        Text(
                          imageText,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      // ),
                    // ),
                  ),
                ],
              );
            },
          ),
        ),
        
        
        
            
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Latest Posts', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20
                ),),
                GestureDetector(
                   onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoreNewsScreen()));
                    print('More button clicked');
                  },
                  child: Text(
                    'More',
                    style: TextStyle(
                    color: Color(0xFFD4C00B),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              ],
            ),
            






             Expanded(
               child: FutureBuilder<List<Article>>(
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
                  height: 120,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(article: article)));
                        },
                        child: Card(
                          
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 150,
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
                              SizedBox(height: 6),
                              Text(

                                article.description,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
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
               
                         },
                         ),
             )

          ],
        ),
      ),
    );
  }
}

// class Article {
//   final String image;
//   final String title;
//   final String description;
//   final String date;
//   final String category;

//   Article({
//     required this.image,
//     required this.title,
//     required this.description,
//     required this.date,
//     required this.category,
//   });
// }