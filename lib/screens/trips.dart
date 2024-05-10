import 'package:flutter/material.dart';

class Trip {
  final String title;
  final String description;
  final String imageUrl;

  Trip(this.title, this.description, this.imageUrl);
}

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  bool isSearching = false;
  List<Trip> trips = [];

  @override
  void initState() {
    super.initState();
    initializeTrips();
  }

  void initializeTrips() {
    trips = [
      Trip(
        'Pyramids of Giza',
        'The Pyramids of Giza are ancient Egyptian monuments that are known worldwide.',
        'https://th.bing.com/th/id/OIP.HEX_NEdz-whfW1VdmnLpSQAAAA?w=233&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      ),
      Trip(
        'Sphinx',
        'The Great Sphinx the head of a pharaoh.',
        'https://th.bing.com/th/id/OIP.4AwBakv1HMrH-Hd_8DmwFAHaE8?w=300&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      ),
      Trip(
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
      color: const Color.fromARGB(255, 113, 111, 111),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Trips',
          
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            //color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            //color: Colors.black,
          ),
          onPressed: () {
            //Navigator.of(context).push(
             // MaterialPageRoute(builder: (context) => ()), // Corrected class name
           // );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 2),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: trips.length, // Corrected variable name
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle the tap event
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
                                              trips[index].imageUrl, // Corrected variable name
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
                                                  : Color(0xff111441),
                                              width: 5,
                                            ),
                                            bottom: BorderSide(
                                              color: index.isOdd
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
                                                trips[index].title, // Corrected variable name
                                                style: titleStyle,
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                trips[index].description, // Corrected variable name
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
      ),
    );
  }
}
