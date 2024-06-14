import 'package:app__5/models/equipment_model.dart';
import 'package:app__5/models/exercise_model.dart';
import 'package:app__5/models/user_model.dart';

User user = User(
  userId: "1234",
  firstName: "Hirun",
  fullName: "Hirun Dinhas",
  gender: "Male",
  address: "414/B Bulugahapitiya Eheliyagoda",
  age: 15,
  description: "Fitness enthusiast",
  exerciseList: [
    /*Exercise(
      exerciseName: "Push-ups",
      exerciseImgUrl: "assets/exercises/cobra.png",
      noOfMinutes: 15,
      id: 0,
      completed: false,
    ),
    Exercise(
      exerciseName: "Squats",
      exerciseImgUrl: "assets/exercises/downward-facing.png",
      noOfMinutes: 20,
      id: 1,
      completed: false,
    ),*/
  ],
  equipmentList: [
    /*Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "A pair of dumbbells for strength training exercises.",
      equipmentImgUrl: "assets/equipments/calendar.png",
      noOfMinutes: 30,
      noOfCalories: 2,
      handOvered: false,
    ),*/
  ],
  favoritEexerciseList: [],
  favoritEequipmentList: [],
);
