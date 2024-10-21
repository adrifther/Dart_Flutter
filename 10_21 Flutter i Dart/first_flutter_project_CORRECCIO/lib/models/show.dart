
class Show{
  int id;
  String name;
  List<String>? genres;

  Show({required this.id, required this.name, this.genres });

  factory Show.fromJson(Map<String,dynamic> json){
    return Show(
      id: json["id"],
      name: json["name"],
      genres: List.from(json["genres"])

    );
  }

}