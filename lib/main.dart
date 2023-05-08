import 'package:festivalmap/class/FireStorage.dart';
import 'package:festivalmap/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:developer';
import 'class/class.dart';
import 'class/FireService.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the
  // root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of our application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  Widget buildUser(User user) => ListTile(
    leading:CircleAvatar(child:Text('${user.age}')),
    title:Text(user.uName),
    subtitle:Text(user.bookMark.toString()),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
     title: Text('Add User'),

    ),
    body:Column( //사진 추가 예제
      children: [
        Center(
          child: ElevatedButton(
            onPressed: (){
              List<String> file;
              FireStorage().selectFile().then((String path){
                FireStorage().uploadFile(path).then((value)=>print('Done'));
              });
              },
            child:Text('Upload File'),
          )
        )
      ],
    )
    /*ListView( //Create 예제
       padding:EdgeInsets.all(16),
       children: <Widget>[
       TextField(
         controller : controllerName,
         decoration: decoration('Name'),
       ),
       const SizedBox(height:24),
       TextField(
         controller: controllerAge,
         decoration: decoration('Age'),
         keyboardType: TextInputType.number,

       ),
       const SizedBox(height:32),
       ElevatedButton(
         child: Text('Create'),
         onPressed: () {
           List<String> a = ["ab","bb","cc"];
           final user = User(
             uName : controllerName.text,
             age: int.parse(controllerAge.text),
             bookMark : a,
             sex : false,
           );
           print(FireService().readAllUsers());
           Navigator.pop(context);
         },
       ),*/
      /* //Read 예제
       FutureBuilder<User>(
         future: FireService().readUserByName('Park'),
         builder:(context,snapshot){
           if(snapshot.hasData){
             final users = snapshot.data!;
             return buildUser(users);
           }
           else{
             return Center(child:CircularProgressIndicator());
           }
         }),
       */


  );

  InputDecoration decoration(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
  );
}