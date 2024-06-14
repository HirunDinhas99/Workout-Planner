import 'package:app__5/constants/colors.dart';
import 'package:app__5/constants/responsive.dart';
import 'package:app__5/data/equipment_data.dart';
import 'package:app__5/data/exersice_data.dart';
import 'package:app__5/data/user_data.dart';
import 'package:app__5/models/user_model.dart';
import 'package:app__5/pages/equipment_detail.dart';
import 'package:app__5/pages/exersice_details.dart';

import 'package:app__5/widgets/exersice_card.dart';
import 'package:app__5/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Date and Time
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User Data
  final userData = user;
  //exersices and equipment data
  final exerciseLits = ExerciseData().exerciseList;
  final equipmentLits = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formattedDay = dayFormat.format(now);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${formattedDate.toUpperCase()} $formattedDay",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: kSubtitleColor,
                  ),
                ),
                Text(
                  "${userData.fullName}",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ProgressCard(
                    progressValue: userData.calculateCalories(), total: 100),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Today’s Activity",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExersiceDetails(
                                exersiceTitle: "Warmups",
                                exersiceDescription:
                                    "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                exersiceList: exerciseLits,
                              ),
                            ),
                          );
                        },
                        child: ExersiceCard(
                          title: "Warmup",
                          imageUrl: "assets/exercises/cobra.png",
                          description: "see more...",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EquipmentDetail(
                                eqList: equipmentLits,
                                eqTitle: "Equipment",
                                eqDescription:
                                    "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              ),
                            ),
                          );
                        },
                        child: ExersiceCard(
                          title: "Equipment",
                          imageUrl: "assets/equipments/dumbbells2.png",
                          description: "see more...",
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExersiceDetails(
                              exersiceTitle: "Exercises",
                              exersiceDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exersiceList: exerciseLits,
                            ),
                          ),
                        );
                      },
                      child: ExersiceCard(
                        title: "Exercise",
                        imageUrl: "assets/exercises/dragging.png",
                        description: "see more...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExersiceDetails(
                                exersiceTitle: "Stretching",
                                exersiceDescription:
                                    "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                exersiceList: exerciseLits,
                              ),
                            ));
                      },
                      child: ExersiceCard(
                        title: "Stretching",
                        imageUrl: "assets/exercises/yoga.png",
                        description: "see more...",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
