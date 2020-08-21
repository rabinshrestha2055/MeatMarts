import 'package:flutter/material.dart';
import 'package:masu_bazar/model/delete.dart';
import 'package:masu_bazar/model/http_model.dart';
import 'package:masu_bazar/model/khasi_model.dart';
import 'package:masu_bazar/pages/screens/appbar.dart';
import 'package:masu_bazar/pages/screens/form_screen.dart';
import 'package:masu_bazar/pages/screens/logout.dart';
import 'package:masu_bazar/pages/screens/profile.dart';
//import 'package:masu_bazar/pages/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileList extends StatefulWidget {
  final title;
     
   ProfileList({Key key, this.title}) : super(key: key);
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  void initState() { 
    super.initState();
    getShareRef();
  }
   String value1;
   
      getShareRef() async{
     final prefsId=await SharedPreferences.getInstance();
    
     final key1='userID';
     final value=prefsId.get(key1)??0;
     setState(() {
       value1=value;
      
     });

  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       appBar:appBar("Profile"),
      body:ListView(
            
            children: [
      
      ProfilePage(),
      SizedBox(height: 10,),
      Container(
         margin: EdgeInsets.only(left: 3.0,right: 3.0,top:0),  
       decoration: BoxDecoration(
      borderRadius:BorderRadius.only(
           bottomLeft: Radius.circular(13),
           bottomRight: Radius.circular(13),
         ),
             border: Border.all(color: Colors.black26),
      color: Colors.white,
      boxShadow: [
             BoxShadow(
       color: Colors.grey,
            offset: Offset(0.0,0.0),
      )
             ]
             ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 Padding(
                padding:  EdgeInsets.only(left: 10.0,top: 5.0),
      child: Text('Advertisement :',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
            ),
          Divider(color: Colors.black26,thickness: 2.0,),
              FutureBuilder (
         future:getSinglePosts(),
          builder: (context,snapshot){
      if(snapshot.hasError)
      {
                return Center(
        child: Text(snapshot.error.toString()),
                );
      }else if(snapshot.connectionState==ConnectionState.done) {
                var response=snapshot.data as List<KhasiModel>;
                
                return ListView.builder  (
           shrinkWrap: true,
           itemCount: response.length,
             itemBuilder: (context,index){
                 print(value1==response[index].userId);
                 return GestureDetector(
             onTap: (){
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => Forms(
           id: response[index].id,
           title: response[index].title,
           shortDescription: response[index].shortDescription,
           estimatedWeight: response[index].estimatedWeight,
           price: response[index].price,
           color: response[index].color,
           daat: response[index].daat,
           ownerName: response[index].ownerName,
           address: response[index].address,
           primaryContactNo: response[index].primaryContactNo,
           secondaryContactNo: response[index].secondaryContactNo,
           age: response[index].age,
           khasiImage: response[index].khasiImage,
       ),));
             },
             child: Dismissible(
       key: ValueKey(response[index].id),
       direction: DismissDirection.startToEnd,
      onDismissed: (direction){

      },
      confirmDismiss: (direction)async{
       final result= await showDialog(
            context: context,
            builder: (_)=>Delete(),
            
            );
            if(result){
            await deletePost(response[index].id);
                
            }
                   return result; 
      },
      
      background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left:16),
                child: Align(child: Icon(Icons.delete,color: Colors.white,),alignment: Alignment.centerLeft,),
      ),
       child: Stack( 
           children: <Widget>[
                // box height,width,margin and decoration
            Container(
            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
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
           Text(response[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0),),
           Divider(thickness: 2.0,color: Colors.black26,),
           //description
           Text(
             response[index].shortDescription,
             style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
             ),
           Row(
             children:<Widget>[
      //weight
      Text("Weight : "+response[index].estimatedWeight.toString()+" kg", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
      SizedBox(width: 25,),
      Icon(Icons.location_on,size: 14.0,color: Theme.of(context).primaryColor,),
       SizedBox(width: 5,),
       //location
      Text(response[index].address,maxLines: 1,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0),),
            

             ],
             ),
             //name
             Text(response[index].ownerName, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
             SizedBox(height: 1.0,),
      Row(
             children:<Widget>[
      //date
      Text(response[index].date.toString().split(" ")[0], style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
      SizedBox(width: 80,),
      //price
      Text("Rs."+response[index].price.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
            

             ],
             ),
             
       ],
       ),
            ),
                ),
        Positioned(
          left: 10.0,
          top: 28.0,
          bottom: 0.0,
      child: Image(width: 100,height: 10, 
      image:AssetImage ('assets/khasi_list/khasi3.jpeg'),fit: BoxFit.contain,
      ),
        ),
          ],
          
        ),
             ),
                   );
                // ],
       //),
          // ),
        
        }
        );
      }else{
                return Center(child: CircularProgressIndicator(),);
      }
      
          },
          ),
            ],
          ),
      ),
            ],
          ),
    );
  }
}
