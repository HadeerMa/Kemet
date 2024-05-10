import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kemet/screens/event-place.dart';
class ReviewItem extends StatelessWidget {
  final Map<String, dynamic> review;
  final VoidCallback onDelete;
  final Function(String, double) onUpdate;

  ReviewItem(
      {required this.review, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    final User user = review['user'];
    final String initialText = review['text'];
    final double initialRating = review['rating'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl),
                radius: 10,
              ),
              SizedBox(width: 10),
              Text(
                user.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: RatingBar.builder(
                  initialRating: initialRating,
                  itemCount: 5,
                  itemSize: 15,
                  itemBuilder: (context, index) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  ignoreGestures: true,
                  onRatingUpdate: (double value) {},
                ),
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Color(0xffB68B25),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'update',
                  ),
                  PopupMenuItem<String>(
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Color(0xffB68B25),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'delete',
                  ),
                ],
                onSelected: (String value) {
                  if (value == 'update') {
                    onUpdate(initialText, initialRating);
                  } else if (value == 'delete') {
                    onDelete();
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 3),
          Text(
            initialText,
            style: TextStyle(fontSize: 13),
            maxLines: null,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}