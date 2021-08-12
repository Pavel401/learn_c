import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_c/widgets/details.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class basic_page_ui extends StatefulWidget {
  const basic_page_ui({Key? key}) : super(key: key);

  @override
  _basic_page_uiState createState() => _basic_page_uiState();
}

class _basic_page_uiState extends State<basic_page_ui> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('BASIC').snapshots(),
        builder: (context, AsyncSnapshot snapshots) {
          if (!snapshots.hasData) {
            return Center(
              child: Container(
                child: Column(
                  children: [

                    CircularProgressIndicator(),
                    DefaultTextStyle(
                      style: TextStyle(fontSize: 20.0),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('Loading Data...'),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ),
                    
                  ],
                ),
              ),
            );
          } else if (snapshots.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else
            return ListView(
              children: snapshots.data!.docs.map<Widget>((doc) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detail_fetch(post: doc)));
                    },
                    
                    title: Text(doc.data()['TITLE']),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
