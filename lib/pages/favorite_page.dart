import 'package:app__5/constants/colors.dart';
import 'package:app__5/constants/responsive.dart';
import 'package:app__5/data/equipment_data.dart';
import 'package:app__5/data/user_data.dart';
import 'package:app__5/models/equipment_model.dart';
import 'package:app__5/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User Data
  final userData = user;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formattedDay = dayFormat.format(now);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Here are all your favorited Workouts",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0193FC),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 16 / 25, //16 /19
                  ),
                  itemCount: userData.favoritEexerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise favExercise = userData.favoritEexerciseList[index];
                    return Card(
                      color: kCardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              favExercise.exerciseName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kMainBlackColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              favExercise.exerciseImgUrl,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${favExercise.noOfMinutes} Min Workout",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Exercise userEqui =
                                      userData.favoritEexerciseList[index];
                                  setState(() {
                                    userData.removeFav(userEqui.id);
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Here are all your favorited Equipment",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0193FC),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 16 / 36.7, //16/24
                  ),
                  itemCount: userData.favoritEequipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment favEquipment =
                        userData.favoritEequipmentList[index];
                    return Card(
                      color: kCardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              favEquipment.equipmentName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kMainBlackColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              favEquipment.equipmentImgUrl,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${favEquipment.noOfMinutes} Min Workout",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              favEquipment.equipmentDescription,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kSubtitleColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            IconButton(
                                onPressed: () {
                                  Equipment userEqui =
                                      userData.favoritEequipmentList[index];
                                  setState(() {
                                    userData.removeFavEq(userEqui.id);
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
