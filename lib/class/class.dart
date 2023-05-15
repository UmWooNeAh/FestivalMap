import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uName = "";
  bool sex;
  int age;
  List<String> bookMark = [];

  User({required this.uName,required this.sex,required this.age,required this.bookMark});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      uName: json["uName"],
      sex: json["sex"],
      age: json["age"],
      bookMark : List<String>.from(json["bookMark"]),
    );
  }
  Map<String, dynamic> toJson() => {
    'uName' : uName,
    'sex' : sex,
    'age' : age,
    'bookMark' : bookMark,
  };
}

class Fest {
  List<String> category = [];
  String fName = "";
  String description = "";
  Timestamp fStart;
  Timestamp fEnd;
  num price;

  GeoPoint location;
  num fStars;
  String image;

  Fest({required this.category,required this.fName, required this.description,required this.fStart,
    required this.fEnd, required this.price,
    required this.location,required this.fStars,
    required this.image});

  factory Fest.fromJson(Map<String,dynamic> json){
    print(json);
    Fest n = Fest(
      category: List<String>.from(json["category"]),
      fName : json['fName'],
      description: json['description'],
      fStart : json['fStart'],
      fEnd : json['fEnd'],
      price : json['price'],
      location : json['location'],
      fStars : json['fStars'],
      image : json['image'],
    );


    return n;
  }
  Map<String, dynamic> toJson() => {
    'category' : category,
    'fName' : fName,
    'description' : description,
    'fStart' : fStart,
    'fEnd' : fEnd,
    'price' : price,
    'location' : location,
    'fStars' : fStars,
    'image' : image,
  };
}

class Review{
  String rId = "";
  double rStars;
  String content = "";
  String rName = "";
  String uName = "NULL";
  String fName = "NULL";
  String rImage = "";

  Review({required this.rId,required this.rStars,required this.content,required this.rName
    ,required this.uName,required this.fName, required this.rImage});

  factory Review.fromJson(Map<String,dynamic> json){
    return Review(
      rId : json["uName"]+json["fName"],
      rStars : json["rStars"],
      content : json["content"],
      rName: json["rName"],
      uName : json["uName"],
      fName : json["fName"],
      rImage : json["rImage"],
    );
  }
  Map<String, dynamic> toJson() => {
    'rId' : uName+fName,
    'rStars' : rStars,
    'content' : content,
    'rName': rName,
    'uId' : uName,
    'fId' : fName,
    'rImage' : rImage,
  };
}