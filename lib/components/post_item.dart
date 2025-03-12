import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String title;
  final String body;

  const PostItem({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title[0].toUpperCase() + title.substring(1),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              body[0].toUpperCase() + body.substring(1),
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
