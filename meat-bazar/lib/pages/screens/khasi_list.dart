import 'dart:io';

import 'package:flutter/material.dart';
import 'package:masu_bazar/model/http_model.dart';
import 'package:masu_bazar/model/khasi_model.dart';
class KhasiList extends StatefulWidget {
  final title;
     
   KhasiList({Key key, this.title}) : super(key: key);
  @override
  _KhasiListState createState() => _KhasiListState();
}

class _KhasiListState extends State<KhasiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
              child: FutureBuilder(
          future:getPosts(),
          builder: (context,snapshot){
            if(snapshot.hasError)
            {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else if(snapshot.connectionState==ConnectionState.done){
              var response=snapshot.data as List<KhasiModel>;
              return ListView.builder(
                itemCount: response.length,
                itemBuilder: (context,index){
                  var listItem=response[index];
                  return listItem.category!='Khasi'?Center(child:null): Stack( 
                children: <Widget>[
              // box height,width,margin and decoration
              Container(
                margin: EdgeInsets.fromLTRB(12.0, 5.0, 10.0, 5.0),
                height: 145.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(1.0,2.0))],
                  borderRadius: BorderRadius.circular(5.0)
                ),
                // padding inside the box
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(110,0,20,20),
                  //All texts is here
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Title text
                      SizedBox(height: 25,),
                    Text(listItem.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0),),
                    Divider(thickness: 2.0,color: Colors.black26,),
                    //description
                    Text(
                      listItem.shortDescription,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      ),
                    Row(
                      children:<Widget>[
            //weight
            Text("Weight : "+listItem.estimatedWeight.toString()+" kg", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
            SizedBox(width: 25,),
            Icon(Icons.location_on,size: 14.0,color: Theme.of(context).primaryColor,),
             SizedBox(width: 5,),
             //location
            Text(listItem.address,maxLines: 1,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0),),
                     

                      ],
                      ),
                      //name
                      Text(listItem.ownerName, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                      SizedBox(height: 1.0,),
            Row(
                      children:<Widget>[
            //date
            Text(listItem.date.toString().split(" ")[0], style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
            SizedBox(width: 80,),
            //price
            Text("Rs."+listItem.price.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                     

                      ],
                      ),
                  ],
                  ),
                ),
              ),
            //   Positioned(
            //     left: 15.0,
            //     top: 8.0,
            //     bottom: 8.0,
            // child: Image.file(File(response[index].khasiImage)),
            //   ),
          ],
        );
                }
                );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
            
          },
          ),
      ),
    );
  }
}
