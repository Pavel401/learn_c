import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class basic_page_ui extends StatefulWidget {
  const basic_page_ui({ Key? key }) : super(key: key);

  @override
  _basic_page_uiState createState() => _basic_page_uiState();
}

class _basic_page_uiState extends State<basic_page_ui> {
  @override
  Widget build(BuildContext context) {

    final db= FirebaseFirestore.instance;  
  
    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(


      stream: db.collection('BASIC').snapshots(),
      builder: (context,AsyncSnapshot snapshots){
        if(!snapshots.hasData)
        {
          return Center(
              child: CircularProgressIndicator(),
            );
        }
        else  if (snapshots.connectionState == ConnectionState.waiting) {
                return Text("Loading");
                
                }
       else         
       return ListView(

              
              children: snapshots.data.docs.map<Widget>((doc) {
                return Card(
                  child: ListTile(
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