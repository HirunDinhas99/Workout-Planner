import 'package:app__5/constants/colors.dart';
import 'package:app__5/constants/responsive.dart';
import 'package:app__5/models/exercise_model.dart';
import 'package:app__5/widgets/exersice_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExersiceDetails extends StatefulWidget {
  final String exersiceTitle;
  final String exersiceDescription;
  final List<Exercise> exersiceList;
  const ExersiceDetails({
    super.key,
    required this.exersiceTitle,
    required this.exersiceDescription,
    required this.exersiceList,
  });

  @override
  State<ExersiceDetails> createState() => _ExersiceDetailsState();
}

class _ExersiceDetailsState extends State<ExersiceDetails> {
  //Date and Time
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formattedDay = dayFormat.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "${formattedDate.toUpperCase()} $formattedDay",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: kSubtitleColor,
            ),
          ),
          Text(
            widget.exersiceTitle,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.exersiceDescription,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff3B3636),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Grid View
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                ),
                itemCount: widget.exersiceList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.exersiceList[index];
                  return ExersiceCard(
                    title: exercise.exerciseName,
                    imageUrl: exercise.exerciseImgUrl,
                    description: "${exercise.noOfMinutes} of Workout",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
