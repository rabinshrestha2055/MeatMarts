import 'package:flutter/material.dart';
import 'package:masu_bazar/widget/anya_tab_list.dart';
import 'package:masu_bazar/widget/bird_tab_list.dart';

import 'package:masu_bazar/widget/khasi_tab_list.dart';
import 'package:masu_bazar/widget/kukhura_tab_list.dart';
import 'package:masu_bazar/widget/raga_tab_list.dart';
import 'package:masu_bazar/widget/vakal_tab_list.dart';
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _currentChild=0;
   List<Widget>  tabs=[
            KhasiTabList(title:'खसीको प्रजाति' ,),
            RagaTabList(title: 'राँगाको प्रजाति',),
            KukhuraTabList(title: 'कुखुराको प्रजाति',),
            BirdTabList(title: 'चराको प्रजाति',),
            VakalTabList(title: 'भाकलको प्रजाति',),
            AnyaTabList(title: 'अन्य प्रजाति',),
           
  ];
  var product_list=[
        {
          "image":"assets/category_list/boka.png",
          "text":"खसी/बाख्रो",
          "title_text":"खसीको प्रजाति"
        },
          {
          "image":"assets/category_list/mura.png",
          "text":"भैंसी/रांगो",
          "title_text":"राँगाको प्रजाति"
        },
          {
          "image":"assets/category_list/chicken.png",
          "text":"कुखुरा",
          "title_text":"कुखुराको प्रजाति"
        },
          {
          "image":"assets/category_list/suga.png",
          "text":"चराहरु",
          "title_text":"चराको प्रजाति"
        },
          {
          "image":"assets/category_list/pboka.png",
          "text":"भाकल/ पुजा",
          "title_text":"भाकलको प्रजाति"
        },
          {
          "image":"assets/category_list/anya.jpg",
          "text":"अन्य",
          "title_text":"अन्य प्रजाति"
        },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GridView.builder(
        itemCount: product_list.length,
        semanticChildCount: _currentChild,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.3),
          itemBuilder: (context,int index){
            
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentChild=index;
                  if(_currentChild==index)
                {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>tabs[index]));
                }
                });
              },
                          child: CategoryNameList(
                  
                  cat_image: product_list[index]["image"],
                  cat_title: product_list[index]["text"],
                  cat_text_title: product_list[index]["title_text"],
                ),
            );
            
          },

      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.orange,
       child: Icon(Icons.search,color: Colors.white,),
       onPressed: () {},
     ),
    );
  }
}

class CategoryNameList extends StatelessWidget {
  final cat_image;
  final cat_title;
  final cat_text_title;
  const CategoryNameList({
    Key key, this.cat_image, this.cat_title, this.cat_text_title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       
       
        child: Stack(
    children: <Widget>[
      Positioned(
            top: 35.0,
           child: Container(
             margin: EdgeInsets.only(left:10,right: 10),
            height: 90,
            width: 160,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0),
          border:Border.all(color: Colors.black26,style: BorderStyle.solid),
           boxShadow: [
            BoxShadow(
               color: Colors.black26,
               offset: Offset(2.0,5.0)
            ),
           ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,//vertical alignment
           crossAxisAlignment: CrossAxisAlignment.center,//horizontal alignment
            children: <Widget>[
            Text(cat_title,textAlign: TextAlign.center,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w100,fontSize: 20),),
          ],),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left:10,right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border:Border.all(color: Colors.black26,style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
               color: Colors.black26,
               offset: Offset(2.0,3.0)
            ),
          ]
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image(
              width: 160,
              height: 90,
              image:AssetImage(cat_image),
              ),
           
          ],
        ),
      ),
        
    ],
        ),
        
      );
  }
}