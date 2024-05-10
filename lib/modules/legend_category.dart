import 'package:flutter/material.dart';
import 'package:kemet/screens/legend.dart';
class CategoryLegenedCard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                    // Navigate to the second screen when the image is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Legend(
                          
                        ),
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
                        image: NetworkImage('https://th.bing.com/th/id/OIP.tYbmA3VYK2WRpopaIa0LnwHaFO?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Text(
                    'Cairo',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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
                        image: NetworkImage('https://th.bing.com/th/id/OIP.tYbmA3VYK2WRpopaIa0LnwHaFO?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Text(
                    'Alexandria',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
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