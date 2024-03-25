class LessonModel {
  final String title;
  final String description;
  final String image;

  LessonModel({
    required this.title,
    required this.description,
    this.image = '',
  });
}
