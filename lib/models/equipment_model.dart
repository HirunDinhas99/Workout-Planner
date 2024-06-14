class Equipment {
  final int id;
  final String equipmentName;
  final String equipmentImgUrl;
  final String equipmentDescription;
  final int noOfMinutes;
  final double noOfCalories;
  bool handOvered;
  bool favoriteEqui;

  Equipment(
      {required this.id,
      required this.equipmentName,
      required this.equipmentImgUrl,
      required this.noOfMinutes,
      required this.noOfCalories,
      required this.handOvered,
      required this.equipmentDescription,
      required this.favoriteEqui});
}
