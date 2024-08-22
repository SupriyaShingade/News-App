
import 'package:flutter/material.dart';
import 'package:news_app/provider/newsProvider.dart';
import 'package:news_app/screens/contact_us_screen.dart';
import 'package:provider/provider.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {



  List<String> categories = [
   "Cyber security news",
    "Artificial intelligence",
    "Business case study",
    "Cyber crime news",
    "Tutorials",
  ];

  // List<String> selectedCategories = [];












  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
        centerTitle: true,
        title: Text('Categories You Follow', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child:
              
              
              
               Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: 
                
                
                categories.map((category) {
                   return Consumer<NewsProvider>(
                  
                  builder: (context, newsProvider, child) {
                                  final isSelected = newsProvider.selectedCategory.contains(category);

                                  return GestureDetector(
                                    onTap: () {
                    newsProvider.selectCategory(category);
                  },
                                    child: Container(
                                                          padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                                                          decoration: BoxDecoration(
                                                            color: isSelected ? Color(0xFFD4C00B): Colors.transparent,
                                                            borderRadius: BorderRadius.circular(20.0),
                                                            border: Border.all(color: Colors.grey),
                                                          ),
                                                          child: Text(
                                                            category ,
                                                            style: TextStyle(
                                                              color: isSelected ? Colors.white : Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          )
                                    ),
                                  );
                                


                  }
                );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                print('Categories You Follow:  ');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD4C00B),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Save', style: TextStyle(fontSize: 18, color: Colors.white)),
              
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
              },
              child: Text('Contact Us', style: TextStyle(),)),
          ],
        ),
      ),
    );
  }
}



class CategoryTile extends StatelessWidget {
  final String category;
  final bool isSelected;
  final Function(bool) onSelected;

  CategoryTile({required this.category, required this.isSelected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category),
      trailing: Checkbox(
        value: isSelected,
        onChanged: (bool? value) {
          if (value != null) {
            onSelected(value);
          }
        },
      ),
    );
  }
}