// coverage:ignore-file
class CategoryModel {
  int? id;
  String? title;
  String? slug;
  String? imagen;
  int? state;

  CategoryModel({
    this.id,
    this.title,
    this.slug,
    this.imagen,
    this.state,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "imagen": imagen,
        "state": state,
      };

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        imagen: json["imagen"],
        state: json["state"],
      );
}
