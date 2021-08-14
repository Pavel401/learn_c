import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:learn_c/widgets/homepage.dart';


class splash extends StatefulWidget {
  const splash({ Key? key }) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HOMEPAGE()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/splash.json')),
            SizedBox(height: 20),
            Text(
              "C Programming",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
    
  }
}