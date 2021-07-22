import 'package:flutter/material.dart';
import 'package:learn_c/widgets/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
   //initializing Firebase
  //  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  //we can also use upper single line code

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
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
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: Text('LEARN C PROGRAMMING'),),
      body: Container(
        decoration:BoxDecoration(
          //here we use bg.png to create bg
          image: DecorationImage(image: AssetImage("assets/BG.png"), fit: BoxFit.fill),
          
        ),
        child: HOMEPAGE(),
      ),
    );
  }
}



