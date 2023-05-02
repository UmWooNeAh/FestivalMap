import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivalmap/class/class.dart';

class FireService{
  static final FireService _fireService = FireService._internal();
  factory FireService() => _fireService;
  FireService._internal();


  void createUser(User user) async{
    //await FirebaseFirestore.instance.collection().add();
      final docUser = FirebaseFirestore.instance.collection('User').doc();
      user.uId = docUser.id;
      final json = user.toJson();
      await docUser.set(json);
  }

  void createFest(Fest fest) async{
      final docFest = FirebaseFirestore.instance.collection('Fest').doc();
      fest.fId = docFest.id;
      final json = fest.toJson();
      await docFest.set(json);
  }

  void createReview(Fest fest) async{
    final docFest = FirebaseFirestore.instance.collection('Fest').doc();
    fest.fId = docFest.id;
    final json = fest.toJson();
    await docFest.set(json);
  }

  void delClass(int classId, int id){
    //유저 삭제
    switch(classId){
      case 0: //User
      break;
      case 1: //Fest
      break;
      case 2: //Review
      break;
    }
  }

}
