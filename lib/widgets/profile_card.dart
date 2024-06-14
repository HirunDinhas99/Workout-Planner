import 'package:app__5/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  final String taskName;
  final String taskImg;
  final void Function() markAsDone;
  const ProfileCard({
    super.key,
    required this.taskName,
    required this.taskImg,
    required this.markAsDone,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kCardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              widget.taskImg,
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.taskName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  widget.markAsDone();
                },
                icon: Icon(
                  Icons.check,
                  color: kMainColor,
                )),
          ],
        ),
      ),
    );
  }
}
