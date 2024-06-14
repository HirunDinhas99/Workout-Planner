import 'package:app__5/constants/colors.dart';
import 'package:app__5/constants/responsive.dart';
import 'package:app__5/data/equipment_data.dart';
import 'package:app__5/data/exersice_data.dart';
import 'package:app__5/data/user_data.dart';
import 'package:app__5/models/equipment_model.dart';
import 'package:app__5/models/exercise_model.dart';
import 'package:app__5/widgets/profile_card.dart';

import 'package:app__5/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kCardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minuies Spend: ${userData.calculateTheTotalMinuitesSpend().toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kMainDarkBlueColor,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Total Exercises Completed: ${userData.totalExercisesCompleted}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kMainBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Total Equipments Handovered: ${userData.totalEquipmentsCompleted}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kMainBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Your Exercises",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kMainDarkBlueColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.exerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise userExer = userData.exerciseList[index];
                    return ProfileCard(
                      taskName: userExer.exerciseName,
                      taskImg: userExer.exerciseImgUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markExerAsCompleted(userExer.id);
                        });
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Your Equipments",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kMainDarkBlueColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment userEqui = userData.equipmentList[index];
                    return ProfileCard(
                      taskName: userEqui.equipmentName,
                      taskImg: userEqui.equipmentImgUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markAsHandoveres(userEqui.id);
                        });
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
