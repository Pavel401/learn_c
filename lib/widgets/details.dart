import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_c/widgets/basic.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class detail_fetch extends StatefulWidget {
  final post;
  const detail_fetch({Key? key, required this.post}) : super(key: key);

  @override
  _detail_fetchState createState() => _detail_fetchState();
}

class _detail_fetchState extends State<detail_fetch> {
  final List<String> titles=["Info","Code"];
  String currentTitle="";
  int _selectedindex = 0;
  @override
  void initState(){
    currentTitle= titles[0];
    super.initState();
     
  }
  Widget build(BuildContext context) {
    String code = widget.post['DESCRIPTION'].replaceAll("\\n ", "\n");
    
    List<Widget> _widgets = <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: CachedNetworkImage(
                imageUrl: widget.post['IMAGE'],
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),                
              ),
            ),
            Card(
              child: Container(
                width: double.infinity,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.post['TITLE'],
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    code,
                    style: TextStyle(fontSize: 18.0, wordSpacing: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.post['CODE'],
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(currentTitle),
      ),
      body: _widgets.elementAt(_selectedindex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GNav(
              gap: 8,
              color: Colors.grey[800],
              haptic: true,
              activeColor: Colors.purple,
              iconSize: 24,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              duration: Duration(milliseconds: 500),
              tabs: [
                GButton(
                  icon: Icons.info,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.code,
                  text: 'Likes',
                ),
              ],
              selectedIndex: _selectedindex,
              onTabChange: (index) {
                setState(
                  () {
                      currentTitle=titles[index];
                    _selectedindex = index;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
