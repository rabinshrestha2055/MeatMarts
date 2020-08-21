import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';
class Details extends StatefulWidget {
  final title_details;
  final description_details;
  final image_details;
  final name_details;
  final price_details;
  final location_details;
  final weight_details;
  final date_details;
  final age_details;
  final pnumber_details;
  final snumber_details;
  final color_details;
  final daat_details;


   Details({Key key, this.title_details, this.description_details, this.image_details, this.name_details, this.price_details, this.location_details, this.weight_details, this.date_details, this.age_details,  this.pnumber_details, this.snumber_details, this.color_details, this.daat_details}) : super(key: key);
  
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title_details),
      body: ListView(
        children: <Widget>[
           Padding(
             padding: EdgeInsets.only(left:8.0,right:8.0 ),
             child: Card(
               borderOnForeground: true,
               elevation: 5.0,
               clipBehavior: Clip.antiAlias,
               child: Image(image: AssetImage(widget.image_details),alignment: Alignment.topCenter,width: 300,height: 250,fit: BoxFit.contain,)),
           ),
             
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   padding: EdgeInsets.only(top: 13.0,left: 40.0),
                   height: 50,
                   width: 150.5,
                   child: Text('Weight = '+widget.weight_details.toString()+" kg",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                   margin: EdgeInsets.only(left: 5.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0) ,bottomLeft: Radius.circular(10.0)),
                     border: Border.all(color: Colors.black26),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black26,
                         offset: Offset(0.0,2.0),
                       )
                     ]
                   ),
                  
                   
                 ),
              Container(
               padding: EdgeInsets.only(top: 13.0,left: 45.0),
                 margin: EdgeInsets.only(right: 5.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(topRight:Radius.circular(10.0) ,bottomRight: Radius.circular(10.0)),
                     border: Border.all(color: Colors.black26),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black26,
                         offset: Offset(0.0,2.0),
                       )
                     ]
                   ),
                   height: 50,
                   width: 150.5,
                   child: Text('Rs.'+widget.price_details.toString(),style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                 ),
               ],
             ),
             Container(
                margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),  
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 border: Border.all(color: Colors.black26),
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black26,
                     offset: Offset(0.0,1.0),
                   )
                 ]
               ),
                
               width: MediaQuery.of(context).size.height,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                   Padding(
                     padding:  EdgeInsets.only(left: 8.0,top: 8.0),
                     child: Text('Description :',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                   ),
                   Divider(color: Colors.black26,thickness: 2,),
                   Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text(widget.description_details,style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                   SizedBox(height: 5.0,)
                 ],
               ),
             ),
              Container(
                margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),  
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 border: Border.all(color: Colors.black26),
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black26,
                     offset: Offset(0.0,2.0),
                   )
                 ]
               ),
                
               width: MediaQuery.of(context).size.height,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                   Padding(
                     padding:  EdgeInsets.only(left: 8.0,top: 8.0),
                     child: Text('Seller Information :',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                   ),
                   Divider(color: Colors.black26,thickness: 2.0,),
                   Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Seller Name : "+widget.name_details,style: TextStyle(fontWeight: FontWeight.w500),),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Address : "+widget.location_details,style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Date : "+widget.date_details.toString().split(" ")[0],style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                        Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Color : "+widget.color_details,style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                        Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: widget.daat_details==null?Container(): Text("Satiyako_Daat : "+widget.daat_details.toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child:widget.age_details==null?Container(): Text("Age : "+widget.age_details.toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Primary_Number : "+widget.pnumber_details.toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                     Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Secondary_Number : "+widget.snumber_details.toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                   SizedBox(height: 5.0,)
                 ],
               ),
             ),
            
      ],
      ),
      
    );
  }
}
