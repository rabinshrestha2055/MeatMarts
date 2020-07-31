import 'package:flutter/material.dart';
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
  final number_details;

  const Details({Key key, this.title_details, this.description_details, this.image_details, this.name_details, this.price_details, this.location_details, this.weight_details, this.date_details, this.age_details, this.number_details}) : super(key: key);
  
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     elevation: 1.0,
     backgroundColor: Colors.orange,
        title: Text(widget.title_details,style: TextStyle(color: Colors.black87),),
           actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.black54,),),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.orange,
              child: Image( image: AssetImage('assets/images/logo1.png'),fit: BoxFit.fill,)),
          ),
           ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Container(
            margin: EdgeInsets.only(left:6.0),
           height: MediaQuery.of(context).size.width*0.5,
          
           child: Card(
             borderOnForeground: true,
             elevation: 1.0,
             clipBehavior: Clip.antiAlias,
             child: Image(image: AssetImage(widget.image_details),alignment: Alignment.topCenter,)),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   padding: EdgeInsets.only(top: 13.0,left: 45.0),
                   height: 50,
                   width: 150.5,
                   child: Text('Weight = '+widget.weight_details,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
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
                   child: Text('Rs.'+widget.price_details,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
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
                     child: Text('Description :',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                   ),
                   Divider(color: Colors.black,thickness: 2.0,),
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
                   Divider(color: Colors.black,thickness: 2.0,),
                   Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Seller Name : "+widget.name_details,style: TextStyle(fontWeight: FontWeight.w500),),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Location : "+widget.location_details,style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Date : "+widget.date_details,style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Age : "+widget.age_details,style: TextStyle(fontWeight: FontWeight.w500)),
                   ),
                      Padding(
                     padding:  EdgeInsets.only(left:8.0,right: 5.0),
                     child: Text("Number : "+widget.name_details,style: TextStyle(fontWeight: FontWeight.w500)),
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
