import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class FireStorage{
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> selectFile() async{
    PlatformFile? pickedFile;
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type:FileType.custom,
      allowedExtensions: ['png','jpg'],
    );
    if(result == null) return "";

    final path = result.files.single.path!;
    return path;
  }

  Future<void> uploadFile(String filePath) async{
    File file = File(filePath);
    try{
      await storage.ref().putFile(file);
    } on firebase_core.FirebaseException catch(e){
      print(e);
    }
  }

}