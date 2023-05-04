import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivalmap/class/class.dart';

class FireService{
  static final FireService _fireService = FireService._internal();
  factory FireService() => _fireService;
  FireService._internal();
  //각각 사용할 때 FireService().함수명

  //Create
  void createUser(User user) async{
      final docUser = FirebaseFirestore.instance.collection('User').doc(user.uName);
      final json = user.toJson();
      await docUser.set(json);
  }

  void createFest(Fest fest) async{
      final docFest = FirebaseFirestore.instance.collection('Fest').doc(fest.fName);
      final json = fest.toJson();
      await docFest.set(json);
  }

  void createReview(Review review) async{
    final docReview = FirebaseFirestore.instance.collection('Fest').doc(review.uName+review.fName);
    final json = review.toJson();
    await docReview.set(json);
  }
  //Read
  Future<List<User>> readAllUsers() async{
    //모든 유저 데이터 들고오기
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String,dynamic>> _snapshot =
        await _firestore.collection("User").get();
    List<User> _result = _snapshot.docs.map((e) => User.fromJson(e.data())).toList();
    return _result;
  }

  Future<List<User>> readUserByName(String name) async{
    //해당 이름의 유저 들고오기
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String,dynamic>> _snapshot =
    await _firestore.collection("User").where("uName",isEqualTo: name).get();
    List<User> _result = _snapshot.docs.map((e) => User.fromJson(e.data())).toList();
    return _result;
  }

  Future<List<Fest>> readAllFests() async{
    //모든 축제 데이터 들고오기
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String,dynamic>> _snapshot =
    await _firestore.collection("Fest").get();
    List<Fest> _result = _snapshot.docs.map((e) => Fest.fromJson(e.data())).toList();
    return _result;
  }

  Future<List<Review>> readAllReviews() async{
    //모든 리뷰 데이터 들고오기
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String,dynamic>> _snapshot =
    await _firestore.collection("Review").get();
    List<Review> _result = _snapshot.docs.map((e) => Review.fromJson(e.data())).toList();
    return _result;
  }

  Future<List<Review>> readReviewByUser(String name) async{
    //특정 유저가 작성한 데이터 들고오기
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String,dynamic>> _snapshot =
    await _firestore.collection("Review").where("uName",isEqualTo: name).get();
    List<Review> _result = _snapshot.docs.map((e) => Review.fromJson(e.data())).toList();
    return _result;
  }
  //Update
  void changeUser(String name,User newData) async {
    DocumentSnapshot<Map<String, dynamic>> _data = await FirebaseFirestore
        .instance.collection("User").doc(name).get();
    newData.uName = name;

    await FirebaseFirestore.collection("User").doc(name).set(newData)

  }
  //Delete
  void delUser(int classId, String name){

  }

}
