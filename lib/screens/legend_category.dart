import 'package:flutter/material.dart';
import 'package:kemet/pages/account.dart';
import 'package:kemet/pages/search.dart';
import 'package:kemet/screens/homepage.dart';
import 'package:kemet/widget/bottomnavebar.dart';
import 'legend.dart';

class LegendCategory extends StatefulWidget {
  const LegendCategory({Key? key}) : super(key: key);

  @override
  _LegendCategoryState createState() => _LegendCategoryState();
}

class _LegendCategoryState extends State<LegendCategory> {
  //final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Ahmed',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  // color: Colors.black
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Let\'s take a tour in Egypt',
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Account()));
            },
            child: CircleAvatar(
              radius: 50.0, // Adjust the radius as needed
              backgroundImage: NetworkImage(
                  'https://uploads-ssl.webflow.com/62b9460fd9967c495fcac35c/62b976bf41ebe073549df494_ArtifactLabs-oograph.png'),
            ),
          ),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Color.fromARGB(255, 113, 111, 111),
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Search()));
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
                  // isSearching
                  //     ? IconButton(
                  //         icon: Icon(
                  //           Icons.clear,
                  //           // color: Colors.black,
                  //         ),
                  //         onPressed: () {
                  //           _searchController.clear();
                  //           setState(() {
                  //             isSearching = false;
                  //           });
                  //         },
                  //       )
                  //     : IconButton(
                  //         icon: Icon(
                  //           Icons.search_rounded,
                  //           // color: Colors.black,
                  //         ),
                  //         onPressed: () {
                  //           // Add your voice recording functionality here
                  //         },
                  //       ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            // Navigate to the second screen when the image is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Legend(),
              ),
            );
          },
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        height: 128, // Adjust the height as needed
                        width: 154,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.tYbmA3VYK2WRpopaIa0LnwHaFO?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Text(
                        'Cairo',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            // color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        height: 128, // Adjust the height as needed
                        width: 154,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.tYbmA3VYK2WRpopaIa0LnwHaFO?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Text(
                        'Alexandria',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            //color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            bottom(
              image: 'images/Menu 1.png',
              ontap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            bottom(
              image: 'images/Menu 2.png',
              ontap: () {},
              // text: 'Map',
              // color: Color(0xff92929D),
            ),
            bottom(
              image: 'images/Menu 6.png',
              ontap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LegendCategory()));
              },
              // text: 'legend',
              // color: Color(0xff92929D),
            ),
            bottom(
              image: 'images/Menu 7.png',
              ontap: () {},
              // text: 'AR',
              // color: Color(0xff92929D),
            ),
          ],
        ),
      ),
    );
  }
}
