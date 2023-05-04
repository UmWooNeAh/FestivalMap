class User {
  String uName = "";
  bool sex;
  int age;
  
  //찜하기 추가 예정

  User({required this.uName,required this.sex,required this.age});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      uName: json["uName"],
      sex: json["sex"],
      age: json["age"],
    );
  }
  Map<String, dynamic> toJson() => {
    'uName' : uName,
    'sex' : sex,
    'age' : age,
  };
}

class Fest {
  //카테고리 추가 예정
  String fName = "";
  DateTime fStart;
  DateTime fEnd;
  int price;
  String location = "";
  double fStars;
  String image;
  
  Fest({required this.fName, required this.fStart, required this.fEnd, required this.price, required this.location,required this.fStars,required this.image});

  factory Fest.fromJson(Map<String,dynamic> json){
    return Fest(
      fName : json['fName'],
      fStart : json['fStar'],
      fEnd : json['fEnd'],
      price : json['price'],
      location : json['location'],
      fStars : json['fStars'],
      image : json['image'],
    );
  }
  Map<String, dynamic> toJson() => {
    'fName' : fName,
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
