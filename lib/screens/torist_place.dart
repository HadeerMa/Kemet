import 'package:flutter/material.dart';
import 'package:kemet/pages/search.dart';
import 'package:kemet/screens/history_place.dart';
import 'package:kemet/screens/homepage.dart';

class TouristPlace {
  final String title;
  final String description;
  final String imageUrl;

  TouristPlace(this.title, this.description, this.imageUrl);
}

class ToristPlace extends StatefulWidget {
  @override
  _ToristPlaceState createState() => _ToristPlaceState();
}

class _ToristPlaceState extends State<ToristPlace> {
  //final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  List<TouristPlace> places = [];

  @override
  void initState() {
    super.initState();
    initializeTouristPlaces();
  }

  void initializeTouristPlaces() {
    places = [
      TouristPlace(
        'Pyramids of Giza',
        'The Pyramids of Giza are ancient Egyptian monuments that are known worldwide.',
        'https://th.bing.com/th/id/OIP.HEX_NEdz-whfW1VdmnLpSQAAAA?w=233&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      ),
      TouristPlace(
        'Sphinx',
        'The Great Sphinx of Giza is a colossal statue with the body of a lion and the head of a pharaoh.',
        'https://th.bing.com/th/id/OIP.4AwBakv1HMrH-Hd_8DmwFAHaE8?w=300&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      ),
      TouristPlace(
        'Khan el-Khalili',
        'Khan el-Khalili is a famous bazaar in Cairo, Egypt.',
        'https://www.sayidaty.net/sites/default/files/imce/user54794/1_584.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    TextStyle descriptionStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Giza',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30, fontWeight: FontWeight.bold,
            //color: Colors.black
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            // color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 113, 111, 111),
                    width: 2.0,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Search()));
                        },
                        child: Container(
                          width: 354,
                          height: 38,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.search),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Search',
                                style: TextStyle(fontFamily: 'Poppins'),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        // SizedBox(
                        //   height: 16,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the second screen when the image is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryOfPlace(),
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
                          height: 160,
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
                                            color: index % 2 == 0
                                                ? Colors.red
                                                : Color(0xff111441),
                                            width: 5,
                                          ),
                                          bottom: BorderSide(
                                            color: index % 2 == 0
                                                ? Colors.red
                                                : Color(0xff111441),
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
                                            Text(
                                              places[index].title,
                                              style: titleStyle,
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              places[index].description,
                                              style: descriptionStyle,
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
      ),
    );
  }
}
