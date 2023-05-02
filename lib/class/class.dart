class User {
  String uId = "NULL";
  String uName = "";
  bool sex;
  int age;
  
  //찜하기 추가 예정

  User(this.uName,this.sex,this.age);

  Map<String, dynamic> toJson() => {
    'uId' : uId,
    'uName' : uName,
    'sex' : sex,
    'age' : age,
  };
}

class Fest {
  //카테고리 추가 예정
  String fId = "NULL";
  String fName = "";
  DateTime fStart;
  DateTime fEnd;
  int price;
  String location = "";
  double fStars;
  String image;
  
  Fest(this.fName, this.fStart, this.fEnd, this.price, this.location,this.fStars,this.image);

  Map<String, dynamic> toJson() => {
    'fId' : fId,
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
  String rId = "NULL";
  double rStars;
  String content = "";
  String rName = "";
  String uId = "NULL";
  String fId = "NULL";
  String rImage = "";

  Review(this.rId,this.rStars,this.content,this.rName,this.uId,this.fId,this.rImage);

  Map<String, dynamic> toJson() => {
    'rId' : fId,
    'rStars' : rStars,
    'content' : content,
    'rName': rName,
    'uId' : uId,
    'fId' : fId,
    'rImage' : rImage,
  };
}
