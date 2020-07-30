import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/logout.dart';
import 'form_field.dart';
class Forms extends StatelessWidget {
    final String id;
    final String title;
    final String category;
    final String shortDescription;
    final int estimatedWeight;
    final int price;
    final String color;
    final int daat;
    final String ownerName;
    final String address;
    final int primaryContactNo;
    final int secondaryContactNo;
    final int age;
    final String khasiImage;

  const Forms({Key key, this.id,  this.title, this.category, this.shortDescription, this.estimatedWeight, this.price, this.color, this.daat, this.ownerName, this.address, this.primaryContactNo, this.secondaryContactNo, this.age, this.khasiImage}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar:AppBar(
            backgroundColor: Colors.orange,
            elevation: 0.0,
            title: Text("Form",style: TextStyle(color: Colors.black87),),
             actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.black54,),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Logout(),
          ),
          
        ],
          ),
         body: SafeArea(
           child: FormFields(
             id: id,
             title: title,
             shortDescription: shortDescription,
             estimatedWeight: estimatedWeight,
             price: price,
             color: color,
             daat: daat,
             ownerName: ownerName,
             address: address,
             primaryContactNo: primaryContactNo,
             secondaryContactNo: secondaryContactNo,
             age: age,
             khasiImage: khasiImage,

           ),
           ),
         ),
    );
  }
}