class User {
  int Uid;
  String Uname = "";
  bool sex;
  int age;
  //찜하기 추가 예정

  User(this.Uid, this.Uname, this.sex, this.age);
}

class Fest {
  //카테고리 추가 예정
  int Fid;
  String Fname = "";
  DateTime Fstart;
  DateTime Fend;
  int price;
  String location = "";
  double Fstars;
  String image;
  Fest(this.Fid,this.Fname, this.Fstart, this.Fend, this.price, this.location,this.Fstars,this.image);
}

class Review{
  int Rid;
  double Rstars;
  String content;
  String Rname;
  int Uid;
  int Fid;
  String Rimage;
  Review(this.Rid,this.Rstars,this.content,this.Rname,this.Uid,this.Fid,this.Rimage);
}
