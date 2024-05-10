import 'package:flutter/material.dart';

class MyTripOfPlace extends StatefulWidget {
  @override
  _MyTripOfPlaceState createState() => _MyTripOfPlaceState();
}

class _MyTripOfPlaceState extends State<MyTripOfPlace> {
  bool _isPressed = false; // Define _isPressed as a boolean variable

  // Declare variables for price and quantity
  String price = '\$9.99'; // Example price
  int quantity = 100; // Example quantity in stock

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Trip',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => ToristPlace()));
                        //   },
                        // ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'PHARAOHS',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      'jbiujkbunl09hnuby7yvtdrewwsdcvnnmklpl',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                          fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Price: ', // Display price
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '$price ', // Display price
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Quantity: ', // Display quantity in stock
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    '$quantity ', // Display price
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200, left: 100, right: 100),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (!_isPressed) {
                          setState(() {
                            _isPressed = true;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Success! Your Ticket is booked',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    )),
                              ),
                            );
                          });
                        }
                      },
                      icon: _isPressed
                          ? Icon(Icons.check, color: Colors.white)
                          : Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'My Ticket',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isPressed
                            ? Color.fromARGB(255, 210, 204, 204)
                            : Color.fromRGBO(255, 180, 17, 0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
