class Post {
  String score;
  String image;
  String title;
  String description;
  dynamic locations;
  String releaseDate;
  String runningTime;
  String originalTitle;

  Post({
    required this.score,
    required this.image,
    required this.title,
    required this.description,
    required this.locations,
    required this.releaseDate,
    required this.runningTime,
    required this.originalTitle,
  });

  //Methode Class Model
  factory Post.fromMap(Map<String, dynamic> json) => Post(
        score: json["rt_score"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        locations: json["people"][0],
        releaseDate: json["release_date"],
        runningTime: json["running_time"],
        originalTitle: json["original_title"],
      );
}
