//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kemet/modules/category.dart';
import 'package:kemet/screens/homepage.dart';

class GovernatesScreen extends StatelessWidget {
  const GovernatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Governorates',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              // color: Colors.black,
              fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            //color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 27,
            itemBuilder: (context, index) {
              return CategoryCard();
            }),
      ),
    );
  }
}
