import 'package:flutter/material.dart';
import 'news_screen.dart';

class NewsCategoryScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        title: Text('Categories', 
        style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30 , color: Colors.black),), 
          backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsScreen(category: categories[index]["name"]!),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Stack(
                  children: [ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(categories[index]["image"]!), fit: BoxFit.cover,

                      ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categories[index]["name"]!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
