import 'package:flutter/material.dart';
import 'package:learn_c/widgets/basic.dart';

class HOMEPAGE extends StatelessWidget {
  const HOMEPAGE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> events = [
      "BASICS",
      "ARRAYS",
      "STRINGS",
      "DSA",
      "FUNTIONS",
      "POINTERS",
    ];
    return Container(
      margin: EdgeInsets.only(top: 120),
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

        children: events.map((title) {
          //Loop all events string

          return GestureDetector(
            //GestureDetector is used to get ontap feedback with card
            child: Card(
              margin: const EdgeInsets.all(20),
              child: getCardByTitle(title),
            ),

            onTap: () {
              if (title == "BASICS") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => basic_page_ui()),
                );
              }
              //Ontap response will show a toast to the user
              // Fluttertoast.showToast(
              // msg:title +" "+ "click",
              // toastLength: Toast.LENGTH_SHORT,
              // gravity: ToastGravity.CENTER,
              // fontSize: 16.0,

              //);
            },
          );
        }).toList(), //Here the map with all events succesfull returned card widgets
      ),
    );
  }
}

Column getCardByTitle(String title) {
  String img = ""; //Image path
  if (title == "BASICS")
    img = "assets/BASICS.png";
  else if (title == "DSA")
    img = "assets/DSA.png";
  else if (title == "ARRAYS")
    img = "assets/ARRAYS.png";
  else if (title == "STRINGS")
    img = "assets/STRINGS.png";
  else if (title == "POINTERS")
    img = "assets/POINTERS.png";
  else if (title == "FUNTIONS") img = "assets/FUNCTIONS.png";

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Center(
        child: Container(
          child: new Stack(
            children: [
              new Image.asset(
                img,
                width: 80.0,
                height: 80.0,
              )
            ],
          ),
        ),
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      )
    ],
  );
}
