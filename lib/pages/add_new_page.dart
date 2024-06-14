import 'package:app__5/constants/responsive.dart';
import 'package:app__5/data/equipment_data.dart';
import 'package:app__5/data/exersice_data.dart';
import 'package:app__5/data/user_data.dart';
import 'package:app__5/models/equipment_model.dart';
import 'package:app__5/models/exercise_model.dart';
import 'package:app__5/models/user_model.dart';
import 'package:app__5/widgets/add_equipment_card.dart';
import 'package:app__5/widgets/add_exersice_card.dart';
import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  User userData = user;
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,${user.firstName}",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Lets Add Some Workouts and Equipment for today!",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0193FC),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "All Exercises",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //List view to scroll horizontal =======>
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.41,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise exercise = exerciseList[index];
                    return AddExersiceCard(
                      exersiceTitle: exercise.exerciseName,
                      exersiceImg: exercise.exerciseImgUrl,
                      noOfMinutes: exercise.noOfMinutes,
                      isAdded: userData.exerciseList.contains(exercise),
                      isFav: userData.favoritEexerciseList.contains(exercise),
                      toggleAddExersice: () {
                        setState(() {
                          if (userData.exerciseList.contains(exercise)) {
                            userData.removeExercise(exercise);
                          } else {
                            userData.addExersice(exercise);
                          }
                        });
                      },
                      toggleFavExersice: () {
                        setState(() {
                          if (userData.favoritEexerciseList
                              .contains(exercise)) {
                            userData.removeFavExercise(exercise);
                          } else {
                            userData.addFavExersice(exercise);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Equipment",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //List view the scroll vertical |
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment equipment = equipmentList[index];
                    return AddEquipments(
                      equipmentName: equipment.equipmentName,
                      equipmentImageUrl: equipment.equipmentImgUrl,
                      equipmentDescription: equipment.equipmentDescription,
                      noOfMinuites: equipment.noOfMinutes,
                      noOfCalories: equipment.noOfCalories,
                      isAdded: userData.equipmentList.contains(equipment),
                      isFavorite:
                          userData.favoritEequipmentList.contains(equipment),
                      toggleAddEquipment: () {
                        setState(() {
                          userData.equipmentList.contains(equipment)
                              ? userData.removeEquipment(equipment)
                              : userData.addEquipment(equipment);
                        });

                        /*setState(() {
                          if (userData.equipmentList.contains(equipment)) {
                            
                            
                            userData.removeEquipment(equipment);
                          } else {
                            userData.addEquipment(equipment);
                          }
                        });*/
                      },
                      toggleAddFavoriteEquipment: () {
                        setState(() {
                          userData.favoritEequipmentList.contains(equipment)
                              ? userData.removeFavEquipment(equipment)
                              : userData.addFavEquipment(equipment);
                        });

                        /*setState(() {
                          if (userData.favoritEequipmentList
                              .contains(equipment)) {
                            userData.removeFavEquipment(equipment);
                          } else {
                            userData.addFavEquipment(equipment);
                          }
                        });*/
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
