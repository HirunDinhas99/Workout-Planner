class Exercise {
  final int id;
  final String exerciseName;
  final String exerciseImgUrl;
  final int noOfMinutes;
  bool completed;
  bool favorite;
  bool favoriteEqui;

  Exercise({
    required this.id,
    required this.exerciseName,
    required this.exerciseImgUrl,
    required this.noOfMinutes,
    required this.completed,
    required this.favorite,
    required this.favoriteEqui,
  });
}
