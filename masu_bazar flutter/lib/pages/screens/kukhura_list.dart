import 'package:flutter/material.dart';
import 'package:masu_bazar/pages/screens/khasi_details.dart';
class KukhuraList extends StatefulWidget {
  final title;
     
   KukhuraList({Key key, this.title}) : super(key: key);
  @override
  _KukhuraListState createState() => _KukhuraListState();
}

class _KukhuraListState extends State<KukhuraList> {
   var khasi_list=[
        {
          "image":"assets/khasi_list/hen1.jpg",
          "description":"Bara ko pure local kukhura bikrimaa cha kinna icukharuly samparka rakhunu hola chado vanda chado...",
          "title_text":"Kukhura on sale",
          "weight":"3",
          "name":"Ashish Dahal",
           "price":"1900",
           "location":"simara,bara",
           "color":"red",
           "number":"9807150500",
           "snumber":"9813209014",
           "date":"2020-07-27"
        },
          {
          "image":"assets/khasi_list/hen3.jpg",
          "description":"Sarlahi ko pure local kukhura bikrimaa cha kinna icukharuly samparka rakhunu hola chado vanda chado...",
          "title_text":"Kukhura on sale",
          "weight":"3",
          "name":"Gagan puri",
           "price":"1500",
           "location":"lalbandi,sarlahi",
            "age":"2",
           "number":"9807150500",
           "snumber":"9813209014",
           "date":"2020-07-27"
        },
          {
         "image":"assets/khasi_list/hen4.jpeg",
          "description":"Kathmandu ko pure local kukhura bikrimaa cha kinna icukharuly samparka rakhunu hola chado vanda chado...",
          "title_text":"Kukhura on sale",
          "weight":"4",
          "name":"Nishan upreti",
          "date":"2076/5/17",
           "price":"2000",
           "location":"Balaju,Ktm",
          "age":"2",
           "number":"9807150500",
           "snumber":"9813209014",
          
        },
          {
           "image":"assets/khasi_list/hen5.jpg",
          "description":"Nakhu ko pure local kukhura bikrimaa cha kinna icukharuly samparka rakhunu hola chado vanda chado...",
          "title_text":"Kukhura on sale",
          "weight":"4",
          "name":"Manish Regmi",
           "price":"5000",
           "location":"nakhu,lalitpur",
            "age":"2",
           "number":"9807150500",
           "snumber":"9813209014",
           "date":"2020-07-27"
        },
         
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: khasi_list.length,
        itemBuilder: (BuildContext context ,int index){
          return ListViewItem(
            list_image: khasi_list[index]["image"],
            list_description: khasi_list[index]["description"],
            list_title_text: khasi_list[index]["title_text"],
            list_weight: khasi_list[index]["weight"],
            list_name: khasi_list[index]["name"],
            list_date: khasi_list[index]["date"],
            list_price: khasi_list[index]["price"],
            list_location: khasi_list[index]["location"],
            list_age: khasi_list[index]["age"],
            list_number: khasi_list[index]["number"],
          );
        },
      )
    );
  }
}
class ListViewItem extends StatefulWidget {
  final list_image;
  final list_description;
  final list_title_text;
  final list_weight;
  final list_name;
  final list_date;
  final list_price;
  final list_location;
  final list_age;
  final list_number;
  final list_snumber;


  
  ListViewItem({Key key, this.list_image, this.list_description, this.list_title_text, this.list_weight, this.list_name, this.list_date, this.list_price, this.list_location, this.list_age, this.list_number,this.list_snumber}) : super(key: key);
  @override
  _ListViewItemState createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(
            title_details: widget.list_title_text,
            image_details: widget.list_image,
            weight_details: widget.list_weight,
            price_details: widget.list_price,
            description_details: widget.list_description,
            name_details: widget.list_name,
            daat_details: null,
            color_details: "red",
            location_details: widget.list_location,
            date_details: widget.list_date,
            age_details: widget.list_age,
            pnumber_details: widget.list_number,
            snumber_details: widget.list_snumber,
          ),));
        });
      },
          child: Stack( 

        children: <Widget>[
          // box height,width,margin and decoration
         
          Container(
        
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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
                  SizedBox(height: 25,),
                  //Title text
                Text(widget.list_title_text+" :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,),),
                Divider(thickness: 2.0,color: Colors.black26,),
                //description
                Text(
                  widget.list_description,
                  style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  ),
                Row(
                  children:<Widget>[
                    //weight
                    Text("Weight: "+widget.list_weight, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.0),),
                    SizedBox(width: 25,),
                    Icon(Icons.location_on,size: 14.0,color: Theme.of(context).primaryColor,),
                     SizedBox(width: 5,),
                    Text(widget.list_location,maxLines: 1,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0),),
                 

                  ],
                  ),
                  Text(widget.list_name, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                  SizedBox(height: 1.0,),
                    Row(
                  children:<Widget>[
                    Text(widget.list_date, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                    SizedBox(width: 80,),
                    Text("Rs."+widget.list_price, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                 

                  ],
                  ),
              ],
              ),
            ),
          ),
          Positioned(
            left: 15.0,
            top: 8.0,
            bottom: 8.0,
                    child: Image(width: 100, 
                    image: AssetImage(widget.list_image,),fit: BoxFit.fitWidth,
                    ),
          ),
        ],
      ),
    );
  }
}