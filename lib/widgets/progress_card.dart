import 'package:app__5/constants/colors.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatefulWidget {
  final double progressValue;
  final int total;

  const ProgressCard({
    super.key,
    required this.progressValue,
    required this.total,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
            colors: [kMainColor, kMainDarkBlueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Proteins, Fats & Carbohydrates",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: kMainWhiteColor,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            LinearProgressIndicator(
              value: widget.progressValue,
              backgroundColor: kMainDarkBlueColor,
              valueColor: const AlwaysStoppedAnimation(
                kMainWhiteColor,
              ),
              minHeight: 15,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag(
                  "Done",
                  done.toString(),
                ),
                _buildTag(
                  "Total",
                  widget.total.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kMainWhiteColor,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kMainWhiteColor,
          ),
        ),
      ],
    );
  }
}
