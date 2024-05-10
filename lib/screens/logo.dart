import 'package:flutter/material.dart';
import 'package:kemet/screens/book_ticket.dart';

class Logo extends StatefulWidget {
  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BookTicket()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  "images/WhatsApp Image 2024-02-06 at 13.22.00_6be86089.jpg",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: Color.fromARGB(255, 148, 110, 22),
            ),
          )
        ],
      ),
    ));
  }
}
