import 'package:app__5/constants/colors.dart';
import 'package:app__5/constants/responsive.dart';
import 'package:flutter/material.dart';

class AddExersiceCard extends StatefulWidget {
  final String exersiceTitle;
  final String exersiceImg;
  final int noOfMinutes;
  final bool isAdded;
  final bool isFav;
  final void Function() toggleAddExersice;
  final void Function() toggleFavExersice;

  const AddExersiceCard({
    super.key,
    required this.exersiceTitle,
    required this.exersiceImg,
    required this.noOfMinutes,
    required this.toggleAddExersice,
    required this.isAdded,
    required this.isFav,
    required this.toggleFavExersice,
  });

  @override
  State<AddExersiceCard> createState() => _AddExersiceCardState();
}

class _AddExersiceCardState extends State<AddExersiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 15,
      ),
      width: 215,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kCardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.exersiceTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Image.asset(
              widget.exersiceImg,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.noOfMinutes.toString()} Minuites",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: kSubtitleColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kSubtitleColor.withOpacity(0.4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddExersice();
                      },
                      icon: Icon(
                        widget.isAdded ? Icons.remove : Icons.add,
                        size: 30,
                        color: Color(0xff0147FC),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kSubtitleColor.withOpacity(0.4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.toggleFavExersice();
                      },
                      icon: Icon(
                        widget.isFav ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: Color(0xffFF0000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
