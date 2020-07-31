import 'dart:convert';

List<KhasiModel> khasiModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<KhasiModel>.from(str.map((item){
     return KhasiModel.fromJson(item);
  }));
      

 
  }

String khasiModelToJson(KhasiModel data) => json.encode(data.toJson());

class KhasiModel {
    KhasiModel({
        this.id,
        this.userId,
        this.title,
        this.category,
        this.shortDescription,
        this.khasiImage,
        this.estimatedWeight,
        this.price,
        this.color,
        this.daat,
        this.ownerName,
        this.address,
        this.primaryContactNo,
        this.secondaryContactNo,
        this.age,
        this.date,
    
    });

    String id;
    String userId;
    String title;
    String category;
    String shortDescription;
    int estimatedWeight;
    int price;
    String color;
    int daat;
    String ownerName;
    String address;
    int primaryContactNo;
    int secondaryContactNo;
    int age;
    String khasiImage;
    DateTime date;
 

    factory KhasiModel.fromJson(Map<String, dynamic> json) => KhasiModel(
        id: json["_id"],
        userId: json["userId"],
        title: json["title"],
        category: json["category"],
        shortDescription: json["short_description"],
        estimatedWeight: json["estimated_weight"],
        price:json["price"],
        color: json["color"],
        daat: json["daat"],
        ownerName: json["owner_name"],
        address: json["address"],
        primaryContactNo: json["primary_contact_no"],
        secondaryContactNo: json["secondary_contact_no"],
        age: json["age"],
        khasiImage: json["khasiImage"],
        date: DateTime.parse(json["date"]),
        
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId":userId,
        "title": title,
        "category": category,
        "short_description": shortDescription,
        "estimated_weight": estimatedWeight,
        "price":price,
        "color": color,
        "daat": daat,
        "owner_name": ownerName,
        "address": address,
        "primary_contact_no": primaryContactNo,
        "secondary_contact_no": secondaryContactNo,
        "age": age,
       "khasiImage": khasiImage,
     
      
    };
 @override
  String toString() {
    // TODO: implement toString
    return 'KhasiModel{id:$id userId:$userId title: $title,category:$category,short_description:$shortDescription,estimated_weight: $estimatedWeight,price:$price,color:$color,daat:$daat,owner_name: $ownerName,address: $address,primary_contact_no: $primaryContactNo,secondary_contact_no:$secondaryContactNo,age:$age,khasiImage: $khasiImage,}';
  }
} 