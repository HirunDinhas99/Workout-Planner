import 'package:app__5/models/equipment_model.dart';
import 'package:app__5/models/exercise_model.dart';

class User {
  final String userId;
  final String firstName;
  final String fullName;
  final String gender;
  final String address;
  final int age;
  final String description;
  int totalExercisesCompleted = 0;
  int totalEquipmentsCompleted = 0;
  int totalFavorites = 0;
  int totalFavoritesEqu = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favoritEexerciseList;
  final List<Equipment> favoritEequipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.gender,
    required this.address,
    required this.age,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favoritEexerciseList,
    required this.favoritEequipmentList,
    required this.firstName,
  });

  //methods

  //to add new exersice to the exersiceList
  void addExersice(Exercise exercise) {
    exerciseList.add(exercise);
  }

  //to remove exersice from exersiceList
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  //to add new exersice to the exersiceList
  void addFavExersice(Exercise exercise) {
    favoritEexerciseList.add(exercise);
  }

  //to remove exersice from exersiceList
  void removeFavExercise(Exercise exercise) {
    favoritEexerciseList.remove(exercise);
  }
  ///////////////////////////

  // Method to add a new equipment to the user's equipment list
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  void addFavEquipment(Equipment equipment) {
    favoritEequipmentList.add(equipment);
  }

  void removeFavEquipment(Equipment equipment) {
    favoritEequipmentList.remove(equipment);
  }

  //Calculate the total minuites spent
  int calculateTheTotalMinuitesSpend() {
    int totalMinuitesSped = 0;
    //loop to the exercises list and calcuate no of miniutes
    for (var exercise in exerciseList) {
      totalMinuitesSped += exercise.noOfMinutes;
    }
    //loop to the equipment list and calcuate no of miniutes
    for (var equipment in equipmentList) {
      totalMinuitesSped += equipment.noOfMinutes;
    }
    return totalMinuitesSped;
  }

  //Mark As Completed
  void markExerAsCompleted(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((exercise) => exercise.id == exerciseId);
    exercise.completed = true;
    //remove from exersice list
    removeExercise(exercise);
    totalExercisesCompleted++;
  }

  void markAsHandoveres(int equipmentId) {
    final equipment =
        equipmentList.firstWhere((equipment) => equipment.id == equipmentId);

    equipment.handOvered = true;

    removeEquipment(equipment);
    totalEquipmentsCompleted++;
  }

  //calories burn
  double calculateCalories() {
    double totalCalories = 0;
    for (var equipment in equipmentList) {
      totalCalories += equipment.noOfCalories;
    }
    //convert totalCalories into 0-1
    if (totalCalories > 0 && totalCalories <= 10) {
      totalCalories /= 10; //5 >> 0.5
    }
    if (totalCalories > 10 && totalCalories <= 100) {
      totalCalories /= 100; //50 >> 0.5
    }
    if (totalCalories > 100 && totalCalories <= 1000) {
      totalCalories /= 1000; //500 >> 0.5
    }
    return totalCalories;
  }

  void removeFav(int exerciseId) {
    final exercise = favoritEexerciseList
        .firstWhere((exercise) => exercise.id == exerciseId);
    exercise.favorite = true;
    //remove from exersice list
    removeFavExercise(exercise);
    totalFavorites++;
  }

  void removeFavEq(int equipmentId) {
    final equipment = favoritEequipmentList
        .firstWhere((equipment) => equipment.id == equipmentId);
    equipment.favoriteEqui = true;

    removeFavEquipment(equipment);
    totalFavoritesEqu++;
  }
}
