import 'package:app__5/constants/colors.dart';
import 'package:app__5/constants/responsive.dart';
import 'package:app__5/models/equipment_model.dart';
import 'package:app__5/widgets/equipment_card.dart';
import 'package:app__5/widgets/exersice_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EquipmentDetail extends StatefulWidget {
  final String eqTitle;
  final String eqDescription;
  final List<Equipment> eqList;
  const EquipmentDetail({
    super.key,
    required this.eqTitle,
    required this.eqDescription,
    required this.eqList,
  });

  @override
  State<EquipmentDetail> createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formattedDay = dayFormat.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              widget.eqTitle,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.eqDescription,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff3B3636),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 16 / 11,
                ),
                itemCount: widget.eqList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = widget.eqList[index];
                  return EquipmentCard(
                    equipmentName: equipment.equipmentName,
                    equipmentImgUrl: equipment.equipmentImgUrl,
                    equipmentDescription: equipment.equipmentDescription,
                    noOfMinutes: equipment.noOfMinutes,
                    noOfCalories: equipment.noOfCalories,
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
