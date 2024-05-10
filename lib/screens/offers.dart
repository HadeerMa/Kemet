import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:kemet/screens/event-place.dart';

class TouristPlace {
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final int quantity;

  TouristPlace(
      this.title, this.description, this.imageUrl, this.price, this.quantity);
}

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  bool isSearching = false;
  List<TouristPlace> places = [];

  @override
  void initState() {
    super.initState();
    initializeTouristPlaces();
  }

  Future<void> initializeTouristPlaces() async {
    final dio = Dio();
    const url =
        'https://kemet-gp2024.onrender.com/api/v1/offers/662a2327bcfb540daac62a77';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          final Map<String, dynamic>? offer = responseData['offer'];
          if (offer != null) {
            setState(() {
              places = [
                TouristPlace(
                  offer['title'],
                  offer['description'],
                  offer['imgCover'],
                  offer['price'].toDouble(),
                  offer['quantity'],
                )
              ];
            });
          }
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    TextStyle descriptionStyle = TextStyle(
      fontSize: 14,
      color: const Color.fromARGB(255, 113, 111, 111),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventsScreen2(
                        title: places[index].title,
                        description: places[index].description,
                        imageUrl: places[index].imageUrl,
                        price: places[index].price,
                        quantity: places[index].quantity,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Material(
                      elevation: 10,
                      child: SizedBox(
                        width: double.infinity,
                        height: 140,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          places[index].imageUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: index.isOdd
                                              ? Colors.red
                                              : Colors.black,
                                          width: 5,
                                        ),
                                        bottom: BorderSide(
                                          color: index.isOdd
                                              ? Colors.red
                                              : Colors.black,
                                          width: 5,
                                        ),
                                        left: BorderSide(
                                          color: Colors.grey,
                                          width: .5,
                                        ),
                                        top: BorderSide(
                                          color: Colors.grey,
                                          width: .5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              places[index].title,
                                              style: titleStyle,

                                              //maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            places[index].description,
                                            style: descriptionStyle,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height:
                                                40, // Fixed height for price and quantity
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '\$${places[index].price.toStringAsFixed(2)}', // Display price formatted as currency
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  'Qty: ${places[index].quantity}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
