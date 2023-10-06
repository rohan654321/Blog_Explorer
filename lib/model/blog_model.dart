class BlogModel {
  String? id;

  String? title;
  String? image;

  BlogModel({this.id, this.title, this.image});

  factory BlogModel.fromJSON(Map<String, dynamic> map) {
    return BlogModel(
      id: map["id"],
      title: map["title"],
      image: map["image_url"],
    );
  }
}
