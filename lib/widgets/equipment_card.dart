import 'package:app__5/constants/colors.dart';
import 'package:flutter/material.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentImgUrl;
  final String equipmentDescription;
  final int noOfMinutes;
  final double noOfCalories;

  const EquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentImgUrl,
    required this.equipmentDescription,
    required this.noOfMinutes,
    required this.noOfCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kCardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipmentName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  equipmentImgUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${noOfMinutes.toString()} of workout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0193FC),
                      ),
                    ),
                    Text(
                      "${noOfCalories.ceil()} Calories will burn",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0193FC),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              equipmentDescription,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xffB2B0B0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
