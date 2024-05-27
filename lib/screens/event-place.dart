import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kemet/screens/Reviwes.dart';

class User {
  final String name;
  final String photoUrl;

  User({required this.name, required this.photoUrl});
}

class EventsScreen2 extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final int quantity;
  const EventsScreen2({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  @override
  State<EventsScreen2> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen2> {
  final List<Map<String, dynamic>> reviews = [];
  TextEditingController _reviewController = TextEditingController();
  bool _isPressed = false;
  bool _ticketBooked = false;
  double _userRating = 0;
  bool _hasReviewed = false; // Track whether the user has submitted a review

  double calculateAverageRating() {
    if (reviews.isEmpty) {
      return 0;
    }

    double sum = 0;
    for (var review in reviews) {
      sum += review['rating'];
    }
    return sum / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        // Apply border radius to image
                        child: Image.network(
                          widget.imageUrl,
                          height: constraints.maxWidth *
                              0.5, // Adjust height relative to width
                          width: constraints.maxWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 3,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: _isPressed ? Colors.red : Colors.white,
                          iconSize: 30,
                          onPressed: () {
                            setState(() {
                              _isPressed = !_isPressed;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title, // Display the event title
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: calculateAverageRating(),
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },
                          ignoreGestures: true,
                          onRatingUpdate: (double value) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      widget.description, // Display the event description
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Price:', // New price with 'Price' prefix
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' \$${widget.price.toStringAsFixed(2)}', // New price with 'Price' prefix
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _ticketBooked
                              ? null
                              : () {
                                  setState(() {
                                    _ticketBooked = true;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Success! Your Ticket is booked',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                },
                          icon: _ticketBooked
                              ? Icon(Icons.check, color: Colors.white)
                              : Icon(Icons.add, color: Colors.white),
                          label: Text(
                            'My Tickets',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                            overflow: TextOverflow
                                .ellipsis, // Ensure text stays in one line
                            maxLines: 1, // Limit to one line
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _ticketBooked
                                ? Color.fromARGB(255, 210, 204, 204)
                                : Color.fromRGBO(255, 180, 17, 0.7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35, top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Quantity : ', // Display quantity in stock
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          widget.quantity.toString(), // Display quantity
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10), // Adjust the padding as needed
                      child: RatingBar.builder(
                        initialRating: _userRating,
                        itemCount: 5,
                        itemSize: 25,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        },
                        onRatingUpdate: (rating) {
                          setState(() {
                            _userRating = rating;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      controller: _reviewController,
                      enabled: !_hasReviewed,
                      maxLines: null,
                      style: TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: 'Write a review...',
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xffB68B25)), // Change border color when focused
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 140),
                    child: ElevatedButton(
                      onPressed: _hasReviewed
                          ? null
                          : () {
                              String reviewText = _reviewController.text;
                              if (reviewText.isNotEmpty && _userRating > 0) {
                                User user = User(name: "John", photoUrl: "");
                                Map<String, dynamic> review = {
                                  'user': user,
                                  'text': reviewText,
                                  'rating': _userRating
                                };
                                setState(() {
                                  reviews.add(review);
                                  _reviewController.clear();
                                  _userRating = 0;
                                  _hasReviewed = true;
                                });
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 180, 17, 0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize:
                            Size(80, 36), // Adjust button size as needed
                        padding: EdgeInsets.symmetric(
                            horizontal: 12), // Adjust padding as needed
                      ),
                      child: Text(
                        'OK',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      'Product Reviews',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 150, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        return ReviewItem(
                          review: reviews[index],
                          onDelete: () {
                            setState(() {
                              reviews.removeAt(index);
                              _hasReviewed = false;
                            });
                          },
                          onUpdate: (String initialText, double initialRating) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                double updatedRating = initialRating;
                                TextEditingController textEditingController =
                                    TextEditingController(text: initialText);

                                return AlertDialog(
                                  title: Text(
                                    'Update Review',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: initialRating,
                                        itemCount: 5,
                                        itemSize: 25,
                                        itemBuilder: (context, index) {
                                          return Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          );
                                        },
                                        onRatingUpdate: (rating) {
                                          updatedRating = rating;
                                        },
                                      ),
                                      TextField(
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                          hintText: 'Update a review...',
                                          hintStyle: TextStyle(
                                            fontSize: 15,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Color(0xffB68B25),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Color(0xffB68B25),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffB68B25),
                                          )),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        String updatedReviewText =
                                            textEditingController.text;
                                        if (updatedReviewText.isNotEmpty) {
                                          setState(() {
                                            reviews[index]['text'] =
                                                updatedReviewText;
                                            reviews[index]['rating'] =
                                                updatedRating;
                                          });
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Text('Update',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffB68B25),
                                          )),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
