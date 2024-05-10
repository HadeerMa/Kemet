import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Legend',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            //color: Colors.white,
            size: 20,
            weight: 500,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Widget
            Stack(
              children: [
                 ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Apply border radius to image
                        child: Image.network(
                          'https://th.bing.com/th?id=OIP.BIR5Tw_VbFfTdZfnSE1EHAHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
                          height: 211.0,
                          width: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  // child: IconButton(
                  //   icon: Icon(
                  //     Icons.arrow_back_ios_new_rounded,
                  //     color: Colors.white,
                  //   ),
                  //   onPressed: () {
                  //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ToristPlace()));
                  //   },
                  // ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'PHARAOHS',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Description Widget
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Description',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'jbiujkbunl09hnuby7yvtdrewwsdcvnnmklpl',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
