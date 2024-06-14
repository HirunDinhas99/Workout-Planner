import 'package:app__5/constants/colors.dart';
import 'package:flutter/material.dart';

class ExersiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  const ExersiceCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              imageUrl,
              width: 95,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xff0193FC),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
