import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masu_bazar/model/dialog.dart';
import 'package:masu_bazar/model/error_dialog.dart';
import 'package:masu_bazar/model/http_model.dart';
import 'package:masu_bazar/model/khasi_model.dart';
class FormFields extends StatefulWidget {
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
  FormFields({Key key, this.id,  this.title, this.category, this.shortDescription, this.estimatedWeight, this.price, this.color, this.daat, this.ownerName, this.address, this.primaryContactNo, this.secondaryContactNo, this.age, this.khasiImage}) : super(key: key);
bool _isApiProcess=false;
  @override
  _FormFieldsState createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  @override
  void initState() {
    titleController.text=widget.title;
    descriptionController.text=widget.shortDescription;
    weightController.text=widget.estimatedWeight==null?"":  widget.estimatedWeight.toString();
    priceController.text=widget.price==null?"": widget.price.toString();
    colorController.text=widget.color;
    daatController.text=widget.daat==null?"": widget.daat.toString();
    nameController.text=widget.ownerName;
    addressController.text=widget.address;
    primaryContactController.text=widget.primaryContactNo==null? "": widget.primaryContactNo.toString();
    secondaryContactController.text=widget.secondaryContactNo==null?"": widget.secondaryContactNo.toString();
    ageController.text=widget.age==null?"": widget.age.toString();
  //  _image=widget.khasiImage as File;

    // TODO: implement initState
    super.initState();
  }
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
 final TextEditingController titleController=TextEditingController();
 final TextEditingController descriptionController=TextEditingController();
 final TextEditingController weightController=TextEditingController();
 final TextEditingController priceController=TextEditingController();
 final TextEditingController colorController=TextEditingController();
 final TextEditingController daatController=TextEditingController();
 final TextEditingController nameController=TextEditingController();
 final TextEditingController addressController=TextEditingController();
 final TextEditingController primaryContactController=TextEditingController();
 final TextEditingController secondaryContactController=TextEditingController();
 final TextEditingController ageController=TextEditingController();
 
   File _image;
  var _catrgory=['Select Category','Khasi','Boka','Raga','Kukhura','Birds','Vakal','Anya'];
  var _currentCategorySelected="Select Category";
    Widget _buildCategory(){
    return Container(
      width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
          color: Colors.white,
          border:Border.all(color: Colors.black38,style: BorderStyle.solid,width: 1.5),
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
               color: Colors.black38,
               offset: Offset(0.0,0.1)
            ),
          ]
        ),
      child: DropdownButton<String>(
        
          items: _catrgory.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                  
                );
          }).toList(),
          onChanged: (String newValueSelected){
            setState(() {
              this._currentCategorySelected=newValueSelected;
            });
          },
          
          value: _currentCategorySelected,
      ),
    );
  }
  Widget _Image(){
    return Image(
    image:_image!=null?FileImage(_image): AssetImage('assets/images/noimage.png',),width: 300,height: 200,
    );
  }
   void PickImage() async {
    // ignore: deprecated_member_use
    var image=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
    _image=image;
    });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
       child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
              child: Column(
           
               children: [
                 SizedBox(height: 10,),
                TextFormField(
                      controller:titleController ,
                      keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Icon(
                           Icons.title,
                           color: Colors.green,
                         ),
                         labelText: "Title",
                         helperText: "Title can't be empty",
                         hintText: "Title"
                       ),
                     validator: (String value){
                         if(value.isEmpty){
                           return 'Title is Required';
                              }
                     },
                   ),
                   SizedBox(height: 10,),
                   _buildCategory(),
                   SizedBox(height: 10,),
                     TextFormField(
                       controller: descriptionController,
                       keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Icon(
                           Icons.description,
                           color: Colors.green,
                         ),
                         labelText: "Short-Description",
                         helperText: "Short-Description can't be empty",
                         hintText: "Short-Description"
                       ),
                     validator: (String value){
                         if(value.isEmpty){
                           return 'Short_Description is Required';
                              }
                     },
                   ),
                   SizedBox(height: 10,),
                   _Image(),
                   SizedBox(height: 10,),
                   RaisedButton(
                    child: Text('CHOOSE IMAGE'),
                    onPressed: PickImage,
                   ),
                    SizedBox(height: 10,),
                     TextFormField(
                       controller: weightController,
                       keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Image(image: AssetImage('assets/images/weight.png'),color: Colors.green,),
                         labelText: "Weight",
                         helperText: "Weight can't be empty",
                         hintText: "Weight"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Weight is Required';
                              }
                     },
                   ),
                   SizedBox(height: 10,),
                     TextFormField(
                       controller: priceController,
                       keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Image(image: AssetImage('assets/images/price.png'),color: Colors.green,),
                         labelText: "Price",
                         helperText: "Price can't be empty",
                         hintText: "Price"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Price is Required';
                              }
                     },
                   ),
                   SizedBox(height: 10,),
                     TextFormField(
                       controller: colorController,
                       keyboardType: TextInputType.text,
                     decoration:InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Icon(
                           Icons.color_lens,
                           color: Colors.green,
                         ),
                         labelText: "Color",
                         helperText: "Color can't be empty",
                         hintText: "Color"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Color is Required';
                              }
                     },
                   ),
                   SizedBox(height: 10,),
                     TextFormField(
                       controller: daatController,
                       keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Image(image: AssetImage('assets/images/tooth.png'),color: Colors.green,),
                         labelText: "Satiyako-Daat",
                         helperText: "Satiyako-Daatcan't be empty",
                         hintText: "Satiyako-Daat"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Satiyaako Daat is Required';
                              }
                     },
                   ),
                     SizedBox(height: 10,),
                     TextFormField(
                       controller: nameController,
                       keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Image(image: AssetImage('assets/images/name.png'),color: Colors.green,),
                         labelText: "Name",
                         helperText: "Name can't be empty",
                         hintText: "Name"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Name is Required';
                              }
                     },
                   ),
                     SizedBox(height: 10,),
                     TextFormField(
                       controller: addressController,
                       keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Icon(
                           Icons.location_city,
                           color: Colors.green,
                         ),
                         labelText: "Address",
                         helperText: "Address can't be empty",
                         hintText: "Address"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Address is Required';
                              }
                     },
                   ),
                     SizedBox(height: 10,),
                     TextFormField(
                       controller: primaryContactController,
                       keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Icon(
                           Icons.phone,
                           color: Colors.green,
                         ),
                         labelText: "Primary-Number",
                         helperText: "Primary-Number can't be empty",
                         hintText: "Primary-Number"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Primary Number is Required';
                              }
                     },
                   ),
                     SizedBox(height: 10,),
                     TextFormField(
                       controller: secondaryContactController,
                       keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Icon(
                           Icons.phone_android,
                           color: Colors.green,
                         ),
                         labelText: "Secondary-Number",
                         helperText: "Secondary-Number is optional",
                         hintText: "Secondary-Number"
                       ),
                   ),
                      SizedBox(height: 10,),
                     TextFormField(
                       controller: ageController,
                       keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2.0
                            )
                         ),
                         prefixIcon: Icon(
                           Icons.assignment,
                           color: Colors.green,
                         ),
                         labelText: "Age",
                         helperText: "Age can't be empty",
                         hintText: "Age"
                       ),
                       validator: (String value){
                         if(value.isEmpty){
                           return 'Age is Required';
                              }
                     },
                   ),
                  SizedBox(height: 10,),
                  widget.id==null? RaisedButton(
                     child: Text("Submit"),
                   onPressed: (){
                       String inputtitle=titleController.text;
                      String inputcategory=_currentCategorySelected.toString();
                      String desc=descriptionController.text;
                      int weight=int.parse(weightController.text.toString());
                      int inputprice=int.parse(priceController.text.toString());
                      String inputcolor=colorController.text.toString().trim();
                      int inputdaat=int.parse(daatController.text.toString());
                      String name=nameController.text.toString().trim();
                      String address=addressController.text.toString().trim();
                      int phnNo=int.parse(primaryContactController.text.toString());
                      int contactNo=int.parse(secondaryContactController.text.toString());
                      int inputage=int.parse(ageController.text.toString());
                      String inputkhasiImage= _image as String;
                      setState(() {
                        //  widget._isApiProcess=true;
                        KhasiModel khasiModel=KhasiModel(
                          
                          title: inputtitle,
                          category: inputcategory,
                          shortDescription: desc,
                          estimatedWeight: weight,
                          price: inputprice,
                          color: inputcolor,
                          daat: inputdaat,
                          ownerName: name,
                          address: address,
                          primaryContactNo: phnNo,
                          secondaryContactNo: contactNo,
                          age:inputage,
                          khasiImage: inputkhasiImage,
                           

                        );
                        createPost(khasiModel)
                        .then((response){
                        print(response.body);
                          if(response.statusCode==201)
                          {
                           
                          showDialog(
                            context:context,
                            builder: (context) => Dialogs(),
                           );
                          }
                          else{
                             showDialog(
                            context:context,
                            builder: (context) => ErrorDialog(),
                           );

                          }
                        }).catchError((error)=>print(error));
                      });
                      if(!_formKey.currentState.validate()){
                        return;
                       }
                    _formKey.currentState.save();
                   },
                   ):RaisedButton(
                     child: Text("Edit"),
                     onPressed: () {
                       
                      String inputtitle=titleController.text;
                      String inputcategory=_currentCategorySelected.toString();
                      String desc=descriptionController.text;
                      int weight=int.parse(weightController.text.toString());
                      int inputprice=int.parse(priceController.text.toString());
                      String inputcolor=colorController.text.toString().trim();
                      int inputdaat=int.parse(daatController.text.toString());
                      String name=nameController.text.toString().trim();
                      String address=addressController.text.toString().trim();
                      int phnNo=int.parse(primaryContactController.text.toString());
                      int contactNo=int.parse(secondaryContactController.text.toString());
                      int inputage=int.parse(ageController.text.toString());
                      String inputkhasiImage= _image != null ? 'data:image/png;base64,' +
                                      base64Encode(_image.readAsBytesSync()) : '';
                      setState(() {
                        //  widget._isApiProcess=true;
                        KhasiModel khasiModel=KhasiModel(
                          id: widget.id,
                          title: inputtitle,
                          category: inputcategory,
                          shortDescription: desc,
                          estimatedWeight: weight,
                          price: inputprice,
                          color: inputcolor,
                          daat: inputdaat,
                          ownerName: name,
                          address: address,
                          primaryContactNo: phnNo,
                          secondaryContactNo: contactNo,
                          age:inputage,
                          khasiImage: inputkhasiImage,
                           
                    
                        );
                        updatePost(khasiModel)
                        .then((response){
                        
                          if(response.statusCode==201)
                          {
                           print(response);
                          showDialog(
                            context:context,
                            builder: (context) => Dialogs(),
                           );
                          }
                          else{
                             showDialog(
                            context:context,
                            builder: (context) => ErrorDialog(),
                           );

                          }
                        }).catchError((error)=>print(error));
                      });
                      if(!_formKey.currentState.validate()){
                        return;
                       }
                    _formKey.currentState.save();
                     
                   },),
           ],
         ),
                ),
       ),
    );
  }
}